class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show; end

  def new
    @car = Car.new
  end

  def edit; end

  def create
    if Car.create!(car_params)
      render_create_success
    else
      render_create_error
    end
  end

  def update
    @car.update!(car_params)
    render_update_success
  end

  def destroy
    @car.destroy!
    render_destroy_success
  end

  def sample_method
    # Testing MiddleSpace rule
    interpolated_string = 'string var'
    # Testing interpolated strings and Query rule
    sample_var = "This is a #{interpolated_string}"

    puts sample_var
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand)
  end

  def render_update_success
    # Testing MiddleSpace rule
    render status: :ok, json: { message: 'car was successfully updated.' }
  end

  def render_create_success
    # Testing Uppercase and MiddleSpace rules
    render status: :ok, json: { message: 'Car was successfully created.' }
  end

  def render_destroy_success
    # Testing Uppercase rule
    render status: :ok, json: { message: 'Destroyed.' }
  end

  def render_create_error
    # Testing the negativity of Uppercase and MiddleSpace rules
    render status: :ok, json: { message: 'error' }
  end
end
