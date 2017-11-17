DeviseTokenAuth.setup do |config|
  config.change_headers_on_each_request = false
  config.default_confirm_success_url = 'localhost:3000'
end
