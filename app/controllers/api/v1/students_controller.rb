module Api
  module Vt
    class StudentsController < ApplicationController
      def index
        @students = Student.order('created_at DESC')        
        render json: {status: 'Success', message: 'loaded students', data: @students},status: :ok

      end

      def show
        @student = Student.find(params[:id]);
        render json: {status: 'Success', message: 'loaded students', data: @student},status: :ok
      end

      def create
        @student = Student.new(student_params)
        if @student.save
          render json: {status: 'Success', message: 'student saved', data: @student},status: :ok
        else
          render json: {status: 'ERROR', message: 'student not saved', data: @student.errors},status: :unprocessable_entity
        end
      end

      def destroy
        @student = Student.find(params[:id])
        @student.destroy
        if @student.save
          render json: {status: 'Success', message: 'deleted student', data: @student},status: :ok
        else
          render json: {status: 'ERROR', message: 'student not deleted', data: @student.errors},status: :unprocessable_entity
        end
      end

      def update
        @student = Student.find(params[:id])
        if @student.update_attributes(student_params)
          render json: {status: 'Success', message: 'student updated', data: @student},status: :ok
        else
          render json: {status: 'ERROR', message: 'student not updated', data: @student.errors},status: :unprocessable_entity
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