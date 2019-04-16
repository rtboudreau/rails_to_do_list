class TodoItem < ApplicationRecord
  belongs_to :todo_list
  belongs_to :user
  validates :content, :presence => true

  def completed?
    !completed_at.blank?
    #code
  end

  def toggle_completion
    if completed?
      update_attribute(:completed_at, nil)
    else
      update_attribute(:completed_at, Time.now)
    end
  end
  
end
