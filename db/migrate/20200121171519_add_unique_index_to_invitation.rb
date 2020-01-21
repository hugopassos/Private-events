class AddUniqueIndexToInvitation < ActiveRecord::Migration[5.2]
  def change
  	add_index :invitations, [:user_id, :event_id], unique: true
  end
end
