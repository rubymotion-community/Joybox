describe Joybox::Cocos2D do
  describe :director do
    it 'should returns shared director' do
      Joybox::Cocos2D.director.should.equal(Joybox::Cocos2D::Director.sharedDirector)
    end
  end
end
