class CreateKeyResultStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :key_result_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
