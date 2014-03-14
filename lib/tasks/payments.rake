namespace :payments do
  desc 'Assign current taxes to payments'
  task assign_current_taxes: :environment do
    ::Payment.assign_current_taxes
  end
end
