class User < ApplicationRecord
  has_many :monsters
  has_many :inventories
  has_many :items, through: :inventories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :secure_validatable, :omniauthable, email_validation: false

  validates :username, presence: true

  def self.from_omniauth(auth) ## A custom class constructor I'm building myself
    ## check and see if a user with this provider (github) and uid exists; if not, create it
    where(provider: auth.provider, uid: auth.id).first_or_create do |user|
      user.provider = auth.provider ## so I know this user has authenticated with github previously
      user.username = auth.info.name
      user.uid = auth.id  ## so I know this user has authenticated with github previously, and I don't make a duplicate user
      user.email = auth.info.email
      user.password = Devise.friendly_token(20) ## dummy password to store in my app db
    end
  end

end
