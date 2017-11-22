require 'rails_helper'

describe RentsController, type: :controller do
  include_context 'Authenticated User'
  describe 'GET #index' do
    context 'When fetching a user rents' do
      let(:user) { create(:user) }
      let!(:rents) { create_list(:rent, 3, user: user) }

      before do
        get :index, params: { user_id: user.id }
      end

      it 'responses with the rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          rents, each_serializer: RentSerializer
        ).to_json
        expect(JSON.parse(response.body)['page']) == JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'When fetching a book rents' do
      let(:book) { create(:book) }
      let!(:rents) { create_list(:rent, 3, book: book) }

      before do
        get :index, params: { book_id: book.id }
      end

      it 'responses with the rents json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          rents, each_serializer: RentSerializer
        ).to_json
        expect(JSON.parse(response.body)['page']) == JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST #create' do
    context 'When creating a rent' do
      let(:user) { create(:user) }
      let(:book) { create(:book) }

      before do
        post :create, params: {
          user_id: user.id, book_id: book.id,
          from: Faker::Date.between_except(1.year.ago, 1.year.from_now, Time.zone.today),
          to: Faker::Date.between_except(1.year.ago, 1.year.from_now, Time.zone.today)
        }
      end

      it 'responses with the new rent json' do
        expect(response.body).to eq RentSerializer.new(
          Rent.last, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end

#   describe 'GET #show' do
#     context 'When fetching a book' do
#       let!(:book) { create(:book) }
#
#       before do
#         get :show, params: { id: book.id }
#       end
#
#       it 'responses with the book json' do
#         expect(response.body).to eq BookSerializer.new(
#           book, root: false
#         ).to_json
#       end
#
#       it 'responds with 200 status' do
#         expect(response).to have_http_status(:ok)
#       end
#     end
#   end
# end
