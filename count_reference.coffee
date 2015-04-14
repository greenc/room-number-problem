root = exports ? this

# Brute-force algorithm for testing against
root.countReference = (start, end) ->
    tally = (0 for [0..9])
    for num in [start..end]
        if num is 0
            tally[0]++
            continue
        while num
            tally[num % 10]++
            num = Math.floor num / 10
    return tally