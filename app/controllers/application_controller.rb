class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def authenticate_admin_user!
        current_user.admin?
    end

    def after_sign_in_path_for(_resource_or_scope)
        apartments_path
    end

    def after_sign_out_path_for(_resource_or_scope)
      root_path
    end
end
