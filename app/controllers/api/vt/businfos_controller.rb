module Api
  module Vt
    class BusinfosController < ApplicationController
      def index
        @institution = Institution.find(params[:id])
        @buses = @institution.businfo.all       
        render json: {status: 'Success', message: 'loaded bus', data: @buses},status: :ok

      end

      def show
        @institution = Institution.find(params[:id])
        @bus = @institution.businfos.find(params[:id]);
        render json: {status: 'Success', message: 'loaded bus', data: @bus},status: :ok
      end

      def create
        @institution = Institution.find(params[:id])
        @bus = @institution.businfos.new(bus_params)
        if @bus.save
          render json: {status: 'Success', message: 'bus saved', data: @bus},status: :ok
        else
          render json: {status: 'ERROR', message: 'bus not saved', data: @bus.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @institution = Institution.find(params[:id])
        @bus = @institution.businfos.find(params[:id])
        @bus.destroy
        if @bus.save
          render json: {status: 'Success', message: 'deleted bus', data: @bus},status: :ok
        else
          render json: {status: 'ERROR', message: 'bus not deleted', data: @bus.errors},status: :unprocessable_entity
        end
      end

      def update
        @institution = Institution.find(params[:id])
        @bus = @institution.businfos.find(params[:id])
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