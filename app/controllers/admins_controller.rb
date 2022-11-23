class AdminsController < ApplicationController

  def index
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin_user = User.new(admin_params)

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to @admin_user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_user }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_customer
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

end
