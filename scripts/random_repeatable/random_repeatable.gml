/// @func random_repeatable(endNumber, xPos, yPos, seed);
/// @desc Returns a point on a line
/// @param endNumber
/// @param xPos
/// @param yPos
/// @param seed
function random_repeatable(argument0, argument1, argument2, argument3) {

	var originalSeed = random_get_seed();
	var endNumber = argument0;
	var xPos = argument1;
	var yPos = argument2;
	var seed = argument3;

	random_set_seed(get_seed(xPos, yPos, seed));

	var randomNumber = random(endNumber);

	random_set_seed(originalSeed);
	return randomNumber;



}
