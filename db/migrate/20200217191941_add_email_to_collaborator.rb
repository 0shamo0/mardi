class AddEmailToCollaborator < ActiveRecord::Migration[5.2]
  def change
    add_column :collaborators, :collaborator_email, :string
  end
end
