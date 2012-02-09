require 'spec_helper'

describe AuctionsController do
  render_views

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should have the right title" do
      get 'index'
      response.should have_selector :title, :content => "auctions"
    end
  end


  describe "GET show" do
    before(:each) do
      @auction = Factory(:buynow)
    end

    it "should be successful" do
      get :show, :id => @auction
      response.should be_success
    end

    it "should find the right title" do
      get :show, :id => @auction
      assigns(:auction).should == @auction
    end

    it "should have the right title" do
      get :show, :id => @auction
      response.should have_selector :title, :content => @auction.pretty_name
    end

    it "should include the auction's name" do
      get :show, :id => @auction
      response.should have_selector 'h1', :content => @auction.name
    end
  end


  describe "GET new" do
      it "should be successful" do
        get :new
        response.should be_success
      end

      it "should have a name field" do
        get :new
        response.should have_selector("input[name='auction[name]'][type='text']")
      end

      it "should have a type field" do
        get :new
        response.should have_selector("select[name='auction[type]']")
      end

      it "should have a end time field" do
        get :new
        response.should have_selector("select[name='auction[end_at(1i)]']")
      end
    end


    describe "GET edit" do
      before(:each) do
        @auction = Factory(:buynow)
      end

      it "should be successful" do
        get :edit, :id => @auction
        response.should be_success
      end

      it "should have a name field" do
        get :edit, :id => @auction
        response.should have_selector("input[name='auction[name]'][type='text']")
      end

      it "should have a type field" do
        get :edit, :id => @auction
        response.should have_selector("select[name='auction[type]']")
      end

      it "should have a end time field" do
        get :edit, :id => @auction
        response.should have_selector("select[name='auction[end_at(1i)]']")
      end
    end


    describe "POST create" do

      describe "failure" do
        before(:each) do
          @attr = Factory.build(:buynow, :name => "").attributes
        end

        it "should not create a auction" do
          lambda do
            post :create, :auction => @attr
          end.should_not change(Auction, :count)
        end

        it "should render the 'new' page" do
          post :create, :auction => @attr
          response.should render_template('new')
        end
      end

      describe "success" do
        before(:each) do
          @attr = Factory.build(:auction).attributes
        end

        it "should create a auction" do
          lambda do
            post :create, :auction => @attr
          end.should change(Auction, :count).by(1)
        end

        it "should redirect to the auction show page" do
          post :create, :auction => @attr
          response.should redirect_to(auction_path(assigns(:auction)))
        end
      end
    end


    describe "PUT update" do
      before(:each) do
        @auction = Factory(:auction)
      end

      describe "failure" do
        before(:each) do
          @attr = Factory.build(:auction, :name => "").attributes
        end

        it "should render the 'edit' page" do
          put :update, :id => @auction, :auction => @attr
          response.should render_template('edit')
        end

      end

      describe "success" do
        before(:each) do
          @attr = Factory.build(:auction).attributes
        end

        it "should change the auction's attributes" do
          put :update, :id => @auction, :auction => @attr
          @auction.reload
          @auction.name.should  == @attr["name"]
        end

        it "should redirect to the auction show page" do
          put :update, :id => @auction, :auction => @attr
          response.should redirect_to(buynow_path(@auction))
        end

        it "should have a flash message" do
          put :update, :id => @auction, :auction => @attr
          flash[:notice].should =~ /updated/
        end
      end
    end


    describe "DELETE destroy" do
      before(:each) do
        @auction = Factory(:auction)
      end

      it "should destroy the auction" do
        lambda do
          delete :destroy, :id => @auction
        end.should change(Auction, :count).by(-1)
      end

      it "should redirect to the auctions page" do
        delete :destroy, :id => @auction
        response.should redirect_to(auctions_path)
      end
    end



end