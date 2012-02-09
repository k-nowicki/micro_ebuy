class Common < Auction

  # - zwykła - ma wyświetlać nazwę dużymi literami
  def pretty_name
    name.upcase
  end
end