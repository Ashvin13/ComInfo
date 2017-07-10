class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    Rack::MiniProfiler.step("fetch companies") do
      @companies = Company.all
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    # @comp_manager = User.joins(:company).where("company_id = ? and user_type = ?", params[:id], "Manager").count
    # @comp_worker = User.joins(:company).where("company_id = ? and user_type = ?", params[:id], "Worker").count
  end

  # GET /companies/new
  def new
    @company = Company.new
    @users = @company.users.build
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    @com_owner = User.joins(:company).select(:name).where("company_id = ? and user_type = ?", params[:id], "Owner")
    @com_owner = @com_owner.last.name
    @com_start_date = Company.joins(:users).select(:startdate).where("companies.id = ?", "#{current_user.company_id}")
    @com_start_date = @com_start_date.last.startdate
    @comp_manager = User.joins(:company).where("company_id = ? and user_type = ?", params[:id], "Manager").count
    @comp_worker = User.joins(:company).where("company_id = ? and user_type = ?", params[:id], "Worker").count
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    # abort params[:company][:users_attributes][0].inspect
    respond_to do |format|
      if @company.save
        format.html { redirect_to new_user_session_path, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
        UserMailer.com_reg_email(@company.users.first.email).deliver
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to '/', notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def worker_manager_sign_up
    # @user = User.new
    # abort params.inspect
  end

  def create_worker_manager
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
    # params.require(:company).permit!
      params.require(:company).permit(:cname, :regno, :startdate, :enddate, :cdescription, :image, users_attributes: [:company_id, :name, :image, :about_you, :email, :password, :password_confirmation, :uname, :phone_no, :date_of_birth, :user_type])
    end
end
