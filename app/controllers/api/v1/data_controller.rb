module Api
  module V1
    class DataController < ApplicationController
      def index
        lifts = Lift.all;
        render json: {status: 'Success', message: 'loaded lifts', data: lifts},status: :ok
        # institutions = Institution.all;
        # businfos = Businfo.all;
        # drivers = Driver.all;
        # groups = Group.all;
        # parents = Parent.all;
        # students = Student.all;
        # teachers = Teacher.all;
      end

      def show
        lift = Lift.find(params[:id]);
        render json: {status: 'Success', message: 'loaded lift', data: lift},status: :ok
      end

      def create
        lift =Lift.new(lift_params)
        if lift.save
          render json: {status: 'Success', message: 'lift saved', data: lift},status: :ok
        else
          render json: {status: 'ERROR', message: 'lift not saved', data: lift.errors},status: :unprocessable_entity
        end
      end

      def destroy
        lift = Lift.find(params[:id])
        lift.destroy
        if lift.save
          render json: {status: 'Success', message: 'deleted lift', data: lift},status: :ok
        else
          render json: {status: 'ERROR', message: 'lift not deleted', data: lift.errors},status: :unprocessable_entity
        end

      end

      def update
        lift = Lift.find(params[:id])
        if lift.update_attributes(lift_params)
          render json: {status: 'Success', message: 'lift updated', data: lift},status: :ok
        else
          render json: {status: 'ERROR', message: 'lift not updated', data: lift.errors},status: :unprocessable_entity
        end
      end

      private
      def lift_params
        params.permit(:from_to, :location, :shareable)
      end
    end
  end
end