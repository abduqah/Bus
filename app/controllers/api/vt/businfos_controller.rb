module Api
  module Vt
    class BusinfosController < ApplicationController
      def index
        @buses = Businfo.all       
        render json: {status: 'Success', message: 'loaded institutions', data: @buses},status: :ok

      end

      def show
        @bus = Businfo.find(params[:id]);
        render json: {status: 'Success', message: 'loaded institutions', data: @bus},status: :ok
      end

      def create
        @bus = Businfo.new(bus_params)
        if @bus.save
          render json: {status: 'Success', message: 'lift saved', data: @bus},status: :ok
        else
          render json: {status: 'ERROR', message: 'lift not saved', data: @bus.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @bus = Businfo.find(params[:id])
        @bus.destroy
        if @bus.save
          render json: {status: 'Success', message: 'deleted lift', data: @bus},status: :ok
        else
          render json: {status: 'ERROR', message: 'lift not deleted', data: @bus.errors},status: :unprocessable_entity
        end
      end

      def update
        @bus = Businfo.find(params[:id])
        if @bus.update_attributes(bus_params)
          render json: {status: 'Success', message: 'lift updated', data: @bus},status: :ok
        else
          render json: {status: 'ERROR', message: 'lift not updated', data: @bus.errors},status: :unprocessable_entity
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