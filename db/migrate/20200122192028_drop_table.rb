class DropTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :event_attendances
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
