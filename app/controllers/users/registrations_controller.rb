# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    tweets_path
  end
end
