# frozen_string_literal: true

module Api
  module V1
    class KeyResultsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_key_result, only: %I[show update destroy]

      # GET /key_results
      def index
        render json: current_user.key_results
      end

      # GET /key_results/1
      def show
        render json: @key_result
      end

      # POST /key_results
      def create
        @key_result = KeyResult.new(key_result_params)
        if @key_result.save
          render json: @key_result, status: :created, location: api_v1_key_result_url(@key_result)
        else
          render json: @key_result.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /key_results/1
      def update
        if @key_result.update(key_result_params)
          render json: @key_result
        else
          render json: @key_result.errors, status: :unprocessable_entity
        end
      end

      # DELETE /key_results/1
      def destroy
        @key_result.destroy
      end

      private

      def set_key_result
        @key_result = KeyResult.find(params[:id])
      end

      def key_result_params
        params.require(:key_result).permit(:goal_id, :title, :key_result_status_id)
      end
    end
  end
end
