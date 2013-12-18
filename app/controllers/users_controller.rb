class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update, :destroy]
  before_action :check_sign_in_status, except: [:new, :create]
  before_action :check_permission, only: [:edit, :update, :destroy]
  before_action :check_admin_permission, only: :delete

  def index
    # 用分頁來取得 User（要有 gem ）
    @users = User.paginate(page: params[:page])
  end

  def show
    @spaces = @user.spaces
  end

  def new
    @user = User.new
  end

  def edit

  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "註冊成功！"
      sign_in @user
      redirect_to @user
    else
      flash.now[:error] = "註冊失敗，請重新填寫欄位"
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "修改成功！"
      redirect_to @user
    else
      flash.now[:error] = "修改失敗，請重新填寫欄位"
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash.now[:success] = "成功移除帳號！"
    render 'msg_holder'
  end

  def msg_holder

  end

  private
    def get_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def check_permission
      # 查看「網址列」上是哪個 User
      @user = User.find(params[:id])

      unless current_user?(@user)
        flash[:error] = "沒有權限操作"
        redirect_to root_path
      end
    end

    def check_admin_permission
      redirect_to root_path unless current_user.admin?
    end

end
