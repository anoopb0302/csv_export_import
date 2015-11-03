class Api::SendSmsController < ApplicationController

	def mobile_api
    puts "+++++++++++++++++++++++++++++++++++++++++++++"
    puts params
    puts "+++++++++++++++++++++++++++++++++++++++++++++"
    check_code = CsvCode.where(used_at: nil).first
    	if check_code.nil?
      	  return false
    	else
      	  check_code.update_attributes(:mobile_no => params[:from], :used_at => Time.now)
          send_message(check_code, params)
    	end
  end

  def send_message(check_code, params)
       puts "=============================================="
       puts check_code.inspect
       puts params.inspect
       puts "=============================================="
      response = Exotel::Sms.send(:from => '02233836088', :to => params[:from], :body => "Thanks for purshasing product. Your code is #{check_code.unique_codes}")
      sms_id = response.sid
  end

end