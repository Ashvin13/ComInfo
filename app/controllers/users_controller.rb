class UsersController < ApplicationController
	# before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all	
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
		@user_com = Company.joins(:users).select(:cname).where("companies.id = ?", "#{current_user.company_id}")
		@user_com = @user_com.last.cname
		@user_start_date = Company.joins(:users).select(:startdate).where("companies.id = ?", "#{current_user.company_id}")
		@user_start_date = @user_start_date.last.startdate
	end

	def update_user
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to edit_user_path
		end
	end

	def save_user
		@user = User.new(user_params)
		if @user.save
			redirect_to '/'
		end
	end

	def create
	end

private

	# def set_user
      # @user = User.find(params[:id])
    # end
	
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :uname, :phone_no, :date_of_birth, :user_type, :company_id, :image, :about_you)
	end
end
