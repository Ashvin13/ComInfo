class UserMailer < ApplicationMailer
	default from: "itserviceyouth@gmail.com"
	def com_reg_email(user_email)
		@user_mail = user_email
		mail(to: @user_mail, subject: 'For new company registration.')
	end

	def contact_us(user_name, user_email, user_subject, user_message)
		@user_name = user_name
		@user_email = user_email
		@user_subject = user_subject
		@user_message = user_message
		mail(to: "itserviceyouth@gmail.com", subject: 'Contact Us message')
	end
end
