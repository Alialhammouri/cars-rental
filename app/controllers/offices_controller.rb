class OfficesController < ApplicationController
	before_action :set_office, only: %i[show destroy update verify_office]

	def index
    @office = current_office
	end

  def personal_information
    @office = current_office
    redirect_to offices_path if @office.name.present? && @office.phone_number.present? && @office.address.present?
  end

  def update_personal_information
    @office = current_office
  end


	def own_cars
    @office = current_office
	end

  def booked_cars
    @office = current_office
  end

  def update
    respond_to do |format|
      if @office.update(office_params)
        sign_in :office, @office, bypass: true
        format.html { redirect_to offices_path, notice: "Office was successfully updated." }
        format.json { render action: 'show', status: :created, location: @office }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to manage_offices_path, notice: "Office was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def verify_office
    @office.update_columns(verified: true)
    redirect_back(fallback_location: manage_offices_path)
  end

	private

	def set_office
    @office = Office.find_by(id: params[:id])
  end

  def office_params
    params.require(:office).permit(:name, :phone_number, :address, :verified)
  end

end
