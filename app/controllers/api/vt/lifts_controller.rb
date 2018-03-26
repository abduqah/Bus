module Api
  module Vt
    class LiftsController < ApplicationController
      def index
        @lifts = Lift.order('created_at DESC')        
        render json: {status: 'Success', message: 'loaded institutions', data: @lifts},status: :ok

      end

      def show
        @lift = Lift.find(params[:id]);
        render json: {status: 'Success', message: 'loaded institutions', data: @lift},status: :ok
      end

      def create
        @lift = Lift.new(lift_params)
        if @lift.save
          render json: {status: 'Success', message: 'lift saved', data: @lift},status: :ok
        else
          render json: {status: 'ERROR', message: 'lift not saved', data: @lift.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @lift = Lift.find(params[:id])
        @lift.destroy
        if @lift.save
          render json: {status: 'Success', message: 'deleted lift', data: @lift},status: :ok
        else
          render json: {status: 'ERROR', message: 'lift not deleted', data: @lift.errors},status: :unprocessable_entity
        end
      end

      def update
        @lift = Lift.find(params[:id])
        if @lift.update_attributes(lift_params)
          render json: {status: 'Success', message: 'lift updated', data: @lift},status: :ok
        else
          render json: {status: 'ERROR', message: 'lift not updated', data: @lift.errors},status: :unprocessable_entity
        end
      end

      private
      def institution_params
        params.permit(:name, :location, :about)
      end

      def lift_params
        params.permit(:from_to, :location, :shareable)
      end

      def bus_params
        params.permit(:busID)
      end

      def driver_params
        params.permit(:licence)
      end

      def group_params
        params.permit(:gid)
      end

      def parent_params
        params.permit(person_params)
      end

      def student_params
        params.permit(person_params)
      end

      def teacher_params
        params.permit(person_params, :degree, :position)
      end

      def person_params
        params.permit(:nid, :name, :email, :phoneN, :live_in,)
      end
    end
  end
end