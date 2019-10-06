# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://a04e1d4def274e3685f97ad9f8b77b95.vfs.cloud9.us-east-2.amazonaws.com/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at http://a04e1d4def274e3685f97ad9f8b77b95.vfs.cloud9.us-east-2.amazonaws.com/mailers/user_mailer/password_reset
  def password_reset
    UserMailer.password_reset
  end

end
