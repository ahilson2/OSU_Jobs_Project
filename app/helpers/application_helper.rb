module ApplicationHelper

  def set_month(date)
    answer = ""
    date = date.to_date
    temp = date.month
    if temp == 1
      answer = 'Jan'
    elsif temp == 2
      answer = 'Feb'
    elsif temp == 3
      answer = 'Mar'
    elsif temp == 4
      answer = 'Apr'
    elsif temp == 5
      answer = 'May'
    elsif temp == 6
      answer = 'June'
    elsif temp == 7
      answer = 'July'
    elsif temp == 8
      answer = 'Aug'
    elsif temp == 9
      answer = 'Sep'
    elsif temp == 10
      answer = 'Oct'
    elsif temp == 11
      answer = 'Nov'
    elsif temp == 12
      answer = 'Dec'
    end 
    answer    
  end  

  def set_date(date)
    date = date.to_date
    " "+set_month(date)+" "+date.day.to_s+", "+date.year.to_s
  end

end
