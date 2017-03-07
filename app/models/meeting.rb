class Meeting < ApplicationRecord

  has_and_belongs_to_many :users
  has_many :tasks
  has_many :action_items

  validates :name, presence: true
  validates :starts_on, presence: true
  validates :location, presence: true

  def self.search(search)
    where("name ilike ? OR location ilike ?", "%#{search}%", "%#{search}%")
  end
end
