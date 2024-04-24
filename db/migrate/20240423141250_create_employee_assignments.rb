class CreateEmployeeAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :employee_assignments do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :assignment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
