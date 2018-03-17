# Preview all emails at http://localhost:3000/rails/mailers/kuboshi_mailer
class KuboshiMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/kuboshi_mailer/new_shiorichan
  def new_shiorichan
    KuboshiMailer.new_shiorichan(Idol.first, Admin.find(3))
  end

end
