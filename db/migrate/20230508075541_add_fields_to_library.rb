class AddFieldsToLibrary < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :street, :string
    add_column :libraries, :address, :text
    add_column :libraries, :zipcode, :integer
  end
end
