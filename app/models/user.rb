class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  include Devise::JWT::RevocationStrategies::JTIMatcher

  before_create :generate_jti

  private

  def generate_jti
    self.jti = SecureRandom.uuid if self.jti.blank?
  end
end
