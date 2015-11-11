class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :properties

	validates :email, uniqueness: true, presence: true, 
		format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ }
	validates :username, presence: true
	validates :password, presence: true

	def self.authenticate(username, password)
		user = User.find_by(username: username)
		if user && user.password == password
			return user
		else
			nil
		end		
	end
end

