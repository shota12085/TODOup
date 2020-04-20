class Acquisition < ApplicationRecord
  belongs_to :user

  validates :task, presence:true
  validates :date, presence:true
  validates :content, presence: true
  validates :content, length: { maximum: 30 } 
end
