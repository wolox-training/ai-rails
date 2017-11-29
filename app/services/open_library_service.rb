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
    response = {}
    response['isbn'] = data['identifiers']['isbn_10'][0]
    response['title'] = data['title']
    response['subtitle'] = data['subtitle']
    response['nnumber_of_pages_pages'] = data['number_of_pages']
    response['authors'] = data['authors'].map { |author| author['name'] }
    response
  end
end
