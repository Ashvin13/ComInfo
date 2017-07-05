class UserMailer < ApplicationMailer
	default from: "itserviceyouth@gmail.com"
	def com_reg_email(user_email)
		@user_mail = user_email
		mail(to: @user_mail, subject: 'For new company registration.')
	end
end
