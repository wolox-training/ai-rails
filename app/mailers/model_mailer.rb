class ModelMailer < ApplicationMailer
  def new_rent_notification(receiver, info)
    @info = info
    mail to: receiver
  end
end
