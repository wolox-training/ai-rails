require 'rails_helper'

describe Book, type: :model do
  it do
    should validate_presence_of(:author)
  end
  it do
    should validate_presence_of(:genre)
  end
  it do
    should validate_presence_of(:title)
  end
  it do
    should validate_presence_of(:publisher)
  end
  it do
    should validate_presence_of(:image)
  end
  it do
    should validate_presence_of(:year)
  end
end

describe Book, type: :model do
  attributes = %i[title author genre publisher image year]
  attributes.each do |att|
    subject(:book) { build(:book) }

    context "When the #{att} is nil" do
      it 'is invalid' do
        book.public_send("#{att}=", nil)
        is_expected.to be_invalid
      end
    end
  end

  context 'When all attributes are valid' do
    it 'is valid' do
      is_expected.to be_valid
    end
  end
end
