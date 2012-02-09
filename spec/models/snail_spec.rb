describe Snail do
  before(:each) do
    @snail = Factory( :snail )
  end


  it "should have right pretty_name" do
    @snail.pretty_name == "@@#{@snail.name.upcase}"
  end

end