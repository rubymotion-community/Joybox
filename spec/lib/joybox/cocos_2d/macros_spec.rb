describe Joybox::Cocos2D::Macros do
  describe :bbpNeg do
    it 'should returns opposite of point' do
      subject = Joybox::Cocos2D::Macros.new.bbpNeg(CGPointMake(1, 2))
      subject.x.should.equal(-1)
      subject.y.should.equal(-2)
    end
  end

  describe :bbpAdd do
    it 'should sum of two points' do
      subject = Joybox::Cocos2D::Macros.new.bbpAdd(CGPointMake(1, 2), CGPointMake(3, 4))
      subject.x.should.equal(4)
      subject.y.should.equal(6)
    end
  end

  describe :bbpCompOp do
    it 'should run a math operation function on each point component' do
      subject = Joybox::Cocos2D::Macros.new.bbpCompOp(CGPointMake(1, 2)) {|n| n * 10 }
      subject.x.should.equal(10)
      subject.y.should.equal(20)
    end
  end

  describe :bbpLineIntersect do
    # TODO
  end

  describe :bbpSegmentIntersect do
    # TODO
  end

  describe :bbpIntersectPoint do
    # TODO
  end
end
