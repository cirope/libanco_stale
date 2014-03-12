require 'test_helper'

class NotifierTest < ActionMailer::TestCase

  setup do
    @reminder = reminders(:reminder)
  end

  test 'remind' do
    mail = Notifier.remind(@reminder)

    assert_equal I18n.t('notifier.remind.subject'), mail.subject
    assert_equal [@reminder.user_email], mail.to
    assert_equal [APPLICATION['email']], mail.from
    assert_match @reminder.description, mail.text_part.body.decoded
    assert_match @reminder.description, mail.html_part.body.decoded

    assert_emails 1 do
      mail.deliver
    end
  end

  test 'summary' do
    user = @reminder.user
    schedule = @reminder.schedule
    mail = Notifier.summary(user)

    assert_equal I18n.t('notifier.summary.subject'), mail.subject
    assert_equal [user.email], mail.to
    assert_equal [APPLICATION['email']], mail.from
    assert_match schedule.description, mail.text_part.body.decoded
    assert_match schedule.description, mail.html_part.body.decoded

    assert_emails 1 do
      mail.deliver
    end
  end
end
