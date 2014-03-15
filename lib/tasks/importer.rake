require 'csv'

namespace :importer do
  desc 'Import CSV data'
  task import: :environment do
    Account.current_id = 1

    user = User.first
    state = State.find_or_create_by!(name: 'Mendoza')
    zip_code = 5500
    count = 0

    CSV.foreach('prestamos.csv', col_sep: ';', encoding: 'iso-8859-1:UTF-8') do |row|
      names          = row[0].strip.titleize.split if row[0].present?
      identification = row[1].strip if row[1].present?
      amount         = row[2].to_i
      address        = row[3].present? ? row[3].strip.titleize : '-----'
      city_name      = row[9].strip.titleize if row[9].present?
      company_name   = row[10].strip.titleize if row[10].present?
      expired_at     = Timeliness.parse(row[12], zone: :local)
      payments_count = PAYMENTS_DATA.keys.include?(row[13].to_i) if row[13].present?
      phones         = row[14].split(/[-\/]/) if row[14].present?

      if company_name.present? && PAYMENTS_DATA.keys.include?(payments_count)

        city = City.find_by(name: city_name)
        city ||= City.create!(
          name: city_name, zip_code: (zip_code+=1), state_id: state.id
        )

        customer = Customer.find_by(identification: identification)
        if identification
          customer ||= Customer.create!(
            name: names[1..-1].join(' '),
            lastname: names[0],
            identification: identification,
            address: address,
            city_id: city.id
          )

          if phones
            phones.each do |phone|
              Phone.create!(phone: phone, customer_id: customer.id)
            end
          end
        end

        if customer && amount > 0 && payments_count
          count += 1
          first_expired = expired_at - 1.month

          Loan.create!(
            amount: amount,
            payments_count: payments_count,
            expired_at: first_expired.to_s(:db),
            customer_id: customer.id,
            user_id: user.id
          )
        end
      end
    end
  end
end
