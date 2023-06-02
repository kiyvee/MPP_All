class AddYearToLibraries < ActiveRecord::Migration[7.0]
  def change
    add_column :libraries, :year, :integer
  end
end
