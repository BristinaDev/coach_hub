class Coach < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coaches_coaching_program, dependent: :destroy
  has_many :coaching_program, through: :coaches_coaching_program

  has_many :employees, dependent: :destroy
end
