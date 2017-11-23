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
    user = User.find(rent.user_id)
    locale(user)
    @receiver = user.email
    @mail_info = info(rent)
    ModelMailer.new_rent_notification(@receiver, @mail_info).deliver
  end
end
