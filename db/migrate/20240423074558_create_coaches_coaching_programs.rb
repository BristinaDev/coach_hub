class CreateCoachesCoachingPrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :coaches_coaching_programs do |t|
      t.references :coach, null: false, foreign_key: true
      t.references :coaching_program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
