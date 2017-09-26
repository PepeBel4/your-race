class ApplicationController < ActionController::API
	include Response
	include ExceptionHandler

	#private
  	# Define unauthorized access json response
    #  def unauthorized_entity(entity_name)
    #      render json: { error: "Unauthorized request" }, status:     
    #      :unauthorized
    #  end
end
