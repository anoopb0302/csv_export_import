class CreateCsvCodes < ActiveRecord::Migration
  def change
    create_table :csv_codes do |t|
      t.bigint :unique_codes, :limit => 10
      t.datetime :used_at , :default => nil
      t.string :mobile_no
      t.timestamps null: false
    end
  end
end
