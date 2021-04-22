/// @func normalize(min, max, value)
/// @param {real} min
/// @param {real} max
/// @param {real} value
/// @desc Returns a normalized value for the given min and max based on the value given

function normalize(min, max, value){
	return (value - min) / (max - min);
}

/// @func quad_bezier(startX, startY, midX, midY, endX, endY, stepAmount)
/// @desc Creates a quad_bezier curve by returning a struct with an array populated by the points of the curve..
///		  struc.points[]
/// @param {real} startX 
/// @param {real} startY
/// @param {real} midX
/// @param {real} midY
/// @param {real} endX
/// @param {real} endY

function quad_bezier(_startX, _startY, _midX, _midY, _endX, _endY, _stepAmount) constructor{
	startX = _startX;
	startY = _startY;
	midX = _midX;
	midY = _midY;
	endX = _endX;
	endY = _endY;
	stepAmount = _stepAmount;
	currentStep = 0;
	
	static point = function() constructor{
		x = 0;
		y = 0;
	}
	
	static calculate_points = function(){
		var pointArray = array_create(stepAmount);
		var t;
		
		for (var i = 0; i < stepAmount; i++){
			t = currentStep / stepAmount;
			var curvePoint = new point();
			curvePoint.x = (sqr(1 - t) * startX + 2 * (1 - t) * t * midX + sqr(t) * endX); 
			curvePoint.y = (sqr(1 - t) * startY + 2 * (1 - t) * t * midY + sqr(t) * endY); 
			pointArray[i] = curvePoint;
			
			currentStep ++;
		}
		
		return pointArray;
	}
	
	points = calculate_points();
}
