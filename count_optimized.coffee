root = exports ? this

# Takes an integer range and returns an array
# of integers representing the number of occurrences
# of the digits 0-9 in each number in the specified
# range (start/end inclusive)
root.countOptimized = (start, end) ->

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