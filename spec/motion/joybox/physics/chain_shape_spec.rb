describe Joybox::Physics::ChainShape do
  before do
    @world = World.new gravity: [0, -9.8]
    @body = @world.new_body position: [100, 100], type: Body::Dynamic 
  end

  describe "Initialization" do
    it "should initialize with loop" do
      circle_shape = ChainShape.new loop: [[0, 0], [16, 16], [32, 32]]

      @body.new_fixture do
        fixture shape: circle_shape
      end

      @body.fixtures.size.should == 1
    end

    it "should initialize with chain" do
      circle_shape = ChainShape.new chain: [[0, 0], [16, 16], [32, 32]]
      
      @body.new_fixture do
        fixture shape: circle_shape
      end

      @body.fixtures.size.should == 1
    end
  end

  it "should have a vertices count" do
    @body.new_fixture do
      chain_fixture chain: [[0, 0], [16, 16], [32, 32]]
    end

    shape = @body.fixtures[0].shape
    shape.vertices_count.should == 3
  end

  it "should have vertices" do
    @body.new_fixture do
      chain_fixture chain: [[0, 0], [16, 16], [32, 32]]
    end

    shape = @body.fixtures[0].shape
    shape.vertices.size.should == 3
  end

  it "should have a previous vertex" do
    @body.new_fixture do
      chain_fixture chain: [[0, 0], [16, 16], [32, 32]]
    end

    shape = @body.fixtures[0].shape
    shape.previous_vertex = [-1, -1]
    shape.has_previous_vertex?.should == true
    shape.previous_vertex.should == CGPointMake(-1, -1)
  end

  it "should have a next vertex" do
    @body.new_fixture do
      chain_fixture chain: [[0, 0], [16, 16], [32, 32]]
    end

    shape = @body.fixtures[0].shape
    shape.next_vertex = [64, 64]
    shape.has_next_vertex?.should == true
    shape.next_vertex.should == CGPointMake(64, 64)
  end

  it "should return a vertex as a Edge Shape" do
    @body.new_fixture do
      chain_fixture chain: [[0, 0], [16, 16], [32, 32]]
    end

    shape = @body.fixtures[0].shape
    edge_shape = shape.edge_shape_by_index(1)
    edge_shape.start_point.should == CGPointMake(16, 16)
    edge_shape.end_point.should == CGPointMake(32, 32)
  end

end