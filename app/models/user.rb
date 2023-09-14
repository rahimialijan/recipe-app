class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :foods

  validates :name, presence: true
  def count_food_items
    foods.count
  end
  def total_price
    foods.sum(:price)
  end
end
