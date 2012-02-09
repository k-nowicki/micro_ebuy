describe Penny do
  before(:each) do
    @penny = Factory( :penny )
  end


  it "should have right pretty_name" do
    @penny.pretty_name == "/""#{@penny.name.upcase}/"""
  end

end