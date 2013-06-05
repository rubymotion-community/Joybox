describe "Application 'JoyBox'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 1
  end

  it "has a director" do
    @app.director.should.not == nil
  end
end