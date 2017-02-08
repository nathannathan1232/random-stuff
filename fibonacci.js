/**
 * Use the following command:
 * node fibonacci.js <number>
 * 
 * It will print out the number in the sequence at index n.
 */


"use strict";

var n = process.argv[2];

var sqrt5 = Math.sqrt(5);

var res = (Math.pow(1 + sqrt5, n) - Math.pow(1 - sqrt5, n)) / (Math.pow(2, n) * sqrt5);

console.log(Math.round(res));