class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	validates :name, presence: true
	validates :description, presence: true
end

