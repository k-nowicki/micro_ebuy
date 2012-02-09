class Snail < Auction
  default_scope :order => :endtime
  # - ślimacza - ma wyświetlać nazwę dużymi literami ze znakami @@ na początku
  def pretty_name
    "@@#{name.upcase}"
  end
end