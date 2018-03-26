module Api
  module Vt
    class ParentsController < ApplicationController
      def index
        @parents = Parent.order('created_at DESC')        
        render json: {status: 'Success', message: 'loaded institutions', data: @parents},status: :ok

      end

      def show
        @parent = Parent.find(params[:id]);
        render json: {status: 'Success', message: 'loaded institutions', data: @parent},status: :ok
      end

      def create
        @parent = Parent.new(parent_params)
        if @parent.save
          render json: {status: 'Success', message: 'parent saved', data: @parent},status: :ok
        else
          render json: {status: 'ERROR', message: 'parent not saved', data: @parent.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @parent = Parent.find(params[:id])
        @parent.destroy
        if @parent.save
          render json: {status: 'Success', message: 'deleted parent', data: @parent},status: :ok
        else
          render json: {status: 'ERROR', message: 'parent not deleted', data: @parent.errors},status: :unprocessable_entity
        end
      end

      def update
        @parent = Parent.find(params[:id])
        if @parent.update_attributes(parent_params)
          render json: {status: 'Success', message: 'parent updated', data: @parent},status: :ok
        else
          render json: {status: 'ERROR', message: 'parent not updated', data: @parent.errors},status: :unprocessable_entity
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