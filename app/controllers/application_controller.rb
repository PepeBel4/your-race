require 'pubnub'

class ApplicationController < ActionController::API
	include Response
	include ExceptionHandler

	#private
  	# Define unauthorized access json response
    #  def unauthorized_entity(entity_name)
    #      render json: { error: "Unauthorized request" }, status:     
    #      :unauthorized
    #  end

    def mypubnub
	Pubnub.new(
		publish_key: 'pub-c-b06ac705-6638-4946-af1f-da17d43c519e',
   		subscribe_key: 'sub-c-f2672bfe-a75e-11e7-ad87-6e294738eb45',
		:ssl => true
)
end
end
