class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy show_images ]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to own_cars_path, notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_path(@car), notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_images
  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to own_cars_path, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:car_plate_number, :manufacturer, :model, :manufacture_year, :color, :renting_price, :available, :office_id, :photos => [])
  end

end
