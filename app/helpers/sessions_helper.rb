module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    !current_user.nil?
  end

  # 還沒登入，轉到登入頁面，並且幫你把剛剛想要訪問的網址儲存起來
  def check_sign_in_status
    unless signed_in?
      store_url
      flash[:error] = "請先登入"
      redirect_to signin_path
    end
  end

  # 設定當前用戶
  def current_user=(user)
    @current_user = user
  end

  # 是當前用戶嗎？
  def current_user?(user)
    user == current_user
  end

  # 取得當前用戶
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  # 儲存因為還沒登入被拒絕操作的網址
  def store_url
    session[:return_to] = request.url if request.get?
  end

  # 轉到上面被儲存下來的網址
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

end
