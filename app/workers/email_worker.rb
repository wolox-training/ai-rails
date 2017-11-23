class EmailWorker
  include Sidekiq::Worker

  def locale(user)
    I18n.locale = user.locale || I18n.default_locale
  end

  def info(rent)
    {
      today: rent.created_at.strftime('%B %d, %Y'),
      start: rent.from.strftime('%B %d, %Y'),
      end: rent.to.strftime('%B %d, %Y'),
      book: rent.book.title
    }
  end

  def perform(rent_id)
    rent = Rent.find(rent_id)
    user = rent.user
    locale(user)
    ModelMailer.new_rent_notification(user.email, info(rent)).deliver
  end
end
