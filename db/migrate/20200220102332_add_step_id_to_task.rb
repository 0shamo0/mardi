class AddStepIdToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :step_id, :integer
  end
end
