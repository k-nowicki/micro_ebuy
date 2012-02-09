describe Auction do
  before(:each) do
    @attr = Factory.build( :buynow ).attributes
  end

  describe "Should create each type" do
    it "should create a new Buynow given valid attributes" do
      auction = Buynow.new(@attr)
      auction.type = @attr[:type]
      auction.save
    end

    it "should create a new Common given valid attributes" do
      auction = Common.new(@attr)
      auction.type = "Common"
      auction.save
    end

    it "should create a new Snail given valid attributes" do
      auction = Snail.new(@attr)
      auction.type = "Snail"
      auction.save
    end

    it "should create a new Penny given valid attributes" do
      auction = Penny.new(@attr)
      auction.type = "Penny"
      auction.save
    end
  end

  it "should require a name" do
    no_name_auction = Auction.new(@attr.merge(:name => ""))
    no_name_auction.should_not be_valid
  end

  it "should require a end time" do
    auction = Auction.new(@attr.merge(:end_at => ""))
    auction.should_not be_valid
  end

  it "end_at must be after now" do
    auction = Auction.new(@attr.merge(:end_at => Time.now))
    auction.should_not be_valid
  end

  it "should require a type" do
    auction = Auction.new(@attr.merge(:type => ""))
    auction.should_not be_valid
  end
end
