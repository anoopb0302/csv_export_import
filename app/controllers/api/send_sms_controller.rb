class Api::SendSmsController < ApplicationController

	def mobile_api
    puts "+++++++++++++++++++++++++++++++++++++++++++++"
    puts params
    puts "+++++++++++++++++++++++++++++++++++++++++++++"
    check_code = CsvCode.where(used_at: nil).first
    	if check_code.nil?
      	  render :json => {:status => 200}
    	else
      	  check_code.update_attributes(:mobile_no => params[:from], :used_at => Time.now)
          send_message(check_code, params)
          render :json => {:status => 200}
    	end
  end

  def send_message(check_code, params)
      puts "=============================================="
      puts check_code.inspect
      puts params.inspect
      puts "=============================================="
      response = Exotel::Sms.send(:from => '02233836088', :to => params[:from], :body => "Dear Customer, Thank you for shopping Tasty Treat at Big Bazaar. Code - #{check_code.unique_codes}")
      sms_id = response.sid
  end
end