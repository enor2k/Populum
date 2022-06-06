class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def question_labels(question)
    @question_labels = Option.where(question_id: question.id).map(&:title)
    # byebug
  end
  helper_method :question_labels

  def question_values(question)
    @question_values = Answer.where(question_id: question.id).map { |a| Option.find(a.option_id).title }
                      Answer.where(question_id:9)             .map{|a| Option.find(a.option_id).title}
    # byebug
  end
  helper_method :question_values



  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :avatar, :gender, :birthday])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :avatar, :gender, :birthday])
  end
end
