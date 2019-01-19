class RemoveThisColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :imagoname
  end
end
