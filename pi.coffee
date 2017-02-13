###
# Calculates digits of pi using the Borwein Algorithm
# https://en.wikipedia.org/wiki/Borwein%27s_algorithm
# 
# Each iteration of the formula adds 25 correct digits
###

math = require('mathjs')
fs = require('fs')

# Load the actual value of pi from file. This can be used to compare later.
pi = fs.readFileSync('pi.txt').toString().replace(/ /g, '')

# Compares your number to the real value of pi, and return the amount of accurate digits
compare = (p) ->
	for i in [0...p.length]
		if p[i] != pi[i]
			return i
	return true

# Initiate big numbers
math.config({
	number: 'BigNumber',
	precision: 1000
})

# n is how many iterations you want
calculate = (n) ->
	a = math.eval '212175710912 * sqrt(61) + 1657145277365'
	b = math.eval '13773980892672 * sqrt(61) + 107578229802750'
	c = math.eval '(5280(236674 + 30303 * sqrt(61)))^3'
	res = 0

	# Calculate pi. 25 digits added per iteration
	for i in [0...n]
		equation = "
			((-1)^#{i} * (6 * #{i})! * (#{a} + #{i} * #{b})) /
			((#{i}!)^3 * (3 * #{i})! * #{c}^(#{i} + .5))
		"
		res = math.add(res, math.eval equation)

	# Return the final value
	math.eval('1 / (' + res + ' * 12)')+''

# Calculate pi to 2 * 25 digits
p = calculate 2

console.log "
	Digits calculated: #{p.length}\n
	Accurate digits:   #{compare p}
"
