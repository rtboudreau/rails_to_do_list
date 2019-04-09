class TodoItem < ApplicationRecord
  belongs_to :todo_list
  validates :content, :presence => true

  def completed?
    !completed_at.blank?
    #code
  end
end
