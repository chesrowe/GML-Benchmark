/// @func irandom_range_repeatable(startNumber, endNumber, xPos, yPos, seed);
/// @desc Returns an integer between startNumber (inclusive) and endNumber (inclusive).
/// @param startNumber
/// @param endNumber
/// @param xPos
/// @param yPos
/// @param seed
function irandom_range_repeatable(argument0, argument1, argument2, argument3, argument4) {

	var originalSeed = random_get_seed();
	var startNumber = argument0;
	var endNumber = argument1;
	var xPos = argument2;
	var yPos = argument3;
	var seed = argument4;

	random_set_seed(get_seed(xPos, yPos, seed));
	var randomNumber = irandom_range(startNumber, endNumber);

	random_set_seed(originalSeed);
	return randomNumber;



}
