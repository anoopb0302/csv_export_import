class CsvCodesController < ApplicationController


  before_action :authenticate_user!
  
  def import
    CsvCode.import(params[:file])
    flash[:notice] = "codes added successfully"
    redirect_to csv_codes_path
  end

  def index
    
    @total_codes_count = CsvCode.all.count
    date = Date.today
    @one = []
    @two = []
    @three = []
    @more = []
    33.times do
      array = CsvCode.all.where("used_at like ?", "%#{date}%").pluck(:mobile_no)
      @stat = []
      @unique = array.uniq
      @unique.each do|i|
        a = array.count(i)
        @stat << a
      end
      @onecount = @stat.count(1)
      @twocount = @stat.count(2)
      @threecount = @stat.count(3)
      @morecount = @stat.count() - @stat.count(1) - @stat.count(2) - @stat.count(3)
     
      @one << @onecount
      @two << @twocount
      @three << @threecount
      @more << @morecount
      date = date-1
    end
    @one = @one.reverse
    @two = @two.reverse
    @three = @three.reverse
    @more = @more.reverse
    



    @remaining_codes_count = CsvCode.where(used_at: nil).count
    @used_codes_count = CsvCode.all.where("used_at is not ?", nil).count
    users = CsvCode.all.where("used_at is not ?", nil)
    @user_array, @date_array = total_user_count(users)
    @codes=CsvCode.all.where("used_at is not ?", nil)
    respond_to do |format|
      format.html
      format.csv {send_data @codes.to_csv ,filename: "Participant_Report_#{Time.now}.csv"}
    end
  end

  def total_codes
    @total_codes = CsvCode.all.search(params[:search]).paginate(:page =>  params[:page],:per_page => 12)
  end
  
  def remaining_codes
    @remaining_codes = CsvCode.search(params[:search]).where(used_at: nil).paginate(:page =>  params[:page],:per_page => 12)
  end
  
  def missed_call
    @used_codes = CsvCode.all.search(params[:search]).where("used_at is not ?", nil).paginate(:page =>  params[:page],:per_page => 12)
  end



private
  def total_user_count(user_array)
    date = Date.today
    @user_array = Array.new
    @date_array =  Array.new
    33.times do
      count = user_array.where("used_at like ?", "%#{date}%").count
      @user_array << count 
      a = "#{date.day} #{date.strftime("%b")}"
      @date_array << a
      date = date-1
    end
    a = "#{date.day} #{date.strftime("%b")}"
    @user_array = @user_array.reverse
    @date_array = @date_array.reverse
    return @user_array, @date_array
  end
  
end