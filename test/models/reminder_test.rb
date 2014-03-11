require 'test_helper'

class ReminderTest < ActiveSupport::TestCase
  def setup
    @reminder = reminders(:reminder)
  end

  test 'blank attributes' do
    @reminder.remind_at = nil
    @reminder.kind = ''

    assert @reminder.invalid?
    assert_equal @reminder, :remind_at, :blank
    assert_equal @reminder, :kind, :blank
  end

  test 'attributes length' do
    @reminder.kind = 'abcde' * 52

    assert @reminder.invalid?
    assert_equal [
      assert_equal(@reminder, :kind, :too_long, count: 255),
      assert_equal(@reminder, :kind, :inclusion)
    ].sort, @reminder.errors[:kind].sort
  end
end
