class VenseraPreview < ActionMailer::Preview

  def confirmation_instructions
    VenseraMailer.confirmation_instructions(User.find_by(:email => "nt.apple.it@gmail.com"), User.find_by(:email => "nt.apple.it@gmail.com").confirmation_token, {})
  end

  def reset_password_instructions
    VenseraMailer.reset_password_instructions(User.find_by(:email => "nt.apple.it@gmail.com"), User.find_by(:email => "nt.apple.it@gmail.com").reset_password_token, {})
  end

  def unlock_instructions
    VenseraMailer.unlock_instructions(User.find_by(:email => "nt.apple.it@gmail.com"), User.find_by(:email => "nt.apple.it@gmail.com").unlock_token, {})
  end
end