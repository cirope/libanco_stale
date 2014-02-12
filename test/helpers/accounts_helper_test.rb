require 'test_helper'

class AccountsHelperTest < ActionView::TestCase
  test 'admin subdomain' do
    request.subdomain = 'test'

    assert !admin_subdomain?

    request.subdomain = RESERVED_SUBDOMAINS.first

    assert admin_subdomain?
  end

  private

    # Stub request
    def request
      @_request ||= Struct.new(:subdomain) do
        def subdomains
          [subdomain]
        end
      end.new
    end
end
