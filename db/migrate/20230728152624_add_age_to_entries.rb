class AddAgeToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :age, :string
  end
end
