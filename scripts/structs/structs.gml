function Vector2(_x, _y) constructor{
	x = _x;
	y = _y;
	
	function add(_other){
		x += _other.x;
		y += _other.y
	}
	
	function dotProduct(_other){
		return dot_product(x, y, _other.x, _other.y);	
	}
}

function Point(_x, _y) constructor{
	x = _x;
	y = _y;
	
	 function midpoint(_other){
		var midX = (x + _other.x) / 2;
		var midY = (y + _other.y) / 2;
		return new Point(midX, midY);
	}
	
	 function roundedMidpoint(_other){
		var midX = round((x + _other.x) / 2);
		var midY = round((y + _other.y) / 2);
		return new Point(midX, midY);
	}
}

function Biome(_name, _minHeight, _maxHeight, _scale, _lacunarity, _persistance) constructor{
	name = _name;
	minHeight = _minHeight;
	maxHeight = _maxHeight;
	scale = _scale;
	lacunarity = _lacunarity;
	persistance = _persistance;
	resources = [];
	enemies = [];
	flora = [];
	fauna = [];
	
	 function addResource(_resourse){
		resources[array_length(resources)] = _resourse;
	}
	
	 function addEnemy(_enemy){
		enemies[array_length(enemies)] = _enemy;
	}
	
	function addFlora(_flora){
		flora[array_length(flora)] = _flora;
	}
	
	function addFauna(_fauna){
		fauna[array_length(fauna)] = _fauna;
	}
	
	function getheightDelta(){
		return maxHeight - minHeight;
	}
}

function AspectRatio(_w, _h) constructor{
	w = _w;
	h = _h;
	
	function getAspectValue(){
		return (w/h);
	}
	
	function toString(){
		return string(w) + ":" + string(h)
	}
}



