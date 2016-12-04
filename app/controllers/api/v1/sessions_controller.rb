module Api
  module V1
    class SessionsController < Devise::SessionsController
      protect_from_forgery with: :null_session
      prepend_before_filter :require_no_authentication, :only => [:create]
      before_filter :load_user_by_email

      def create
        if @user.valid_password?(params[:password])
          sign_in @user
          render json: { _unbxd_console_session: cookies['_unbxd_console_session'], notice: t('.success') }, status: :ok
        else
          render json: { alert: t(:invalid_email_password) }, status: :unauthorized
        end
      end

      protected
        def load_user_by_email
          @user = User.find_by(email: params[:email])
          unless @user
            render json: { alert: t(:invalid_email_password) }, status: :unauthorized
          end
        end
    end
  end
end
