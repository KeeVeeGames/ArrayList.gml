/// @class							ArrayList([array])
/// @param {*[]} [array]			Array to make the ArrayList from
/// @description					List struct build on top of an array
function ArrayList() constructor {
	/// @member {*[]} array				Can be used with an accessor or as a reference, points to the same array for full lifecycle
	if (argument_count == 1) {
		array = argument[0];
	} else {
		array = [];
	}
	
	/// @function						add(...value)
	/// @param {*} ...value				Value(s) to add to the ArrayList
	/// @description					Adds a new value to the ArrayList, will be added at the end
	static add = function() {
		var length = array_length(array);
		
		for (var i = 0; i < argument_count; i++) {
			array[length] = argument[i];
			length++;
		}
	}
	
	/// @function						remove(pos)
	/// @param {real} pos				Position of value to delete
	/// @description					Removes the value at a specific position within the ArrayList
	static remove = function(pos) {
		var length = array_length(array);
		var size = length - pos - 1;
		
		var temp = array_create(size);

		array_copy(temp, 0, array, pos + 1, size);		
		array_resize(array, length - 1);
		array_copy(array, pos, temp, 0, size);
	}
	
	/// @function						insert(pos, value)
	/// @param {real} pos				Position to add the value from 0 to size-1
	/// @param {*} value				Value to add to the list
	/// @description					Adds the given value into the list at the given position, values after will be shifted
	static insert = function(pos, value) {
		var length = array_length(array);
		
		array_copy(array, pos + 1, array, pos, length - pos);
		array[pos] = value;
	}
	
	/// @function						size()
	/// @return {real}
	/// @description					Returns the number of items in the ArrayList
	static size = function() {
		return array_length(array);
	}
	
	/// @function						find_index(value)
	/// @param {*} value				Value to find
	/// @return {real}					Index of value found in ArrayList, -1 if value doesn't exist
	/// @description					Checks the ArrayList for a value
	static find_index = function(value) {
		var length = array_length(array);
		
		for (var i = 0; i < length; i++) {
			if (array[i] == value) {
				return i;
			}
		}
		
		return -1;
	}
	
	/// @function						clear()
	/// @description					Clear all data from the ArrayList making array size to 0
	static clear = function() {
		array_resize(array, 0);
	}
	
	/// @function						is_empty()
	/// @return {bool}
	/// @description					Checks the ArrayList to see if it is empty
	static is_empty = function() {
		return (array_length(array) == 0);
	}
	
	/// @function						sort(ascending)
	/// @param {bool} ascending			Whether the values should be ascending (true) or descending (false) order
	/// @description					Modifies the ArrayList sorting it with the quicksort algorithm (strings sorted alphabetically)
	static sort = function(ascending) {
		array_sort(array, ascending);
	}
	
	/// @function						shuffle()
	/// @description					Reorder all the values into random positions
	static shuffle = function() {
		var length = array_length(array);
		
		for (var i = length - 1; i > 0; i--) {
			var j = irandom(i);
			var temp = array[i];
			array[i] = array[j];
			array[j] = temp;
		}
	}
	
	/// @function						copy(source)
	/// @param {ArrayList} source		ArrayList to be copied from
	/// @description					Copies the contents of one ArrayList into another
	static copy = function(source) {
		var length = array_length(source.array);
		
		clear();
		array_copy(array, 0, source.array, 0, length);
	}
	
	/// @function						clone()
	/// @return {ArrayList}
	/// @description					Returns a shallow copy of this ArrayList
	static clone = function() {
		var length = array_length(array);
		var list_clone = new gw_ArrayList();
		
		array_copy(list_clone.array, 0, array, 0, length);
		
		return list_clone;
	}
}