class AddCollaboratorIdToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :collaborator_id, :integer
  end
end
