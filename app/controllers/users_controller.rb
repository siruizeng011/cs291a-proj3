class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/{:id}
  def show
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/{:id}/edit
  def edit
    begin
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end

  # PATCH /users/{:id}
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: "User was successful updated"
    else
      render :edit
    end
  end

  # DELETE /users/{:id}
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
