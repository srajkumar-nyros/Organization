class User < ActiveRecord::Base

  has_many :organizations, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :people, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :todoss, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook, :twitter, :google_oauth2, :linkedin]
 
  def self.from_omniauth(auth)
    puts auth
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      if auth.provider != "twitter"
	      user.email = auth.info.email unless auth.info.email.nil?
      else
	user.email = auth.info.nickname+"@twitter.com" unless auth.info.nickname.nil?
      end
    end
  end
  
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end     
         
end
