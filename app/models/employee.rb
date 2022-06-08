class Employee < ApplicationRecord
  has_many :assigned_tasks, dependent: :destroy
  has_many :tasks, through: :assigned_tasks
  enum status: %i[training active], _default: 'training'

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, length: { minimum: 3, maximum: 320 }, uniqueness: true,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'email not valid' }
  validates :status, presence: true
end
