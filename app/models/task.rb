class Task < ApplicationRecord
  has_many :assigned_tasks, dependent: :destroy
  has_many :employees, through: :assigned_tasks

  validates :name, presence: true, length: { minimum: 2 }
  validates :execution_date, presence: true
  validate :execution_date_in_future

  private

  def execution_date_in_future
    return if execution_date.blank?

    errors.add(:execution_date, 'must be in the future') if execution_date < Time.now
  end
end
