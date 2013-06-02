describe "CGPoint Matchers" do
  it "should determinate if two points are close using a delta" do
    point_one = CGPointMake(100, 100)
    point_two = CGPointMake(200, 200)

    point_one.should.be.close point_two, 100
    point_one.should.not.be.close point_two, 50

    point_two.should.be.close point_one, 100
    point_two.should.not.be.close point_one, 50

    point_one.should.be.close point_one, 0
  end
end