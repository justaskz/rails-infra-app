class AddRecordWorkerId < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      ALTER TABLE records ADD COLUMN worker_id INT UNSIGNED AFTER id;
    SQL

    execute <<~SQL
      ALTER TABLE records DROP COLUMN signature;
    SQL
  end

  def down
    execute <<~SQL
      ALTER TABLE records DROP COLUMN worker_id;
    SQL

    execute <<~SQL
      ALTER TABLE records ADD COLUMN signature VARCHAR(255) AFTER id;
    SQL
  end
end
