
function array_find_number_of_dimensions(array){
	var test = array;
	var dims = 1;
	var arraySize = array_length(test); 
	
	for (i = 0; i < arraySize; i++){
		if (is_array(test[i])){
			dims ++;
			test = test[i];	
			arraySize = array_length(test);
			i = 0;
		}	
	}
	
	return dims;
}