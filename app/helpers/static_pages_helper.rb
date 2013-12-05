module StaticPagesHelper

  def ticket_bidder(user)
    User.find(user)
  end



end
