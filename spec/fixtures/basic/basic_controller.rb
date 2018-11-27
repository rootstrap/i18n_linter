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
    Car.create!(car_params)
    render_create_success
  end

  def update
    @car.update!(car_params)
    render_update_success
  end

  def destroy
    @car.destroy!
    render_destroy_success
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand)
  end

  def render_update_success
    render status: :ok, json: { message: 'car was successfully updated.' }
  end

  def render_create_success
    render status: :ok, json: { message: 'Car was successfully created.' }
  end

  def render_destroy_success
    render status: :ok, json: { message: 'Destroyed.' }
  end
end
