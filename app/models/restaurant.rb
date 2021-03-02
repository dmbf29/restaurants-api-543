class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :name, presence: true

  def hello
    "https://cloudinary.com/12312938102938"
  end

end
