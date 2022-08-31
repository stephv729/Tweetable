class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associactions
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :cover

  after_create :attach_default

  # Validations
  validates :name, length: { minimum: 1 }
  # validates :email, :username, uniqueness: true
  # validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/, on: :create, message: "is invalid"
  def attach_default
    return if self.cover.attached? 
    self.cover.attach(io: File.open("db/images/users/user_cover.png"), filename: "cover")
  end
end
