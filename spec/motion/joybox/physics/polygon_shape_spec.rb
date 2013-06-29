describe Joybox::Physics::PolygonShape do
  before do
    @world = World.new gravity: [0, -9.8]
    @body = @world.new_body position: [100, 100], type: KDynamicBodyType 
  end

  describe "Initialization" do
    it "should initialize with box" do
      polygon_shape = PolygonShape.new box: [16, 16]

      @body.new_fixture do
        fixture shape: polygon_shape
      end

      @body.fixtures.size.should == 1
    end

    it "should initialize with box, center and angle" do
      polygon_shape = PolygonShape.new box: [16, 16], center: [8, 8], angle: 10

      @body.new_fixture do
        fixture shape: polygon_shape
      end

      @body.fixtures.size.should == 1
    end

    it "should initialize with vertices" do
      polygon_shape = PolygonShape.new vertices: [[0, 0], [16, 0], [0, 16]]

      @body.new_fixture do
        fixture shape: polygon_shape
      end

      @body.fixtures.size.should == 1
    end
  end

  it "should have a vertices count" do
    @body.new_fixture do
      polygon_fixture vertices: [[0, 0], [16, 0], [0, 16]]
    end

    shape = @body.fixtures[0].shape
    shape.vertices_count.should == 3
  end

  it "should have a centroid" do
    @body.new_fixture do
      polygon_fixture vertices: [[0, 0], [16, 0], [0, 16]]
    end

    shape = @body.fixtures[0].shape
    shape.centroid.should.be.close CGPointMake(5.33, 5.33), 0.01
  end

  it "should have vertices" do
    @body.new_fixture do
      polygon_fixture box: [16, 16]
    end

    shape = @body.fixtures[0].shape
    shape.vertices.size.should == 4
    shape.vertices[0].should == CGPointMake(-16.0, -16.0)
    shape.vertices[1].should == CGPointMake(16.0, -16.0)
    shape.vertices[2].should == CGPointMake(16.0, 16.0)
    shape.vertices[3].should == CGPointMake(-16.0, 16.0)
  end

  it "should have normals" do
    @body.new_fixture do
      polygon_fixture box: [16, 16]
    end

    shape = @body.fixtures[0].shape
    shape.normals.size.should == 4
    shape.normals[0].should == CGPointMake(0.0, -32.0)
    shape.normals[1].should == CGPointMake(32.0, 0.0)
    shape.normals[2].should == CGPointMake(0.0, 32.0)
    shape.normals[3].should == CGPointMake(-32.0, 0.0)
  end

  it "should get a vertex" do
    @body.new_fixture do
      polygon_fixture box: [16, 16]
    end

    shape = @body.fixtures[0].shape
    shape.vertex_by_index(0).should == CGPointMake(-16.0, -16.0)
  end
  
end