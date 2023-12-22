class User < ApplicationRecord
  after_create :create_profile
  has_one :profile

  has_many :messagee, foreign_key: :receiver_id, class_name: 'Message'  
  has_many :senders, through: :messagee
  has_many :messaged, foreign_key: :sender_id, class_name: 'Message'
  has_many :receivers, through: :messaged
  after_create_commit { broadcast_append_to "users" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :matches_as_user1, class_name: 'Match', foreign_key: 'user1_id'
  has_many :matches_as_user2, class_name: 'Match', foreign_key: 'user2_id'

  # Method to get all matched users
  def matched_users
    matched_user1_ids = matches_as_user1.pluck(:user2_id)
    matched_user2_ids = matches_as_user2.pluck(:user1_id)
    matched_user_ids = (matched_user1_ids + matched_user2_ids).uniq
    User.where(id: matched_user_ids)
  end

  

  private

  def create_profile
    Profile.create(user: self)
  end

end
