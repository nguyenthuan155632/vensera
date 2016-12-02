class VenseraPreview < ActionMailer::Preview

  def confirmation_instructions
    VenseraMailer.confirmation_instructions(User.last, User.last.confirmation_token, {})
  end

  def reset_password_instructions
    VenseraMailer.reset_password_instructions(User.last, User.last.reset_password_token, {})
  end

  def unlock_instructions
    VenseraMailer.unlock_instructions(User.last, User.last.unlock_token, {})
  end
end