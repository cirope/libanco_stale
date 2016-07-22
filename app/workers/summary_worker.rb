class SummaryWorker
  include Sidekiq::Worker

  def perform(user_id)
    User.unscoped do
      user = User.find user_id
      Account.current_id = user.account.id

      Reminder.transaction do
        Notifier.summary(user).deliver_later
      end
    end
  end
end
