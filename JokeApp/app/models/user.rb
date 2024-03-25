class User < ApplicationRecord
  has_many :votes, dependent: :delete_all
  has_many :jokes, through: :votes
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :cookies_user_id, uniqueness: true, allow_nil: true
  
  before_create :generate_cookies_user_id
  after_create :activate_user
  private

  def generate_cookies_user_id
    begin
      self.cookies_user_id = SecureRandom.hex(10).downcase
    end while User.where(cookies_user_id: self.cookies_user_id).exists?
  end

  def activate_user
    update(active: false)
  end
end
