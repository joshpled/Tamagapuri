class User < ApplicationRecord
  has_many :monsters
  has_many :inventories
  has_many :items, through: :inventories

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable, :omniauthable

  validates :username, presence: true
  # validate :password_complexity

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

  # def password_complexity
  #   return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

  #   errors.add :password, 'Requirements not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  # end
end
