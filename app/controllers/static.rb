helpers SessionsHelper

get '/' do
	@user = current_user
	@property = Property.all
	@all_users = User.all
	erb :"static/index"
end