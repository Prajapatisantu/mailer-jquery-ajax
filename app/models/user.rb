class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2 twitter]
  has_one_attached :user_image
  has_many :orders
  enum role: [:user, :admin]

  def self.from_omniauth(auth)
    data = auth.info
    user = User.where(email: data['email']).first
    unless user
      user = User.create(firstname: data['first_name'],
          lastname: data['last_name'],
          role:0,
          provider: auth.provider,
          uid: auth.uid,
          email: data['email'],
          password: Devise.friendly_token[0,20])
    end
    user
  end
end




 # name_split = auth.info.name.split(" ")
    # user = User.where(email: auth.info.email).first
    # user ||= User.create!(provider: auth.provider, uid: auth.uid, lastname: name_split[1], firstname: name_split[0], email: auth.info.email, password: Devise.friendly_token[0, 20])
    #   user