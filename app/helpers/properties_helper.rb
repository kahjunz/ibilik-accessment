module PropertiesHelper

	def find_property
		Property.find_by(id: params[:id])
	end

end