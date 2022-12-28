class OfficesController < ApplicationController
  before_action :configure_sign_up_params, only: [:create]
	before_action :set_office, only: %i[ index show edit update own_cars ]

	def index
	end

	def show
	end

	def own_cars
	end

	# def create
  #   @office = Office.new(office_params)

  #   respond_to do |format|
  #     if @office.save
  #       format.html { redirect_to @office, notice: 'Office was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @office }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @office.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def sign_up_params
  	devise_parameter_sanitizer.for(:sign_up).push(:name)
 	end


	private

	def set_office
    @office = Office.find(current_office.id)
  end

  # def office_params
  # 	params.require(:office).permit(:email, :password, :name, :phone_number, :address, :verified)
  # end

end
