class CreateTimeValues < ActiveRecord::Migration[6.0]
  def change
    create_table :time_values do |t|
      t.integer :work_time
      t.integer :break_time
      t.references :schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
