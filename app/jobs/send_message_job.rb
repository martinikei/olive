class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    puts "SENDING A JOB"
    html = "<p>#{message.sender.email}: #{message.text}</p>"
    chat_id = [message.sender_id, message.receiver_id].sort.join("")
    ActionCable.server.broadcast("message_channel_#{chat_id}", html: html)
  end
end