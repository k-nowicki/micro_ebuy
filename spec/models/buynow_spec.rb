describe Buynow do
  before(:each) do
    @buynow = Factory( :buynow )
  end


  it "should have right pretty_name" do
    @buynow.pretty_name == "#{@buynow.name.upcase}!!!"
  end

end
