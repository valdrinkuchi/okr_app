# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!, only: [:update]

      def create
        @user = User.new(user_params)
        if @user.save
          render :create
        else
          head(:unprocessable_entity)
        end
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
      end
    end
  end
end
