class Swipe < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'swiper_id'
end
