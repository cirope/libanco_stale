namespace :payments do
  desc 'Assign current taxes to payments'
  task assign_taxes: :environment do
    Account.all.each do |account|
      Payment.assign_taxes(account)
    end
  end
end
