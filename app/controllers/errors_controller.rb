class ErrorsController < ApplicationController
	#the errors controller. simply reroutes to the 404 page if the user
	#gets off course 
  def error404
    render status: :not_found
  end
end