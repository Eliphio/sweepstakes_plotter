class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable and :omniauthable
  devise :database_authenticatable, :timeoutable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  validates :nickname, :presence => true, :uniqueness => {:allow_blank => true}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname
end
