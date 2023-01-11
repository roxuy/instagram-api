module Users
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def sign_up_params
        params.permit([*params_for_resource(:sign_up), :fullname, :username])
    end
  end  
end
