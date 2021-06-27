class AddFieldToEvents < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :creator, references: :users, index: true
    add_foreign_key :events, :users, column: :creator_id
    add_column :events, :description, :string
  end
end
