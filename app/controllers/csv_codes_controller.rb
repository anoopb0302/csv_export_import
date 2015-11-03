class CsvCodesController < ApplicationController

  layout 'csv_code'
  before_action :authenticate_user!
  
  def import
    CsvCode.import(params[:file])
    flash.now[:notice] = "codes added successfully"
    redirect_to csv_codes_path
  end

  def index
    @total_codes_count = CsvCode.all.count
    @remaining_codes_count = CsvCode.where(used_at: nil).count
    @codes=CsvCode.all.where("used_at is not ?", nil)
    respond_to do |format|
      format.html
      format.csv {send_data @codes.to_csv ,filename: "Participant_Report_#{Time.now}.csv"}
    end
  end

end