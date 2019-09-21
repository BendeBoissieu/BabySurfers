class JoinMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.join_mailer.join.subject
  #
  def join_event
    @join = params[:join]
    @event = params[:join]
    mail(
      to: @join.user.email,
      subject:  "You are joining #{@event.event.title_event}!"
    )
  end
end
