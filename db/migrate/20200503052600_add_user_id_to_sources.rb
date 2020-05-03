class AddUserIdToSources < ActiveRecord::Migration[5.2]
  def up
    execute "DELETE FROM sources;"
    add_reference :sources, :user,  null: false, index: true
  end

  def down
    remove_reference :sources, :user, index: true
  end
end
