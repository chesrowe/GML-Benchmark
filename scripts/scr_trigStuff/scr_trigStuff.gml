/// @func get_angle(aX, aY, bX, bY, cX, cY)
/// @desc finds the angle between 3 points, where point b is the orgin
/// @param {real} aX
/// @param {real} aY
/// @param {real} bX
/// @param {real} bY
/// @param {real} cX
/// @param {real} cY

function get_angle(aX, aY, bX, bY, cX, cY){
	var angle = arctan2(cY - bY, cX - bX) - arctan2(aY - bY, aX - bX);
	angle = angle * (180 / pi);
	
	return (angle < 0) ? angle + 360 : angle;
}

