class Title < ApplicationRecord
  belongs_to :user

  validates :text, presence: true
end
