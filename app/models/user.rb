class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	belongs_to :company

	validates :uname, :uniqueness => {:case_sensitive => false},
  	format: { with: /\A[a-zA-Z0-9]*\z/ }
	validates_presence_of :user_type

	USER_TYPES = ['Owener','Worker', 'Manager']
end
