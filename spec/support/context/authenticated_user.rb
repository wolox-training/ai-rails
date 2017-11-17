RSpec.shared_context 'Authenticated User' do
  let(:user) { create(:user) }
  let!(:auth_headers) { user.create_new_auth_token }

  before do
    request.headers.merge!(auth_headers)
  end
end
