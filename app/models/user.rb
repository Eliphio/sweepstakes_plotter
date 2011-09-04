class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :omniauthable and recoverable
  devise :database_authenticatable, :timeoutable, :registerable, :rememberable, :trackable, :validatable
  
  validates :nickname, :profile, :presence => true
  validates :nickname, :uniqueness => {:allow_blank => true}

  has_enumeration_for :profile, :with => User::Profile, :create_helpers => true

  # Setup accessible (or protected) attributes for your model
 attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname, :profile
end
