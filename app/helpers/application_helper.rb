module ApplicationHelper

  def title
    if @auction and @auction.respond_to?(:pretty_name)
      "Microebuy | #{@auction.pretty_name}"
    else
      "Microebuy | #{controller_name}"
    end

  end
end
