class CreateKeyResults < ActiveRecord::Migration[6.0]
  def change
    create_table :key_results do |t|
      t.references :goal, null: false, foreign_key: true
      t.string :title
      t.references :key_result_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
