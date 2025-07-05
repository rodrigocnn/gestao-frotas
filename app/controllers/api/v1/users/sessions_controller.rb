module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        respond_to :json

        # Desativa funcionalidades que dependem de sessão

        skip_before_action :require_no_authentication, only: [ :create ]


        private

        def respond_with(resource, _opts = {})
          token, _payload = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil)

          render json: {
            user: resource,
            token: token,
            message: "Login realizado com sucesso."
          }, status: :ok
        end

        def respond_to_on_destroy
          render json: { message: "Logout realizado com sucesso." }, status: :ok
        end
      end
    end
  end
end
