class User < ApplicationRecord
  after_create :set_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :presence: true, length: { minimum: 5 }
  
  private

  def set_role
    update(role: 'user')
  end
end
