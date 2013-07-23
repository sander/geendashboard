class UserMailer < ActionMailer::Base
  default from: "info@geenprofessionals.nl"

  def personal_message(params)
    @to = params[:to]
    @from = params[:from]

    mail to: @to.email, subject: 'test'
  end
end
