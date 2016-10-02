class ErrorsController < ApplicationController
  #layout false, only: [:error404]    
  def error404
    render status: :not_found
  end
end
