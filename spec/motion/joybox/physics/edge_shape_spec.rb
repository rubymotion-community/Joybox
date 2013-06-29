describe Joybox::Physics::EdgeShape do
  before do
    @world = World.new gravity: [0, -9.8]
    @body = @world.new_body position: [100, 100], type: Body::Dynamic 
  end

  describe "Initialization" do
    it "should initialize with start point and end point" do
      edge_shape = EdgeShape.new start_point: [0, 0], end_point: [100, 100]

      @body.new_fixture do
        fixture shape: edge_shape
      end

      @body.fixtures.size.should == 1
    end
  end

  it "should have an start and end point" do
    @body.new_fixture do
      edge_fixture start_point: [0, 0], end_point: [100, 100]
    end

    shape = @body.fixtures[0].shape
    shape.start_point.should == CGPointMake(0, 0)
    shape.end_point.should == CGPointMake(100, 100)
  end

  it "should know if it has an start and end adjacent point" do
    @body.new_fixture do
      edge_fixture start_point: [0, 0], end_point: [100, 100]
    end

    shape = @body.fixtures[0].shape
    shape.has_start_adjacent_point?.should == false
    shape.has_end_adjacent_point?.should == false
  end

  it "should have an start and end adjacent point" do
    @body.new_fixture do
      edge_fixture start_point: [0, 0], end_point: [100, 100]
    end

    shape = @body.fixtures[0].shape
    shape.start_adjacent_point.should == CGPointMake(0, 0)
    shape.end_adjacent_point.should == CGPointMake(0, 0)
  end
end