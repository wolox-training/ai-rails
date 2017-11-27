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

      it 'responds with 201 status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating an invalid user rent' do
      let!(:new_rent_attributes) { attributes_for(:rent, book: nil) }
      before do
        post :create, params: { user_id: user.id, rent: new_rent_attributes }
      end

      it 'doesn\'t create a new rent' do
        expect do
          post :create, params: { user_id: user.id, rent: new_rent_attributes }
        end.to change { Rent.count }.by(0)
      end

      it 'returns error messages' do
        expect(response.body['error']).to be_present
      end

      it 'responds with 422 status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
