class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.join.subject
  #
  def join
    @event = params[:event]

    mail(
      to:       @event.user.email,
      subject:  "You are joining #{@event.title_event}!"
    )
  end
end
