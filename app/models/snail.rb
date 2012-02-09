class Snail < Auction

  # - ślimacza - ma wyświetlać nazwę dużymi literami ze znakami @@ na początku
  def pretty_name
    "@@#{name.upcase}"
  end
end