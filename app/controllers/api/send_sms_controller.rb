class Api::SendSmsController < ApplicationController

	def mobile_api
		puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
		puts params.inspect
		puts "++++++++++++++++++++++++++++++++++++++++++++++++++++++"
      check_code = CsvCode.where(used_at: nil).first
    	if check_code.nil?
      	  return false
    	else
      	  check_code.update_attributes(:mobile_no => params[:mobile_no], :used_at => Time.now)
    	end
    end

end
