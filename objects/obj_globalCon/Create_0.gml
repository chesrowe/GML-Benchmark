window_set_rectangle(~~(display_get_width() / 4), ~~(display_get_height() / 4), ~~(display_get_width() / 2), ~~(display_get_height() / 2)); 

random_set_seed(1);
print = show_message;

averageResultBuffer[0] = buffer_create(200, buffer_wrap, 2);
averageResultBuffer[1] = buffer_create(200, buffer_wrap, 2);
resultArray = array_create(2, -1);
resultArray[0] = array_create(100, -1);
resultArray[1] = array_create(100, -1);
currentResult[0] = 0;
currentResult[1] = 0;
holderOfValues = 5.6;
iterationsPerCalculation = 0xFFFF;
framesOfIteration = 64;
currentFrame = 0;
startCalculations = false;
currentMethod = 0;

calculateResult = function(_iterations){
	var startTime = current_time;

	repeat(_iterations){
		methodToCalculate[currentMethod]();
	}

	var endTime = current_time;
	
	resultArray[currentMethod][currentResult[currentMethod]] = endTime - startTime;
	currentResult[currentMethod] ++;
}

powerOfTwo = function(){
	holderOfValues = power(holderOfValues, 2); 
}

bitShiftLeft = function(){
	holderOfValues = holderOfValues << 1;	
}

testBool = false;
testBool2 = true;
testBool3 = false;
testBool4 = false;
testBool5 = true;
testBool6 = false;
testBool7 = false;
testBool8 = true;
testBool9 = false;
testBool10 = true;

boolSet = function(){
	testBool = false;
	testBool2 = true;
	testBool3 = false;
	testBool4 = false;
	testBool5 = true;
}

bitSetInsteadOfBool = function(){
	testBool = testBool | 0x1F;	 
}

floorTest = function(){
	holderOfValues = floor(holderOfValues);	
}

doubleNotFloor = function(){
	holderOfValues = ~~holderOfValues;	
}

roundTest = function(){
	holderOfValues = round(holderOfValues);	
}

truncRoundTest = function(){
	holderOfValues = ~~(holderOfValues + 0.5);	
}

////////////////////////////////////////////|
////Put the two methods to compare here!!!//|
////////////////////////////////////////////|
methodToCalculate[0] = roundTest;         //|
methodToCalculate[1] = truncRoundTest;    //|
////////////////////////////////////////////|

findAverageOfAverages = function(_method){
	var _numberOfValues = buffer_get_size(averageResultBuffer[_method]) / 2;	
	
	var _averageTotal = 0;
	var _numberOfAveragesinBuffer = 0;
	
	repeat(_numberOfValues){
		var _average = buffer_read(averageResultBuffer[_method], buffer_f16);
		
		if (_average != 0){
			_averageTotal += _average;
			_numberOfAveragesinBuffer ++;
		}
	}
	
	return _averageTotal / _numberOfAveragesinBuffer;
}

findAverage = function(_method){
	var _numberOfValues = buffer_get_size(averageResultBuffer[_method]) / 2;		
}

drawResults = function(_x, _y, _method){
	var _yOrg = _y;
	var _numberOfValues = buffer_get_size(averageResultBuffer[_method]) / 2;
	_y += 24;
	
	repeat(_numberOfValues){
		var _average = buffer_read(averageResultBuffer[_method], buffer_f16);
		
		if (_average != 0){
			draw_text(_x, _y, "Average time taken: " + string(_average) + "ms");
			_y += 12;
		}
	}
	
	var _averageOfAverages = findAverageOfAverages(_method);
	var _otherMethodAverageOfAverages = findAverageOfAverages(!_method);
	
	draw_text(_x + 190, _yOrg, "Average of averages: " + string(_averageOfAverages) + "ms");	
	
	if (_averageOfAverages < _otherMethodAverageOfAverages){
		var percentDifference = 100 - ((_averageOfAverages / _otherMethodAverageOfAverages) * 100);	
		draw_text(_x + 450, _yOrg, string(percentDifference) + "% " + " faster");
	}
}







