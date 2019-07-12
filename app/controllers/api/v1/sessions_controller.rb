# frozen_string_literal: true

module Api
  module V1
    # class controller for articles
    class SessionsController < ApplicationController
      include JsonWebToken
      def create
        user = User.find_by(email: session_params[:email])
        if user&.valid_password?(session_params[:password])
          user.authentication_update
          token = JsonWebToken.encode(user_id: user.id)
          time = Time.now + 24.hours.to_i
          render json: { user: user.as_json(
            only: %i[id email name]
          ), token: token, exp: time.strftime('%m-%d-%Y %H:%M') },
                 status: :created
        else
          head :unauthorized
        end
      end

      private

      def session_params
        params.permit(:email, :password)
      end
    end
  end
end
