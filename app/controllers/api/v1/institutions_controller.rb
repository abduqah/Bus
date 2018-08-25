module Api
  module V1
    class InstitutionsController < ApplicationController
      def index
        @institutions = Institution.order('created_at DESC')        
        render json: {status: 'Success', message: 'loaded institutions', data: @institutions},status: :ok

      end

      def show
        @institution = Institution.find(params[:id]);
        render json: {status: 'Success', message: 'loaded institutions', data: @institution},status: :ok
      end

      def create
        @institution = Institution.new(institution_params)
        if @institution.save
          render json: {status: 'Success', message: 'institution saved', data: @institution},status: :ok
        else
          render json: {status: 'ERROR', message: 'institution not saved', data: @institution.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @institution = Institution.find(params[:id])
        @institution.destroy
        if @institution.save
          render json: {status: 'Success', message: 'deleted institution', data: @institution},status: :ok
        else
          render json: {status: 'ERROR', message: 'institution not deleted', data: @institution.errors},status: :unprocessable_entity
        end
      end

      def update
        @institution = Institution.find(params[:id])
        if @institution.update_attributes(institution_params)
          render json: {status: 'Success', message: 'institution updated', data: @institution},status: :ok
        else
          render json: {status: 'ERROR', message: 'institution not updated', data: @institution.errors},status: :unprocessable_entity
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