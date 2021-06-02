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

#region Test Methods

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

testArray = [];

arrayWriteTest = function(){
	testArray[0] = irandom(0xFFFF);	
}

testBuffer = buffer_create(0xFFFF, buffer_fast, 1);

bufferWriteTest = function(){
	buffer_write(testBuffer, buffer_u8, irandom(0xFF));	
}

testGrid = ds_grid_create(0xFFF, 0xFFF);

dsGridTest = function(){
	var width = ds_grid_width(testGrid);
	var height = ds_grid_height(testGrid);
	
	for (i = 0; i < width; i++){
		testGrid[# i, irandom(height - 1)] = irandom(0xFFFF);	
	}
}

testArray = array_create(0xFFF);

for (i = 0; i < array_length(testArray); i++){
	testArray[i] = array_create(0xFFF);	
}

twoDArrayTest = function(){
	var width = array_length(testArray);

	for (i = 0; i < width; i++){
		testArray[i][irandom(width - 1)] = irandom(0xFFFF);	
	}
}

bitSum = function(val1, val2){	
	var _x = val1;
	var _y = val2;
	
	var _carry = _x & _y;
	_x = _x ^ _y;
	_y = _carry << 1;
	
	if (_y == 0){
		return _x;
	}else{
		return bitSum(_x, _y);	
	}
}

bitSumMethod = function(){
	var _val = bitSum(5, 5);		
}

regularSum = function(){
	var _val =  5 + 5;	
}


valueSwapNoTempVar = function(){
	var _val1 = 10;
	var _val2 = 5;
	
	_val1 = _val1 ^ _val2;
	_val2 = _val1 ^ _val2;
	_val1 = _val1 ^ _val2;
}

valueSwapWithTempVar = function(){
	var _val1 = 10;
	var _val2 = 5;
	var _temp = 0;
	
	_temp = _val1;
	_val1 = _val2;
	_val2 = _temp;
}

var _value = 0xF;
var _isBitSet = (_value & (0x1 << 1)) != 0;
var _setBit = (_value | (0x1 << 4));
var _clearBit = (_value & ~(0x1 << 1));

checkBit = function(value, bitNum){
	return (value & (1 << (bitNum))) != 0;		
}

setBit = function(value, bitNum){
	return (value | (1 << (bitNum)));
}

clearBit = function(value, bitNum){
	return (value & ~(1 << (bitNum)));	
}

toggleBit = function(value, bitNum){
	return (value ^ (1 << (bitNum)));
}

minOfValues = function(val1, val2){
	return val1 ^ ((val2 ^ val1) & -(val1 < val2));	
}

minOfValuesMethod = function(){
	var _val1 = 5;
	var _val2 = 10;
	var _min = minOfValues(_val1, _val2);	
}

minRegular = function(){
	var _val1 = 5;
	var _val2 = 10;
	var _min = 	_val1 < _val2 ? _val1 : _val2;	
}

#endregion

//----------------------------------------------//
//--Put the two methods to compare here!!!------//
//----------------------------------------------//
	methodToCalculate[0] = minOfValuesMethod;     
	methodToCalculate[1] = minRegular;    
//----------------------------------------------//

#region Drawing methods

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

#endregion







