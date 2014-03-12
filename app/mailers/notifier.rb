class Notifier < ActionMailer::Base
  default from: "'#{I18n.t('app_name')}' <#{APPLICATION['email']}>"

  def remind(reminder)
    @reminder = reminder

    mail to: @reminder.user_email
  end

  def summary(user)
    @user = user
    @schedules = user.schedules.for_tomorrow

    mail to: user.email
  end
end
