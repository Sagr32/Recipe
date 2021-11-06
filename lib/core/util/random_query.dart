import "dart:math";

var list = ['egg', 'burger', 'cheese', 'coffee', 'pasta'];

// generates a new Random object
final _random = Random();

// generate a random index based on the list length
// and use it to retrieve the element
var randomQuery = list[_random.nextInt(list.length)];
