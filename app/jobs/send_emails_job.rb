class SendEmailsJob < ApplicationJob
  queue_as :default

  def perform(user)
    DeleteUserMailer.delete_account(user).deliver
  end


   
end
