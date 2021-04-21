class AddFieldsToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :salary, :integer
  end
end
