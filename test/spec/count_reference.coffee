describe 'countReference', ->

    it 'should exist', ->
        expect(countReference).to.be.a 'function'

    it 'should return the correct result for range 0-1', ->
        expect(countReference 0, 1).to.eql [1, 1, 0, 0, 0, 0, 0, 0, 0, 0]

    it 'should return the correct result for range 1-10', ->
        expect(countReference 1, 10).to.eql [1, 2, 1, 1, 1, 1, 1, 1, 1, 1]

    it 'should return the correct result for range 0-99', ->
        expect(countReference 0, 99).to.eql [10, 20, 20, 20, 20, 20, 20, 20, 20, 20]

    it 'should return the correct result for range 1-100', ->
        expect(countReference 1, 100).to.eql [11, 21, 20, 20, 20, 20, 20, 20, 20, 20]

    it 'should return the correct result for range 36-499', ->
        expect(countReference 36, 499).to.eql [86, 186, 186, 190, 196, 96, 97, 97, 97, 97]

    it 'should return the correct result for range 1-1000000', ->
        expect(countReference 1, 1000000).to.eql [488895, 600001, 600000, 600000, 600000, 600000, 600000, 600000, 600000, 600000]