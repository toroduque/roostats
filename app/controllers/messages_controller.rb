class MessagesController < ApplicationController

  before_action :authenticate_rider!, :except => [:new, :create]
  layout 'public'

  def index
    @messages = Message.sorted
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message sent successfuly"
      redirect_to('/public/index')
    else
      puts(@message.errors.full_messages)
      render('new')
    end
  end

  def delete
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end


  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :message )
  end

end
