class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.string :collaborator_name

      t.timestamps
    end
  end
end
