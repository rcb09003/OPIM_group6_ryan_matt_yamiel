class TicketsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :update]
  before_action :correct_user,   only: :destroy

  def create
    @ticket = current_user.tickets.build(ticket_params)
    if @ticket.save
      flash[:success] = "Ticket Posted!"
      redirect_to root_url
    else
      @feed_items = []
      redirect_to request.referer
    end
  end

  def destroy
    @ticket.destroy
    redirect_to request.referer
  end
  
   def update
      update_params
      if (params[:ticket][:buyme] == "true")

         @uticket = Ticket.find(params[:id])
          
            @uticket.update_attribute(:bid_user, @current_user.id)
            @uticket.update_attribute(:starting_bid, params[:ticket][:new_bid])
            @uticket.update_attribute(:buy_price, 0)
            @uticket.update_attribute(:bid_end, (Time.now - 1.day))
            flash[:success] = "Buy Successful! "
            redirect_to request.referer

      else  

        if (params[:ticket][:new_bid] != nil)
          @uticket = Ticket.find(params[:id])
          if (@uticket.starting_bid < params[:ticket][:new_bid].to_d)
            @uticket.update_attribute(:bid_user, @current_user.id)
            @uticket.update_attribute(:starting_bid, params[:ticket][:new_bid])
            @uticket.update_attribute(:buy_price, 0)
            flash[:success] = "Bid Successful! "
            redirect_to request.referer
          else
            flash[:success] = "Bid must be higher than #{@uticket.starting_bid}"
            redirect_to request.referer
          end
        else
          flash[:success] = "Bid Fail"
          redirect_to request.referer
        end
      end
   end

   def update_params
    params.require(:ticket).permit(:starting_bid, :bid_user, :buy_user)
   end

    def ticket_params
      params.require(:ticket).permit(:title, :event_type, :admission_type, :event_time, :location, :starting_bid, :buy_price, :bid_end, :comments, :quantity)
    end

	  def correct_user
      @ticket = current_user.tickets.find_by(id: params[:id])
      redirect_to root_url if @ticket.nil?
    end


	
end