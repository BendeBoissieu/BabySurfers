# Preview all emails at http://localhost:3000/rails/mailers/join_mailer
class JoinMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/join_mailer/join
  def join
    JoinMailer.join
  end

end
