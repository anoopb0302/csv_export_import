class CsvCodesController < ApplicationController

  layout 'csv_code'
  
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
  
  def mobile_api
    check_code = CsvCode.where(used_at: nil).first
    if check_code.nil?
      return false
    else
      check_code.update_attributes(:mobile_no => params[:mobile_no], :used_at => Time.now)
      flash[:success] = "code is sent successfully" 
    end
    redirect_to csv_codes_path
  end

private
  def mobile_no
    params.require(:csv_codes).permit(:mobile_no)
  end
end
