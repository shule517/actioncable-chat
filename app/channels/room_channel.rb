class RoomChannel < ApplicationCable::Channel
  # chatチャンネル接続時にコールされる
  def subscribed
    stream_from "chat_channel"
    ActionCable.server.broadcast 'chat_channel', message: 'connected.'
  end

  # chatチャンネルのspeakメソッドは、受け取ったメッセージを全クライアントにブロードキャストする
  def speak(data)
    ActionCable.server.broadcast 'chat_channel', message: data['message']
  end
end
