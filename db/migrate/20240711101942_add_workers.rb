class AddWorkers < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      CREATE TABLE workers(
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        job_type TINYINT unsigned,
        is_running TINYINT unsigned DEFAULT 0,
        PRIMARY KEY(id)
      );
    SQL
  end

  def down
    execute <<~SQL
      DROP TABLE workers;
    SQL
  end
end
