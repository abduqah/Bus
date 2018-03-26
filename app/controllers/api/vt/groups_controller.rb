module Api
  module Vt
    class GroupsController < ApplicationController
      def index
        @institution = Institution.find(params[:id])
        @driver = @institution.drivers
        @groups = Group.order('created_at DESC')        
        render json: {status: 'Success', message: 'loaded institutions', data: @groups},status: :ok

      end

      def show
        @group = Group.find(params[:id]);
        render json: {status: 'Success', message: 'loaded institutions', data: @group},status: :ok
      end

      def create
        @group = Group.new(group_params)
        if @group.save
          render json: {status: 'Success', message: 'group saved', data: @group},status: :ok
        else
          render json: {status: 'ERROR', message: 'group not saved', data: @group.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @group = Group.find(params[:id])
        @group.destroy
        if @group.save
          render json: {status: 'Success', message: 'deleted group', data: @group},status: :ok
        else
          render json: {status: 'ERROR', message: 'group not deleted', data: @group.errors},status: :unprocessable_entity
        end
      end

      def update
        @group = Group.find(params[:id])
        if @group.update_attributes(group_params)
          render json: {status: 'Success', message: 'group updated', data: @group},status: :ok
        else
          render json: {status: 'ERROR', message: 'group not updated', data: @group.errors},status: :unprocessable_entity
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