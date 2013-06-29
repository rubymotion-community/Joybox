describe Joybox::Physics::CircleShape do
  before do
    @world = World.new gravity: [0, -9.8]
    @body = @world.new_body position: [100, 100], type: KDynamicBodyType 
  end

  describe "Initialization" do
    it "should initialize with radius" do
      circle_shape = CircleShape.new radius: 60

      @body.new_fixture do
        fixture shape: circle_shape
      end

      @body.fixtures.size.should == 1
    end
  end

  it "should have a vertices count" do
    @body.new_fixture do
      circle_fixture radius: 60
    end

    shape = @body.fixtures[0].shape
    shape.vertices_count.should == 1
  end

  it "should have a position" do
    @body.new_fixture do
      circle_fixture radius: 60
    end

    shape = @body.fixtures[0].shape
    shape.position.should == CGPointMake(0, 0)
  end

  it "should get a vertex support index for a direction" do
    @body.new_fixture do
      circle_fixture radius: 60
    end

    shape = @body.fixtures[0].shape
    shape.support_vertex_index_by_direction([0, 0]).should == 0
  end

  it "should get a vertex support for a direction" do
    @body.new_fixture do
      circle_fixture radius: 60
    end

    shape = @body.fixtures[0].shape
    shape.support_vertex_by_direction([0, 0]).should == CGPointMake(0, 0)
  end

  it "should get a vertex" do
    @body.new_fixture do
      circle_fixture radius: 60
    end

    shape = @body.fixtures[0].shape
    shape.vertex_by_index(0).should == CGPointMake(0.0, 0.0)
  end
end