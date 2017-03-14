class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :meetings
  has_many :action_items
  has_many :tasks
  has_many :comments

  mount_uploader :avatar, AvatarUploader

end
