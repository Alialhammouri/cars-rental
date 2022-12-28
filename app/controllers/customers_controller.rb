class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ update destroy ]
	
	def main_page
	end


	def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to manage_customers_path, notice: "Customer was successfully updated." }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

	def destroy
		@customer.destroy

    respond_to do |format|
      format.html { redirect_to manage_customers_path, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end


	private

	def customer_params
      params.require(:customer).permit(:email, :password, :first_name, :last_name, :phone_number, :address, :national_id, :birth_date, :verified)
  end


	def set_customer
		@customer = Customer.find(params[:id])
	end

	
end
