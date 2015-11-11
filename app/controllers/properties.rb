helpers PropertiesHelper

#render a property
get '/properties/new' do
	erb :'properties/new'
end

#create roperties
post '/properties' do
	@user = current_user
	@property = Property.new(params[:property])

	if @property.save
		redirect to "/properties/#{@property.id}"
	else
		erb :'properties/new'
	end
end

#show properties
get '/properties/:id' do
	@user = current_user
	@property = find_property
	@user_property = User.find_by(id: @property.user_id)
	#insert code to show the comment as well 
	#Eg. @answers = Answer.where(question_id: params[:id])
	erb :'properties/show'
end

#render update properties
get '/properties/:id/edit' do
	@property = find_property
	erb :'properties/edit'
end

#update the property
put '/properties/:id' do
	@property = find_property
	if @property.update(params[:property])
		redirect to "/properties/#{@property.id}"
	else
		erb :'properties/edit'
	end
end

#delete properties
delete '/properties/:id' do
	@property = Property.find_by(id: params[:id])
	@property.destroy
	redirect to '/'
end