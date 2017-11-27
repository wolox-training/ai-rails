class BookSuggestionsController < ApiController
  skip_before_action :verify_authenticity_token

  def book_suggestion_params
    params.permit(:author, :link, :title, :user, :editorial, :price, :publisher, :year, :user_id)
  end

  def create
    @booksuggestion = BookSuggestion.create(book_suggestion_params)
    render json: @booksuggestion, status: :created
  end
end
