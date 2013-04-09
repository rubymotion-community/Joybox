describe Joybox::Cocos2D::Macros do
  describe :jbpNeg do
    it 'should returns opposite of point' do
      subject = Joybox::Cocos2D::Macros.new.jbpNeg(CGPointMake(1, 2))
      subject.x.should.equal(-1)
      subject.y.should.equal(-2)
    end
  end

  describe :jbpAdd do
    it 'should sum of two points' do
      subject = Joybox::Cocos2D::Macros.new.jbpAdd(CGPointMake(1, 2), CGPointMake(3, 4))
      subject.x.should.equal(4)
      subject.y.should.equal(6)
    end
  end

  describe :jbpCompOp do
    it 'should run a math operation function on each point component' do
      subject = Joybox::Cocos2D::Macros.new.jbpCompOp(CGPointMake(1, 2)) {|n| n * 10 }
      subject.x.should.equal(10)
      subject.y.should.equal(20)
    end
  end

  describe :jbpLineIntersect do
    # TODO
  end

  describe :jbpSegmentIntersect do
    # TODO
  end

  describe :jbpIntersectPoint do
    # TODO
  end
end
