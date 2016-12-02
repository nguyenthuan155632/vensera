class VenseraMailer < Devise::Mailer   
	helper :application # gives access to all helpers defined within `application_helper`.
	include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
	default template_path: 'user/mailer' # to make sure that your mailer uses the devise views

  	def confirmation_instructions(record, token, opts={})
	  headers["Custom-header"] = "Vensera - Email Confirmation"
	  opts[:from] = 'nt.apple.it@gmail.com'
	  opts[:reply_to] = 'nt.apple.it@gmail.com'
	  super
	end
end