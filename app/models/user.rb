#email:string
# password_digest:string

# password:string virtual
# password_confirmation:string virtual
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_secure_password
  validates :email, presence: true
  validates :password_digest, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
