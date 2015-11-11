get '/login' do
	erb :'sessions/login'
end

post '/login' do
	# byebug
	@user = User.authenticate(params[:username], params[:password])
	if @user
		session[:user_id] = @user_id
		redirect to "/"
	else
		@message = "Username does not exist or password is invalid"
		erb :'sessions/login'
	end
end

delete '/logout' do
	session[:user_id] = nil
	redirect to "/"
end