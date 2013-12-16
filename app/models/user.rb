class User < ActiveRecord::Base

  before_save { email.downcase! }
  before_create :put_remember_token

  # 檢測有無重複帳號
  validates :email, uniqueness: { case_senstive: false }

  # 密碼驗證
  has_secure_password

  has_many :spaces
  has_many :lots

  # 產生一組未加密的 token
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # 加密 token
  def User.encrypt(token)
    Digest::SHA1::hexdigest(token.to_s)
  end

  private
    def put_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
