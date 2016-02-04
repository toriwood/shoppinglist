class AddStateToItems < ActiveRecord::Migration
  def change
    add_column :items, :state, :string, default: "active"
  end
end
