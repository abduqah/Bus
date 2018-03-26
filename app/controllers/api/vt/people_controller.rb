module Api
  module Vt
    class PeopleController < ApplicationController
      def index
        @institution = Institution.find(params[:id])
        @person = @institution.person.order('created_at DESC')        
        render json: {status: 'Success', message: 'loaded people', data: @person},status: :ok

      end

      def show
        @institution = Institution.find(params[:id])
        @person = @institution.person.find(params[:id]);
        render json: {status: 'Success', message: 'loaded person', data: @person},status: :ok
      end

      def create
        @institution = Institution.find(params[:id])
        @person = @institution.person.new(person_params)
        if @person.save
          render json: {status: 'Success', message: 'person saved', data: @person},status: :ok
        else
          render json: {status: 'ERROR', message: 'person not saved', data: @person.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @institution = Institution.find(params[:id])
        @person = @institution.person.find(params[:id])
        @person.destroy
        if @person.save
          render json: {status: 'Success', message: 'deleted person', data: @person},status: :ok
        else
          render json: {status: 'ERROR', message: 'person not deleted', data: @person.errors},status: :unprocessable_entity
        end
      end

      def update
        @person = Person.find(params[:id])
        if @person.update_attributes(person_params)
          render json: {status: 'Success', message: 'person updated', data: @person},status: :ok
        else
          render json: {status: 'ERROR', message: 'person not updated', data: @person.errors},status: :unprocessable_entity
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