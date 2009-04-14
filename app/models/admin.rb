class Admin < ActionMailer::Base

  def notification options
    recipients "admin@1up4dev.com"
    from "admin@1up4dev.com"
    subject options[:subject]
    sent_on Time.now 
    #body {:information => options[:subject], :values => options[:values]}
    body :information => options[:subject], :values => options[:values]
  end  


end
