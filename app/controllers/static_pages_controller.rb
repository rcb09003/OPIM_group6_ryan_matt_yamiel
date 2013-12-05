class StaticPagesController < ApplicationController
  def home
    if signed_in?
	   @ticket = current_user.tickets.build if signed_in?
	  end
  end

  def newticket
    if signed_in?
      @ticket = current_user.tickets.build if signed_in?
    end
  end

  def all
    if signed_in?
      if (params[:searching] == "true")
        if (params[:search] != "")
        @ticket = Ticket.where('title Like ?', "%#{params[:search]}%").where("bid_end > ?", Time.now).paginate(page: params[:page])
        else
        @ticket = Ticket.where("bid_end > ?", Time.now).paginate(page: params[:page])
        end
      else
        puts case params[:type]
        when nil
          @ticket = Ticket.where("bid_end > ?", Time.now).paginate(page: params[:page])
        when "1"
          @ticket = Ticket.where("bid_end > ?", Time.now).select("*, CASE WHEN buy_price > starting_bid THEN buy_price ELSE starting_bid END AS foo_order").order("foo_order ASC").paginate(page: params[:page])
        when "2"
          @ticket = Ticket.where("bid_end > ?", Time.now).where("bid_user = ?", 0).where("buy_price > ?", 0).order("bid_end ASC").paginate(page: params[:page]) 
        when "3"
          @ticket = Ticket.where("bid_end > ?", Time.now).where("bid_user = ?", 0).where("buy_price > ?", 0).order("buy_price ASC").paginate(page: params[:page]) 
        when "4" 
          @ticket = Ticket.where("bid_end > ?", Time.now).where("buy_price = ?", 0).order("bid_end ASC").paginate(page: params[:page]) 
        when "5" 
          @ticket = Ticket.where("bid_end > ?", Time.now).where("buy_price = ?", 0).order("starting_bid ASC").paginate(page: params[:page])    
        else
        end
      end  
    end
  end

  def basketball
    if signed_in?
            puts case params[:type]
      when nil
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Basketball").paginate(page: params[:page])
      when "1"
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Basketball").select("*, CASE WHEN buy_price > starting_bid THEN buy_price ELSE starting_bid END AS foo_order").order("foo_order ASC").paginate(page: params[:page])
      when "2"
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Basketball").where("bid_user = ?", 0).where("buy_price > ?", 0).order("bid_end ASC").paginate(page: params[:page]) 
      when "3"
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Basketball").where("bid_user = ?", 0).where("buy_price > ?", 0).order("buy_price ASC").paginate(page: params[:page]) 
      when "4" 
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Basketball").where("buy_price = ?", 0).order("bid_end ASC").paginate(page: params[:page]) 
      when "5" 
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Basketball").where("buy_price = ?", 0).order("starting_bid ASC").paginate(page: params[:page])    
      else
      end
    end
  end

  def football
    if signed_in?
                  puts case params[:type]
      when nil
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Football").paginate(page: params[:page])
      when "1"
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Football").select("*, CASE WHEN buy_price > starting_bid THEN buy_price ELSE starting_bid END AS foo_order").order("foo_order ASC").paginate(page: params[:page])
      when "2"
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Football").where("bid_user = ?", 0).where("buy_price > ?", 0).order("bid_end ASC").paginate(page: params[:page]) 
      when "3"
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Football").where("bid_user = ?", 0).where("buy_price > ?", 0).order("buy_price ASC").paginate(page: params[:page]) 
      when "4" 
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Football").where("buy_price = ?", 0).order("bid_end ASC").paginate(page: params[:page]) 
      when "5" 
        @ticket = Ticket.where("bid_end > ?", Time.now).where("event_type = ?", "Football").where("buy_price = ?", 0).order("starting_bid ASC").paginate(page: params[:page])    
      else
      end
      end
  end

  def help
  end

  def about
  end

  def contact
  end

  def terms
  end
end
