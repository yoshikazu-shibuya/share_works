class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = @qas.messages.includes(:user)
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def message_params
    params.require(:message).permit(:subject, :message).merge(user_id: current_user.id, qa_id: params[:qa_id])
  end
end
