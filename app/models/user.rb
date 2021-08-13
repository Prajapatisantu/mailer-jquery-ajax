class User < ApplicationRecord
  require 'open-uri'      # for open external url like twiiter,google
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2 twitter]
  has_one_attached :user_image
  has_many :orders
  enum role: [:user, :admin]

  def self.from_google_omniauth(auth)
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
          user.user_image.attach(io: URI.open(auth.info.image), filename: 'nscanc.jpg' , content_type: 'image/jpg')
    end
    user
  end

  def self.from_facebook_omniauth(auth)
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

  def self.from_twitter_omniauth(auth)
    number = rand(252...4350)

    males = ["tom", "jack", "adam"]
    females = ["elizabeth", "rose", "juliet"]

    surnameMales = ["oak", "yew", "timber"]
    surnameFemales = ["rosewelth", "gates", "jobs"]

    providers = ["gmail.com", "hotmail.com", "yahoo.com"]

    data = auth.info
    user = User.where(email: "#{females.sample}.#{surnameFemales.sample}#{rand(252...4350)}@#{providers.sample}").first
    unless user
      name_split = auth.info.name.split(" ")
      user = User.create(firstname: name_split[0],
          lastname: name_split[1],
          role:0,
          provider: auth.provider,
          uid: auth.uid,
          email: "#{females.sample}.#{surnameFemales.sample}#{rand(252...4350)}@#{providers.sample}",
          password: Devise.friendly_token[0,20])
          user.user_image.attach(io: URI.open(auth.info.image), filename: 'fnndc.jpg' , content_type: 'image/jpg')
    end
    user
  end
end

# name_split = auth.info.name.split(" ")
# user = User.where(email: auth.info.email).first
# user ||= User.create!(provider: auth.provider, uid: auth.uid, lastname: name_split[1], firstname: name_split[0], email: auth.info.email, password: Devise.friendly_token[0, 20])