# frozen_string_literal: true

module Users
  # Override controller to allow fullname and username
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :authenticate_user!
    skip_before_action :authenticate_user!, only: [:create]

    def sign_up_params
      params.permit([*params_for_resource(:sign_up), :fullname, :username])
    end
  end
end
