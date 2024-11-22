class ChatroomController < ApplicationController

  before_action :require_login
  def index

    @message = Message.new
    @messages = Message.custom_last_few

  end

end