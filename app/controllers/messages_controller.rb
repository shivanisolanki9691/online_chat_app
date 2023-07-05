class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to room_path(@message.room), notice: "Message sent successfully."
    else
      render :new  
    end
  end

  # def create
  #   current_user = current_user
  #   @message = current_user.messages.create(content: message_params[:content], room_id: params[:room_id])
  # end

  def update
    if @message.update(message_params)
      redirect_to message_url(@message), notice: "Message was successfully updated." 
    end
  end

  def destroy
    message_ids = params[:message_ids]
    Message.where(id: message_ids).destroy_all
    redirect_to messages_url, notice: "Messages were successfully destroyed."
  end
  private
    def set_message
      if params[:id] == 'destroy_multiple'
        @messages = Message.where(id: params[:message_ids])
      else
        @message = Message.find(params[:id])
      end
    end

    def message_params
      params.require(:message).permit(:content, :user_id, :room_id)
    end
end