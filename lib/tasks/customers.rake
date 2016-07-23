namespace :customers do
  desc 'Assign taxes to customers'
  task assign_taxes: :environment do
    Account.all.each do |account|
      Apartment::Tenant.switch! account.subdomain
      Customer.assign_taxes
    end
    Apartment::Tenant.switch! 'public'
  end
end
