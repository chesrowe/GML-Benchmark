/// @func point_in_ellipse(pointX, pointY, centerX, centerY, radiusX, radiusY);
/// @desc checks a point is inside of an ellipse./
/// @param {real} pointX The x point to check.
/// @param {real} pointY The y point to check.
/// @param {real} centerX The x point of the ellipse.
/// @param {real} centerY The y point of the ellipse.
/// @param {real} radiusX The x radius of the ellipse.
/// @param {real} radiusY The y radius of the ellipse.
function point_in_ellipse() {
	var pointX = argument[0];
	var pointY = argument[1];
	var centerX = argument[2];
	var centerY = argument[3];
	var radiusX = argument[4];
	var radiusY = argument[5];

	var result = false;

	if (!((abs(pointX - centerX) > radiusX) || (abs(pointY - centerY) > radiusY))){
		var xEquation = (power((pointX - centerX), 2)) / (power(radiusX, 2));
		var yEquation = (power((pointY - centerY), 2)) / (power(radiusY, 2));

		//show_debug_message("X Equation:" + string(xEquation) + ", Y Equation:" + string(yEquation));

		result = ((xEquation + yEquation) <= 1)
	}
	//show_debug_message(result)
	return result;
}

/// @func norm(min, max, value)
/// @param {real} min
/// @param {real} max
/// @param {real} value
/// @desc Returns a normalized value for the given min and max based on the value given

function norm(min, max, value){
    return (value - min) / (max - min);
}
