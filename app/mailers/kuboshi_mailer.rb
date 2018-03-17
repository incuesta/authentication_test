class KuboshiMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.kuboshi_mailer.new_shiorichan.subject
  #
  def new_shiorichan(idol, admin)
    @idol = idol
    @admin = admin
    mail to: admin.email
  end
end
