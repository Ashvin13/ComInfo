class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :image
  mount_uploader :image, ImageUploader
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	belongs_to :company

	validates :uname, :uniqueness => {:case_sensitive => false},
  	format: { with: /\A[a-zA-Z0-9]*\z/ }
  validates_presence_of :name
  validates_presence_of :date_of_birth
  validates_presence_of :image

	USER_TYPES = ['Worker', 'Manager']

	USER_ROLE = ['Owner', 'Worker', 'Manager']

	# USER_TYPES = [[ 'key' => 0, 'value' => 'Owner'],[ 'key' => 1, 'value' => 'Worker'],['key' => 2, 'value' => 'Manager']]
end
