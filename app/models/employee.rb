class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company
  belongs_to :coaching_program
  belongs_to :coach, optional: true
  # has_many :assignments, dependent: :destroy
  has_many :employee_assignments
  has_many :assignments, through: :employee_assignments, dependent: :destroy
end
