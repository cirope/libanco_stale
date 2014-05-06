module CacheControl
  extend ActiveSupport::Concern

  included do
    after_filter :set_cache_control
  end

  private
    def set_cache_control
      if current_user
        response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
        response.headers['Pragma'] = 'no-cache'
        response.headers['Expires'] = 'Fri, 01 Jan 1990 00:00:00 GMT'
      end
    end
end
