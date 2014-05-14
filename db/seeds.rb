Account.transaction do
  account = Account.create!(
    name: 'Default',
    subdomain: 'default'
  )

  account.users.create!(
    name: 'Admin',
    lastname: 'Istrator',
    email: 'admin@libanco.com',
    password: '123',
    password_confirmation: '123'
  )
end
