module Api
  module Vt
    class TeachersController < ApplicationController
      def index
        @teachers = Teacher.order('created_at DESC')        
        render json: {status: 'Success', message: 'loaded teachers', data: @teachers},status: :ok

      end

      def show
        @teacher = Teacher.find(params[:id]);
        render json: {status: 'Success', message: 'loaded teachers', data: @teacher},status: :ok
      end

      def create
        @teacher = Teacher.new(teacher_params)
        if @teacher.save
          render json: {status: 'Success', message: 'teacher saved', data: @teacher},status: :ok
        else
          render json: {status: 'ERROR', message: 'teacher not saved', data: @teacher.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @teacher = Teacher.find(params[:id])
        @teacher.destroy
        if @teacher.save
          render json: {status: 'Success', message: 'deleted teacher', data: @teacher},status: :ok
        else
          render json: {status: 'ERROR', message: 'teacher not deleted', data: @teacher.errors},status: :unprocessable_entity
        end
      end

      def update
        @teacher = Teacher.find(params[:id])
        if @teacher.update_attributes(teacher_params)
          render json: {status: 'Success', message: 'teacher updated', data: @teacher},status: :ok
        else
          render json: {status: 'ERROR', message: 'teacher not updated', data: @teacher.errors},status: :unprocessable_entity
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
        params.permit(:person_params)
      end

      def student_params
        params.permit(:person_params)
      end

      def teacher_params
        params.permit(:person_params, :degree, :position)
      end

      def person_params
        params.permit(:nid, :name, :email, :phoneN, :live_in,)
      end
    end
  end
end