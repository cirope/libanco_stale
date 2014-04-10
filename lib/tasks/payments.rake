namespace :payments do
  desc 'Assign taxes to customers'
  task assign_taxes: :environment do
    Account.all.each do |account|
      Customer.assign_taxes(account)
    end
  end
end
