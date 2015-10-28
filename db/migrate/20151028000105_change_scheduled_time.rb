class ChangeScheduledTime < ActiveRecord::Migration
  def up
    change_column :posts, :scheduled_to, :datetime
  end

  def down
    change_column :posts, :scheduled_to, :date
  end
end
