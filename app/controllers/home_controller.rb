class HomeController < ApplicationController
  def index

    @ip = " I'm sorry, there is an error. " 

    begin
   @ip = request.remote_ip
    rescue => exception
   @ip = except.to_s
    end

    time = Time.now
    
    day = time.day
    month = time.month
    year = time.hour

    hour = time.strftime("%k:%M")
    @date = "Today's date: "+day.to_s + "-" +month.to_s + "-" + year.to_s
    @hours = "It's "+hour.to_s


  end

  def about
  end
end
