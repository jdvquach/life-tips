class Post < ApplicationRecord

belongs_to :category, optional:true
has_many :comments
belongs_to :user, optional:true
validates :title, presence: true
end
