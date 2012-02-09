class Penny < Auction

  # - za grosik - ma wyświetlać nazwę dużymi literami w cudzysłowach
  def pretty_name
    "\"#{name.upcase}\""
  end
end