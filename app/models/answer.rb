class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :title

  validates :answer, presence: true
end
