class Task < ApplicationRecord
    belongs_to :collaborator
    belongs_to :project
    belongs_to :user
    belongs_to :step
    
    validates :task_name, presence: { message: "Nommer la tâche" }
    validates :task_designation, presence: { message: "Description nécessaire." }
    validates :date_butoire, presence: { message: "Date butoire obligatoire." }
end
