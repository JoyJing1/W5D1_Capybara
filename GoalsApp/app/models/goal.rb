class Goal < ActiveRecord::Base
  validates :title, :author_id, presence: true
  validates :private_goal, inclusion: { in: [true, false] }
  validates :title, uniqueness: { scope: :author_id, message: "Can't repeat goals" }
  belongs_to :author, class_name: :User

  def private_goal?
    self.private_goal
  end

  def completed?
    self.completed
  end

end
