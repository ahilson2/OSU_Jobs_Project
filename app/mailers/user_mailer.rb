class UserMailer < ActionMailer::Base
  default from: "ahilsonosujob@gmail.com"

  def job_email(email_address,job_list)
    @email_address = email_address
    @job_list = job_list
    @url = 'http://ahilsonosujob.herokuapp.com'
    mail(to: email_address, subject: 'Hello, '+email_address+'We have found some jobs for you!')
  end

end
