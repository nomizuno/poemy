class Post < ApplicationRecord
   
  validates :content, {presence: true, length: {maximum: 140},uniqueness: true}
  validates :user_id, {presence: true}
  validates :reading, {presence: true, uniqueness: true}

end
