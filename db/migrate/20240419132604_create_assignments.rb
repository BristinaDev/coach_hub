class CreateAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :description
      t.date :start_date
      t.date :end_date
      t.references :coaching_program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
