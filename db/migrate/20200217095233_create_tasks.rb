class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :task_designation
      t.date :date_butoire

      t.timestamps
    end
  end
end
