class DeleteUserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find_by(id: user_id)
     if user.value == true
      user.destroy
    end
  end

end
