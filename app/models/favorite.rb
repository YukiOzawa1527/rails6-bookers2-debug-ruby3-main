class Favorite < ApplicationRecord
  belongs_to :user

  validates :user_id, uniqueness: {scope: :user_id}
end
