class CreateCsvCodes < ActiveRecord::Migration
  def change
    create_table :csv_codes do |t|
      t.string :unique_codes
      t.datetime :used_at , :default => nil
      t.string :mobile_no
      t.timestamps null: false
    end
  end
end
