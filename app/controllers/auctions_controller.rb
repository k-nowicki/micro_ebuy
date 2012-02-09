class AuctionsController < ApplicationController

  #W produkcyjnej aplikacji użyłbym tutaj kaminari => http://railscasts.com/episodes/254-pagination-with-kaminari
  #ale to "Lista aukcji ma wyświetlać wszystkie aukcje w systemie" zabrzmiało jakby paginacja była nadmiarowa
  def index
    @auctions = Auction.sorted.all
  end

  def auction_list
    @auctions = Auction.sorted.all
    render :partial => "auction"
  end

  def show
    @auction = Auction.find(params[:id])
  end

  def new
    setup_sti_model
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def create
    setup_sti_model
    if @auction.save
      redirect_to @auction, notice: 'Auction was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @auction = Auction.find(params[:id])
    if @auction.update_attributes(params[:auction])
      redirect_to @auction, notice: 'Auction was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy
    redirect_to auctions_url
  end


  private

  #To najprostrze i najbardziej przejrzyste podejście jakie udało mi się znaleźć
  # do zastosowania STI
  def setup_sti_model
    model = determine_model
    @auction = Auction.new(params[:auction])
    @auction.type = model
  end

  def determine_model
      begin
        params[:auction].delete(:type).constantize.to_s
      rescue
        nil
      end
  end

end