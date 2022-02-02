# frozen_string_literal: true

require 'web_token'

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        @user = User.where(email: params[:email]).first
        if @user&.valid_password?(params[:password])
          jwt = WebToken.encode(@user)
          render :create, status: :created, locals: { token: jwt }
        else
          render json: { error: 'invalid_credentials' }, status: :unauthorized
        end
      end

      def destroy
        if nilify_token && current_user.save
          head(:ok)
        else
          head(:unauthorized)
        end
      end

      private

      def nilify_token
        current_user&.authentication_token = nil
      end
    end
  end
end
