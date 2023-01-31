class User < ApplicationRecord
  enum role: %i[writer editor]
  has_many :posts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
