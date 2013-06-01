describe Joybox::Macros do

  before do 
    @point_one = CGPointMake(100, 200)
    @point_two = CGPointMake(300, 400)
    @intersect_point_one = CGPointMake(100, 100)
    @intersect_point_two = CGPointMake(400, 400)
    @intersect_point_three = CGPointMake(100, 400)
    @intersect_point_four = CGPointMake(400, 100)
    @angle = 1
  end


  describe :jbp do
    it "should get a new point" do
      point = jbp(100, 200)
      point.should == @point_one
    end
  end

  describe :jbpNeg do
    it "should get the oposite point" do
      point = jbpNeg(@point_one)
      point.should == CGPointMake(-100, -200)
    end
  end

  describe :jbpAdd do
    it "should sum of two points" do
      point = jbpAdd(@point_one, @point_two)
      point.should == CGPointMake(400, 600)
    end
  end

  describe :jbpSub do
    it "should substract of two points" do
      point = jbpSub(@point_one, @point_two)
      point.should == CGPointMake(-200, -200)
    end
  end

  describe :jbpMult do
    it "should multiply point for a factor" do
      point = jbpMult(@point_one, 0.5)
      point.should == CGPointMake(50, 100)
    end
  end

  describe :jbpMidPoint do
    it "should get the middle point between two points" do
      point = jbpMidPoint(@point_one, @point_two)
      point.should == CGPointMake(200, 300)
    end
  end

  describe :jbpDot do
    it "should get the product of two points" do
      product = jbpDot(@point_one, @point_two)
      product.should == 110000
    end
  end

  describe :jbpCross do
    it "should get the cross product of two points" do
      cross_product = jbpCross(@point_one, @point_two)
      cross_product.should == -20000
    end
  end

  describe :jbpPerp do
    it "should get the perpendicular of a point, rotated 90º counter-clockwise" do
      point = jbpPerp(@point_one)
      point.should == CGPointMake(-200, 100)
    end
  end

  describe :jbpRPerp do
    it "should get the perpendicular of a point, rotated 90º clockwise" do
      point = jbpRPerp(@point_one)
      point.should == CGPointMake(200, -100)
    end
  end

  describe :jbpProject do
    it "should get the projection of the first point over the second point" do
      point = jbpProject(@point_one, @point_two)
      point.x.should.be.close 132, 0.1
      point.y.should.be.close 176, 0.1
    end
  end

  describe :jbpRotate do
    it "should get the rotation of two points" do
      point = jbpRotate(@point_one, @point_two)
      point.should == CGPointMake(-50000, 100000)
    end
  end

  describe :jbpUnrotate do
    it "should get the unrotation of two points" do
      point = jbpUnrotate(@point_one, @point_two)
      point.should == CGPointMake(110000, 20000)
    end
  end

  describe :jbpLengthSQ do
    it "should get the square lenght of a point" do
      lenght = jbpLengthSQ(@point_one)
      lenght.should == 50000
    end
  end

  describe :jbpDistanceSQ do
    it "should get the square distance between two points" do
      lenght = jbpDistanceSQ(@point_one, @point_two)
      lenght.should == 80000
    end
  end

  describe :jbpLength do
    it "should get the lenght of a point" do
      lenght = jbpLength(@point_one)
      lenght.should == 223.606796
    end
  end

  describe :jbpDistance do
    it "should get the distance between two points" do
      lenght = jbpDistance(@point_one, @point_two)
      lenght.should == 282.842712474619
    end
  end

  describe :jbpNormalize do
    it "should get a point normalized" do
      point = jbpNormalize(@point_one)
      point.should == CGPointMake(0.447213649749756, 0.894427299499512)
    end
  end

  describe :jpbForAngle do
    it "should get the normalized point of an angle in radians" do
      point = jbpForAngle(@angle)
      point.should == CGPointMake(0.540302276611328, 0.841470956802368)
    end
  end

  describe :jbpToAngle do
    it "should get an angle in radians of a point" do
      angle = jbpToAngle(@point_one)
      angle.should == 1.107149
    end
  end

  describe :jbpClamp do
    it "should get a point between from and to" do
      point = jbpClamp(@point_one, CGPointMake(0, 0), @point_two)
      point.should == @point_one

      point = jbpClamp(@point_two, @point_one, @point_two)
      point.should == @point_two

      point = jbpClamp(@point_two, @point_one, @point_one)
      point.should == @point_one

      point = jbpClamp(@point_one, @point_two, @point_two)
      point.should == @point_two
    end
  end

  describe :jbpFromSize do
    it "should get a point from a size" do
      point = jbpFromSize(CGSizeMake(100, 200))
      point.should == @point_one
    end
  end

  describe :jbpCompOp do
    it "should run a math operation function on each point component" do
      point = jbpCompOp(@point_one) { |n| n * 10 }
      point.should == CGPointMake(1000, 2000)
    end
  end

  describe :jbpLerp do
    it "should get the linear interpolation between two points" do
      point = jbpLerp(@point_one, @point_two, 0.5)
      point.should == CGPointMake(200, 300)
    end
  end

  describe :jbpFuzzyEqual do
    it "should get if two points are equal with some degree of variance" do
      equal = jbpFuzzyEqual(@point_one, @point_two, 100)
      equal.should == false

      equal = jbpFuzzyEqual(@point_one, @point_one, 0)
      equal.should == true

      equal = jbpFuzzyEqual(@point_one, @point_two, 200)
      equal.should == true
    end
  end

  describe :jbpCompMult do
    it "should get the product between two points" do
      point = jbpCompMult(@point_one, @point_two)
      point.should == CGPointMake(30000, 80000)
    end
  end

  describe :jbpAngleSigned do
    it "should get the signed angle between two points" do
      angle = jbpAngleSigned(@point_one, @point_two)
      angle.should == -0.179853200912476
    end
  end

  describe :jbpAngle do
    it "should get the angle between two points" do
      angle = jbpAngle(@point_one, @point_two)
      angle.should == 0.179855465888977
    end
  end

  describe :jbpRotateByAngle do
    it "should get a point rotated counter-clockwise by the angle around a pivot point" do
      point = jbpRotateByAngle(@point_one, @point_two, @angle)
      point.should == CGPointMake(360.233734130859, 123.645385742188)
    end
  end

  describe :jbpLineIntersect do
    it "should get if two lines intersect" do
      intersect = jbpLineIntersect(@point_one, @point_two, @point_two, @point_one)
      intersect.should == { s: 0, t: 0 }

      intersect = jbpLineIntersect(@point_two, @point_two, @point_two, @point_two)
      intersect.should == nil

      intersect = jbpLineIntersect(@intersect_point_one, 
                                   @intersect_point_two, 
                                   @intersect_point_three, 
                                   @intersect_point_four)
      intersect.should == { s: 0.5, t: 0.5 }
    end
  end

  describe :jbpSegmentIntersect do
    it "should get it two segments intersect" do
      intersect = jbpSegmentIntersect(@point_one, @point_two, @point_two, @point_one)
      intersect.should == true

      intersect = jbpSegmentIntersect(@point_two, @point_two, @point_two, @point_two)
      intersect.should == false

      intersect = jbpSegmentIntersect(@intersect_point_one, 
                                      @intersect_point_two, 
                                      @intersect_point_three, 
                                      @intersect_point_four)
      intersect.should == true
    end
  end

  describe :jbpIntersectPoint do
    it "should get the intersection point between two lines" do
      point = jbpIntersectPoint(@point_one, @point_two, @point_two, @point_one)
      point.should == CGPointMake(100, 200)

      point = jbpIntersectPoint(@point_two, @point_two, @point_two, @point_two)
      point.should == CGPointMake(0, 0)

      point = jbpIntersectPoint(@intersect_point_one, 
                                @intersect_point_two, 
                                @intersect_point_three, 
                                @intersect_point_four)
      point.should == CGPointMake(250, 250)
    end
  end
end
