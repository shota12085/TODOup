class AddColumnToAcquisition < ActiveRecord::Migration[5.2]
  def change
    add_column :acquisitions, :task, :string
    add_column :acquisitions, :date, :date
  end
end
