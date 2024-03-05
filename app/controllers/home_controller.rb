class HomeController < ApplicationController
  skip_before_action :authenticate_request, only:[:index]
 
  def index
        ActionCable.server.broadcast("chat_room_channel", message: "Hello from the server!")
  end
end
