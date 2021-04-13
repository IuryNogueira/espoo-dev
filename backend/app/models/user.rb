class User < ApplicationRecord

  ADMIN_ROLE = 'admin'.freeze
  ROLES = [ADMIN_ROLE, 'moderator'].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  has_many :questions, dependent: :destroy

  validates :role, presence: true, inclusion: { in: ROLES }

  def admin?
    role == ROLES[0]
  end
end
