describe 'countOptimized', ->

    it 'should exist', ->
        expect(countOptimized).to.be.a 'function'

    it 'should throw an error if arguments are missing', ->
        expect(-> countReference()).to.throw 'missing arguments'

    it 'should throw an error if arguments aren\'t numbers', ->
        expect(-> countReference(['nope'], 'nope')).to.throw 'arguments must be numbers'

    it 'should throw an error if arguments aren\'t whole integers', ->
        expect(-> countReference(0.1, 543.21)).to.throw 'arguments must be whole numbers'

    it 'should throw an error if arguments aren\'t positive integers or zero', ->
        expect(-> countReference(-42, -69)).to.throw 'arguments must be positive or zero'

    it 'should return the correct result for range 0-1', ->
        expect(countOptimized 0, 1).to.eql [1, 1, 0, 0, 0, 0, 0, 0, 0, 0]

    it 'should return the correct result for range 1-10', ->
        expect(countOptimized 1, 10).to.eql [1, 2, 1, 1, 1, 1, 1, 1, 1, 1]

    it 'should return the correct result for range 0-99', ->
        expect(countOptimized 0, 99).to.eql [10, 20, 20, 20, 20, 20, 20, 20, 20, 20]

    it 'should return the correct result for range 1-100', ->
        expect(countOptimized 1, 100).to.eql [11, 21, 20, 20, 20, 20, 20, 20, 20, 20]

    it 'should return the correct result for range 36-499', ->
        expect(countOptimized 36, 499).to.eql [86, 186, 186, 190, 196, 96, 97, 97, 97, 97]

    it 'should return the correct result for range 1-1000000', ->
        expect(countOptimized 1, 1000000).to.eql [488895, 600001, 600000, 600000, 600000, 600000, 600000, 600000, 600000, 600000]