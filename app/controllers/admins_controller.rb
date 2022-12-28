class AdminsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => %i[ create update ]
  before_action :set_admin, only: %i[ show edit update destroy ]

  def index
    @admin = current_admin
  end

  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        sign_in :admin, @admin, bypass: true
        format.html { redirect_to admins_path, notice: "Admin was successfully updated." }
        format.json { render action: 'show', status: :created, location: @admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @admin = Admin.new
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
  end

  def show_admins
  end

  def verify_customer
    @customer = Customer.find_by(id: params[:id])
    @customer.update(verified: true)
  end

  def manage_customers
  end

  def manage_offices
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end


end
