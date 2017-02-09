'use strict';

function match(word, pat) {
	for(var i = 0; i < word.length; i++) {
		var map = {};
		var matches = true;
		for(var j = 0; j < pat.length; j++) {
			if(!map[pat[j]]) {
				map[pat[j]] = word[i + j];
			} else if(word[i + j] !== map[pat[j]]) {
				matches = false;
			}
			var s = 0;
			for(var x in map)
				if(map[x] == word[i + j])
					s++;
			if(s > 1)
				matches = false;
		}
		if(matches)
			return true;
	}
	return false;
}

var word = process.argv[2];
var pat  = process.argv[3];

console.log(match(word, pat));
