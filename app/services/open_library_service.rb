class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org'

  def initialize
    @options = { query: { format: 'json', jscmd: 'data' } }
  end

  def book_info(isbn)
    @options[:query][:bibkeys] = "ISBN:#{isbn}"
    data = (JSON.parse self.class.get('/api/books', @options).to_s).values[0]
    generate_response(data)
  end

  def generate_response(data)
    return {} if data.blank?
    response = {
      isbn: data['identifiers']['isbn_10'][0],
      title: data['title'],
      subtitle: data['subtitle'],
      number_of_pages_pages: data['number_of_pages'],
      authors: data['authors'].map { |author| author['name'] }
    }
  end
end
