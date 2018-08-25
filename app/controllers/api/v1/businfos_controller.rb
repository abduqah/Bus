module Api
  module V1
    class BusinfosController < ApplicationController
      def index
        @inst = Institution.find(params[:institution_id])
        @lift = @inst.lifts.find(params[:lift_id])
        @buses = @lift[:businfo]
        render json: {status: 'Success', message: 'loaded bus', data: @buses},status: :ok

      end

      def show
        @inst = Institution.find(params[:institution_id])
        @bus = @inst.businfos.find(params[:id])
        render json: {status: 'Success', message: 'loaded bus', data: @bus},status: :ok
      end

      def create
        @inst = Institution.find(params[:institution_id])
        @lift = @inst.lifts.find(params[:lift_id])
        @bus = @inst.businfos.new(bus_params)
        @lift.businfo.add(@bus)
        if @bus.save
          render json: {status: 'Success', message: 'bus saved', data: @bus},status: :ok
        else
          render json: {status: 'ERROR', message: 'bus not saved', data: @bus.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @inst = Institution.find(params[:id])
        @bus = @inst.businfos.find(params[:id])
        @bus.destroy
        if @bus.save
          render json: {status: 'Success', message: 'deleted bus', data: @bus},status: :ok
        else
          render json: {status: 'ERROR', message: 'bus not deleted', data: @bus.errors},status: :unprocessable_entity
        end
      end

      def update
        @inst = Institution.find(params[:id])
        @bus = @inst.businfos.find(params[:id])
        if @bus.update_attributes(bus_params)
          render json: {status: 'Success', message: 'bus updated', data: @bus},status: :ok
        else
          render json: {status: 'ERROR', message: 'bus not updated', data: @bus.errors},status: :unprocessable_entity
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