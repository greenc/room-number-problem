###
# Defines a module/global that exposes an object with two methods:
#
# rooms.naive
# rooms.optimized
#
# 'naive' computes the result of the problem using a brute-force
# loop to increase a tally for each digit of each number in
# the provided range.
#
# 'optimized' uses basic maths to speed up the loop by aggregating
# 'chunks' of numbers into a single iteration where possible.
#
# Usage:
#
# rooms.optimized 1, 99 //[10, 20, 20, 20, 20, 20, 20, 20, 20, 20]
#
###
do (name = 'rooms', factory = ->

    methods = {}

    ###
    # Naive, brute-force algorithm for testing optimized results against
    ###
    methods.naive = (start, end) ->
        # Sanity check
        throw Error 'missing arguments' if !start? or !end?
        throw Error 'arguments must be numbers' if typeof start isnt 'number' or typeof end isnt 'number'
        throw Error 'arguments must be whole numbers' if start % 1 isnt 0 or end % 1 isnt 0
        throw Error 'arguments must be positive or zero' if start < 0 or end < 0

        tally = (0 for [0..9])
        for num in [start..end]
            if num is 0
                tally[0]++
                continue
            while num
                tally[num % 10]++
                num = Math.floor num / 10

        return tally

    ###
    # Takes an integer range and returns an array
    # of integers representing the number of occurrences
    # of the digits 0-9 in each number in the specified
    # range (start/end inclusive)
    ###
    methods.optimized = (start, end) ->
        # Sanity check
        throw Error 'missing arguments' if !start? or !end?
        throw Error 'arguments must be numbers' if typeof start isnt 'number' or typeof end isnt 'number'
        throw Error 'arguments must be whole numbers' if start % 1 isnt 0 or end % 1 isnt 0
        throw Error 'arguments must be positive or zero' if start < 0 or end < 0

        # Vars
        power = nines = prefix = 0
        tally = (0 for [0..9])

        # Tally digits for a number
        increment = (num, count) ->
            if num is 0
                tally[0]++
                return
            while num
                tally[num % 10] += count
                num = Math.floor num / 10

        # Get number of trailing zeros in a number
        trailing = (n, t) ->
            return 0 if num is 0
            t = 0 if typeof t isnt 'number'
            if n % 10 is 0 then t++ else return t
            trailing Math.floor n / 10, t

        # Get leading non-zero digits in a number
        leading = (n) -> if n % 10 is 0 then leading Math.floor n / 10 else return n

        # Optimization routine
        for num in [start..end]
            increment num, 1
            power = trailing num
            if power > 0
                nines = Math.pow 10, power - 1
                if num + nines <= end
                    tally.map -> power * Math.pow 10, power - 1
                    tally[0] -= -power
                    prefix = leading num
                    increment prefix, nines
                    num += nines

        return tally

    methods # Return
) ->
    # Export for correct environment
    if typeof module isnt 'undefined'
        # CommonJS/Node
        module.exports = factory()
    else if typeof define is 'function' and typeof define.amd is 'object'
        # AMD/RequireJS
        define factory
    else
        # Browser global
        this[name] = factory()
    return
