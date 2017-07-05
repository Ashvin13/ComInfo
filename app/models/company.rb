class Company < ApplicationRecord
	attr_accessor :image
	mount_uploader :image, ImageUploader

	has_many :users, :dependent => :destroy
  	accepts_nested_attributes_for :users

  	validates_presence_of :regno
  	validates_presence_of :cname
  	validates_presence_of :startdate
  	validates_presence_of :enddate
end
