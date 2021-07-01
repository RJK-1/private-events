class ChangeDateFormatInEvents < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :date, 'date USING date::date'
  end
end
