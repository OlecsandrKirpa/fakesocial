class HomeController < ApplicationController
  def whatsgood(h)
    # 6-14 Good morning
    # 15-17 Good afternoon
    # 18-22 Good evening
    # 23-00 + 00-5 Goodnight
    hour = h.to_i
    if hour >=6 && hour<=14
      return "Good morning!"
    elsif hour>=15 && hour <=17
      return "Good afternoon!"
    elsif hour >=18 && hour <=22
      return "Good evening!"
    elsif hour == 23 || hour == 0 || hour>0 && hour<6
      return "Goodnight!"
    else
      return "Hello!"
    end
      
  end
  
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
    @hours = "It's "+hour
    
    
    @goodwhatever = whatsgood(time.strftime("%k"))

# flash[:notice] = 'Successfully showing'
  end

  def about
  end
end
