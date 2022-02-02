# frozen_string_literal: true

module Api
  module V1
    class GoalsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_goal, only: %I[show update destroy]

      # GET /goals
      def index
        @goals = current_user.goals.order('created_at ASC')
        render json: @goals.map { |goal| data_presenter(goal) }
      end

      # GET /goals/1
      def show
        render json: data_presenter(@goal)
      end

      # POST /goals
      def create
        @goal = Goal.new(goal_params)
        @goal.user_id = params[:user_id] || current_user.id
        if @goal.save
          render json: @goal, status: :created, location: api_v1_goal_url(@goal)
        else
          render json: @goal.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /goals/1
      def update
        @goal = Goal.find(params[:id])
        if @goal.update(goal_params)
          render json: @goal
        else
          render json: @goal.errors, status: :unprocessable_entity
        end
      end

      # DELETE /goals/1
      def destroy
        @goal.destroy
      end

      private

      def data_presenter(goal)
        {
          title: goal.title,
          start_date: goal.start_date,
          end_date: goal.end_date,
          progress: goal.progress
        }
      end

      def set_goal
        @goal = Goal.find(params[:id])
      end

      def goal_params
        params.require(:goal).permit(:title, :start_date, :end_date, :user_id)
      end
    end
  end
end
