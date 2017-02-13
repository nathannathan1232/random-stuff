is_prime = (n) ->
	return false if n < 2 == 0

	return n == 2 if n % 2 == 0

	return n == 3 if n % 3 == 0

	h = Math.floor Math.sqrt n
	f = 5

	while f <= h
		return false if n % f == 0

		return false if n % (f + 2) == 0

		f += 6

	true

# Examples
console.log is_prime 5      # true
console.log is_prime 2      # true
console.log is_prime 6      # false
console.log is_prime 738821 # false
console.log is_prime 75883  # true
