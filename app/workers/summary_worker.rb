class SummaryWorker
  include Sidekiq::Worker

  def perform(user_id)
    Loan.unscoped do
      Customer.unscoped do
        Schedule.unscoped do
          User.unscoped do
            user = User.find user_id

            Reminder.transaction do
              Notifier.summary(user).deliver
            end
          end
        end
      end
    end
  end
end
