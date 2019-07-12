# frozen_string_literal: true

module Api
  module V1
    # class controller for articles
    class AccountsController < ApplicationController
      include AuthenticationConcern
      before_action :authorize_request, except: :create
      before_action :find_user, except: :create
      def create
        user = User.new(user_params)
        if user.save
          render json: user.as_json(only: %i[id email name]), status: :created
        else
          render json: { errors: user.errors.full_messages.first },
                 status: :unprocessable_entity
        end
      end

      def update
        if @user&.update(user_params)
          render json: @user
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        render json: @user, status: :ok
      end

      private

      def find_user
        @user = User.find_by(email: user_params[:email])
      end

      def user_params
        params.permit(:email, :name, :password,
                      :password_confirmation)
      end
    end
  end
end
