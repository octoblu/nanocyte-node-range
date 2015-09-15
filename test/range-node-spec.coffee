RangeNode = require '../src/range-node'
describe 'Range Node', ->
  it 'should exist', ->
    expect(RangeNode).to.exist

  describe 'when constructed', ->
    beforeEach ->
      @sut = new RangeNode

    it 'should exist', ->
      expect(@sut).to.exist

    it 'should have an onMessage function', ->
      expect(@sut.onMessage).to.exist

  describe '->onMessage', ->
    describe 'when value is within the range', ->
      beforeEach ->
        @config = {
          min: 1
          max: 5
          value: 3
        }
        @data = {}
        @callback = sinon.spy()
        @message = {
          hi: 'whatsup'
        }
        @sut = new RangeNode(@config, @data)
        @sut.onMessage(@message, @callback)
      it 'should return the message', ->
        expect(@callback).to.have.been.calledWith(null, @message)

    describe 'when value is not within the range', ->
      beforeEach ->
        @config = {
          min: 1
          max: 5
          value: 7
        }
        @data = {}
        @callback = sinon.spy()
        @message = {
          hi: 'whatsup'
        }
        @sut = new RangeNode(@config, @data)
        @sut.onMessage(@message, @callback)
      it 'should return null and no message', ->
        expect(@callback).to.have.been.calledWith(null)
        expect(@callback).to.not.have.been.calledWith(@message)
