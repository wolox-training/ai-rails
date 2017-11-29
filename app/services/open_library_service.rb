class OpenLibraryService
  def book_info(isbn)
    url = 'https://openlibrary.org/api/books?bibkeys=ISBN:' + isbn + '&format=json&jscmd=data'
    @data = (JSON.parse HTTParty.get(url).to_s).values[0]
    # byebug
    @response = {}
    generate_response unless @data.nil?
    @response
  end

  def generate_response
    @response['isbn'] = @data['identifiers']['isbn_10'][0]
    @response['title'] = @data['title']
    @response['subtitle'] = @data['subtitle']
    @response['nnumber_of_pages_pages'] = @data['number_of_pages']
    @response['authors'] = @data['authors'].map { |author| author['name'] }
  end
end
