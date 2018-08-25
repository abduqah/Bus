module Api
  module Vt
    class DriversController < ApplicationController
      def index
        @drivers = Driver.order('created_at DESC')        
        render json: {status: 'Success', message: 'loaded drivers', data: @drivers},status: :ok

      end

      def show
        @driver = Driver.find(params[:id]);
        render json: {status: 'Success', message: 'loaded drivers', data: @driver},status: :ok
      end

      def create
        @driver = Driver.new(Driver_params)
        if @driver.save
          render json: {status: 'Success', message: 'Driver saved', data: @driver},status: :ok
        else
          render json: {status: 'ERROR', message: 'Driver not saved', data: @driver.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @driver = Driver.find(params[:id])
        @driver.destroy
        if @driver.save
          render json: {status: 'Success', message: 'deleted Driver', data: @driver},status: :ok
        else
          render json: {status: 'ERROR', message: 'Driver not deleted', data: @driver.errors},status: :unprocessable_entity
        end
      end

      def update
        @driver = Driver.find(params[:id])
        if @driver.update_attributes(Driver_params)
          render json: {status: 'Success', message: 'Driver updated', data: @driver},status: :ok
        else
          render json: {status: 'ERROR', message: 'Driver not updated', data: @driver.errors},status: :unprocessable_entity
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