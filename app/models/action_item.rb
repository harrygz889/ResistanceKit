class ActionItem < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  has_many :comments, :as => :commentable 
end
