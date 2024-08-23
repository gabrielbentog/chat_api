# wscat -c ws://localhost:3000/cable
# {"command":"subscribe","identifier":"{\"channel\":\"ChatChannel\"}"}
class MessagesController < ApplicationController
  def create
    message = Message.create!(message_params)
    ActionCable.server.broadcast('chat_channel', message.body)
    render json: { status: 'Message sent!' }, status: :created
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
