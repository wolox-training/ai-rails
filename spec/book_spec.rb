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
  subject(:book) do
    described_class.new(
      title: title, author: author, genre: genre, publisher: publisher,
      image: image, year: year
    )
  end

  let(:title) { Faker::Book.title }
  let(:author) { Faker::Book.author }
  let(:genre) { Faker::Book.genre }
  let(:publisher) { Faker::Book.publisher }
  let(:image) { 'image.jpg' }
  let(:year) { '1990' }

  attributes = %i[title author genre publisher image year]
  attributes.each do |att|
    context "When the #{att} is nil" do
      let(att) { nil }

      it 'is invalid' do
        is_expected.to be_invalid
      end
    end
  end
  #
  # context 'When the author is nil' do
  #   let(:author) { nil }
  #
  #   it 'is invalid' do
  #     is_expected.to be_invalid
  #   end
  # end
  #
  # context 'When the genre is nil' do
  #   let(:genre) { nil }
  #
  #   it 'is invalid' do
  #     is_expected.to be_invalid
  #   end
  # end
  #
  # context 'When the publisher is nil' do
  #   let(:publisher) { nil }
  #
  #   it 'is invalid' do
  #     is_expected.to be_invalid
  #   end
  # end
  #
  # context 'When the image is nil' do
  #   let(:image) { nil }
  #
  #   it 'is invalid' do
  #     is_expected.to be_invalid
  #   end
  # end
  #
  # context 'When the year is nil' do
  #   let(:year) { nil }
  #
  #   it 'is invalid' do
  #     is_expected.to be_invalid
  #   end
  # end

  context 'When all attributes are valid' do
    it 'is valid' do
      is_expected.to be_valid
    end
  end
end
