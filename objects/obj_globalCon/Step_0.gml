if (currentFrame < framesOfIteration){
	calculateResult(iterationsPerCalculation);
	currentFrame ++;
}else{
	var resultTotal = 0;
	
	var resultArraySize = array_length(resultArray[currentMethod]);
	var _totalAverages = 0;
	
	for (i = 0; i < resultArraySize; i++){	
		var _valueAtIndex = resultArray[currentMethod][i]
		if (_valueAtIndex != -1){
			resultTotal += _valueAtIndex;	
			_totalAverages ++;
		}
	}
	
	buffer_write(averageResultBuffer[currentMethod], buffer_f16, resultTotal / _totalAverages);
	
	holderOfValues = irandom(0xFF);
	startCalculations = false;
	currentFrame = 0;
	currentMethod = !currentMethod;
}