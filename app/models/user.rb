class User < ApplicationRecord
  after_create :create_profile
  has_one :profile


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  private

  def create_profile
    Profile.create(user: self)
  end
end
