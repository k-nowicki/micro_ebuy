class Buynow < Auction

  # - kup teraz - ma wyświetlać nazwę dużymi literami z trzema wykrzyknikami dodatkowo na końcu
  def pretty_name
    "#{name.upcase}!!!"
  end
end