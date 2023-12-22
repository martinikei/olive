class MessagesController < ApplicationController
    def create 
        message = Message.create(sender_id: params[:sender_id], receiver_id: params[:receiver_id], text: params[:message])
        ActionCable.server.broadcast("message_channel_#{params[:chat_id]}" , message)
    end 
end


 