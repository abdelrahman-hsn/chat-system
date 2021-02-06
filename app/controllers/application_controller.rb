class ApplicationController < ActionController::API

  private

  def set_application
    @application = Application.find_by_token(params[:application_token])
  end
end
