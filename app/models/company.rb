class Company < ApplicationRecord
	has_many :users, :dependent => :destroy
  	accepts_nested_attributes_for :users

  	validates_presence_of :regno
  	validates_presence_of :cname
  	validates_presence_of :startdate
  	validates_presence_of :enddate
end
