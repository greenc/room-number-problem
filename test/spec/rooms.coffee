# Tests for naive algorithm
describe 'naive', ->

    it 'should exist', ->
        expect(rooms.naive).to.be.a 'function'

    it 'should throw an error if arguments are missing', ->
        expect(-> rooms.naive()).to.throw 'missing arguments'

    it 'should throw an error if arguments aren\'t numbers', ->
        expect(-> rooms.naive(['nope'], 'nope')).to.throw 'arguments must be numbers'

    it 'should throw an error if arguments aren\'t whole integers', ->
        expect(-> rooms.naive(0.1, 543.21)).to.throw 'arguments must be whole numbers'

    it 'should throw an error if arguments aren\'t positive integers or zero', ->
        expect(-> rooms.naive(-42, -69)).to.throw 'arguments must be positive or zero'

    it 'should return the correct result for range 0-1', ->
        expect(rooms.naive 0, 1).to.eql [1, 1, 0, 0, 0, 0, 0, 0, 0, 0]

    it 'should return the correct result for range 1-10', ->
        expect(rooms.naive 1, 10).to.eql [1, 2, 1, 1, 1, 1, 1, 1, 1, 1]

    it 'should return the correct result for range 0-99', ->
        expect(rooms.naive 0, 99).to.eql [10, 20, 20, 20, 20, 20, 20, 20, 20, 20]

    it 'should return the correct result for range 1-100', ->
        expect(rooms.naive 1, 100).to.eql [11, 21, 20, 20, 20, 20, 20, 20, 20, 20]

    it 'should return the correct result for range 36-499', ->
        expect(rooms.naive 36, 499).to.eql [86, 186, 186, 190, 196, 96, 97, 97, 97, 97]

    it 'should return the correct result for range 1-1000000', ->
        expect(rooms.naive 1, 1000000).to.eql [488895, 600001, 600000, 600000, 600000, 600000, 600000, 600000, 600000, 600000]


# Tests for optimized algorithm
describe 'optimized', ->

    it 'should exist', ->
        expect(rooms.optimized).to.be.a 'function'

    it 'should throw an error if arguments are missing', ->
        expect(-> rooms.optimized()).to.throw 'missing arguments'

    it 'should throw an error if arguments aren\'t numbers', ->
        expect(-> rooms.optimized(['nope'], 'nope')).to.throw 'arguments must be numbers'

    it 'should throw an error if arguments aren\'t whole integers', ->
        expect(-> rooms.optimized(0.1, 543.21)).to.throw 'arguments must be whole numbers'

    it 'should throw an error if arguments aren\'t positive integers or zero', ->
        expect(-> rooms.optimized(-42, -69)).to.throw 'arguments must be positive or zero'

    it 'should return the correct result for range 0-1', ->
        expect(rooms.optimized 0, 1).to.eql [1, 1, 0, 0, 0, 0, 0, 0, 0, 0]

    it 'should return the correct result for range 1-10', ->
        expect(rooms.optimized 1, 10).to.eql [1, 2, 1, 1, 1, 1, 1, 1, 1, 1]

    it 'should return the correct result for range 0-99', ->
        expect(rooms.optimized 0, 99).to.eql [10, 20, 20, 20, 20, 20, 20, 20, 20, 20]

    it 'should return the correct result for range 1-100', ->
        expect(rooms.optimized 1, 100).to.eql [11, 21, 20, 20, 20, 20, 20, 20, 20, 20]

    it 'should return the correct result for range 36-499', ->
        expect(rooms.optimized 36, 499).to.eql [86, 186, 186, 190, 196, 96, 97, 97, 97, 97]

    it 'should return the correct result for range 1-1000000', ->
        expect(rooms.optimized 1, 1000000).to.eql [488895, 600001, 600000, 600000, 600000, 600000, 600000, 600000, 600000, 600000]
