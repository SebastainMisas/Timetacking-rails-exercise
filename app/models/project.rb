class Project < ActiveRecord::Base
	has_many :entries 
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: { maximum: 30 }
	validates :description, presence: true
end
