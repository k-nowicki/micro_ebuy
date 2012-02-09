describe Common do
  before(:each) do
    @common = Factory( :common )
  end


  it "should have right pretty_name" do
    @common.pretty_name == "#{@common.name.upcase}"
  end

end