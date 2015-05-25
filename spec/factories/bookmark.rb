FactoryGirl.define do
  factory :bookmark do |f|
    f.title "Fiscal Associate"
    f.department "Accounts Payable"
    f.published Time.new
    f.updated Time.new
    f.url "http://www.jobsatosu.com/postings/63020"
    f.links "http://www.jobsatosu.com/postings/63020"
    f.content "This position is a float position that works in Equine, Farm Animal, and Small Animal Hospitals, providing front-line client services, document"
    f.user_id 1
  end 

 
end
