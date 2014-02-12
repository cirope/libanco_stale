require 'capybara/rails'

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  require 'capybara/poltergeist'


  setup do
    Capybara.default_driver  = :poltergeist
    Capybara.server_port     = '54163'
    Capybara.app_host        = 'http://www.lvh.me:54163'
  end

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  def login user: users(:franco), account: accounts(:cirope)
    Capybara.app_host = "http://#{account.subdomain}.lvh.me:54163"
    Account.current_id = account.id

    visit login_path

    fill_in 'email', with: user.email
    fill_in 'password', with: '123'

    click_button I18n.t('sessions.new.log_in')
  end
end
