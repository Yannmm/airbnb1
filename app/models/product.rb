class Product < ApplicationRecord
  include Notifications

  has_many :subscribers, dependent: :destroy
  validates :name, presence: true
  has_rich_text :description
  has_one_attached :featured_image

  validates :inventory_count, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
