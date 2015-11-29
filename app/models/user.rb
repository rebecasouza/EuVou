class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events
  
  def self.sign_in_from_omniauth(auth)
    find_or_create_by(provider: auth['provider'], uid: auth['uid']) 
  end
  
  # gets all the info from the use's facebook account
  def self.create_user_from_omniauth(auth)
    create(
      user.provider = auth['provider'],
      user.uid = auth['uid'],
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.image = auth['info']['image']
      user.oauth_token = auth['credentials']['token']
      user.oauth_expires_at = Time.at(auth['credentials']['expires_at'])
      user.save!
  end
  
end

