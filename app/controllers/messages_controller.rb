class MessagesController < ApplicationController

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])

    if @message.save
	redirect_to(@message.listing)
    else
	flash[:error] = "Error: Your message has not been posted. Please try again or report this error to the webmaster." % params[:offer][:amount]
	redirect_to :controller=>"listings", :action=>"show", :id=>@message.listing.id
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to(@message, :notice => 'Message was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end
end
