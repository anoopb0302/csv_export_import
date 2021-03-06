class CsvCode < ActiveRecord::Base
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      client = find_by_id(row["id"]) || new
      client.attributes = row.to_hash
      client.save!
    end
  end
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, packed: nil, file_warning: :ignore)
      when ".xls" then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
  
  def self.to_csv
    CSV.generate do |csv|
      csv << ["Sl-No", "Unique Codes", "Used at", "Mobile No."] ## Header values of CSV
      i=1
      all.each do |code|
        csv << [i, code.unique_codes, code.used_at.strftime('%b %e, %H:%M'), code.mobile_no]
      i=i+1
      end
    end
  end
  
  def self.search(search)
    if search
      where('mobile_no LIKE ?',"%#{search}%")
    else
      all
    end
  end  
  
end
