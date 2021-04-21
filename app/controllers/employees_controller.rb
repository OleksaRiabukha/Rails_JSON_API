class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_employee, only: %i[show update destroy]

  def index
    @employees = Employee.all
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render :show
    else
      render json: { errors: @employee.errors }, status: :unprocessable_entity 
    end
  end

  def show
  end

  def update
    if @employee.update(employee_params)
      render :show
    else
      render json: { errors: @employee.errors }, status: :unprocessable_entity 
    end
  end

  def destroy
    @employee.destroy
    head :no_content
  end

  private

  def employee_params
    params.permit(:first_name, :last_name, :salary)
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end
end
