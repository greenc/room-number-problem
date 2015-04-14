root = exports ? this

# Brute-force algorithm for testing optimized results against
root.countReference = (start, end) ->

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
