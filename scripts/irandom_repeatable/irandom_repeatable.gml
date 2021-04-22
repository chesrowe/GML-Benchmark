/// @func irandom_repeatable(endNumber, xPos, yPos, seed);
/// @desc Returns a point on a line
/// @param endNumber
/// @param xPos
/// @param yPos
/// @param seed
function irandom_repeatable(endNumber, xPos, yPos, seed) {

	var originalSeed = random_get_seed();
	
	random_set_seed(get_seed(xPos, yPos, seed));

	var randomNumber = irandom(endNumber);

	random_set_seed(originalSeed);
	return randomNumber;
}
