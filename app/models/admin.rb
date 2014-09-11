class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #devise :omniauthable, :omniauth_providers => [:facebook, :twitter]
 
 def self.from_omniauth(auth)
    where(auth.slice(:provider, :adminid)).first_or_create do |admin|
      admin.provider = auth.provider
      admin.adminid = auth.uid
      puts "\n--------------------------------------------\n"
      puts auth.uid
      if auth.provider != "twitter"
	      admin.email = auth.info.email unless auth.info.email.nil?
      else
	      admin.email = "#{auth.info.nickname}@twitter.com" unless auth.info.nickname.nil?
      end
    end
  end
  
  def self.new_with_session(params, session)
    if session["devise.admin_attributes"]
      new(session["devise.admin_attributes"], without_protection: true) do |admin|
        admin.attributes = params
        admin.valid?
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
