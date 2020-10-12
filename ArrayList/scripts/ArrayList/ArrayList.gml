/// @class                          ArrayList([array])
/// @param {*[]} [array]            Array to make the ArrayList from
/// @description                    List struct build on top of an array
function ArrayList() constructor {
    /// @member {*[]} array             Can be used with an accessor or as a reference, points to the same array for full lifecycle
    if (argument_count == 1) {
        array = argument[0];
    } else {
        array = [];
    }
    
    /// @function                       add(...value)
    /// @param {*} ...value             Value(s) to add to the ArrayList
    /// @description                    Adds a new value to the ArrayList, will be added at the end
    static add = function() {        
        for (var i = 0; i < argument_count; i++) {
            array_push(array, argument[i]);
        }
    }
    
    /// @function                       remove(pos, number)
    /// @param {real} pos               Position of value(s) to delete
    /// @param {real} number            Number of value(s) to delete
    /// @description                    Removes the value(s) at a specific position within the ArrayList
    static remove = function(pos, number) {
        array_delete(array, pos, number);
    }
    
    /// @function                       insert(pos, ...value)
    /// @param {real} pos               Position to add the value(s) from 0 to size-1
    /// @param {*} ...value             Value(s) to add to the list
    /// @description                    Adds the given value(s) into the list at the given position, values after will be shifted
    static insert = function(pos, value) {
        for (var i = 0; i < argument_count; i++) {
            array_insert(array, argument[i]);
        }
    }
    
    /// @function                       size()
    /// @return {real}
    /// @description                    Returns the number of items in the ArrayList
    static size = function() {
        return array_length(array);
    }
    
    /// @function                       find_index(value)
    /// @param {*} value                Value to find
    /// @return {real}                  Index of value found in ArrayList, -1 if value doesn't exist
    /// @description                    Checks the ArrayList for a value
    static find_index = function(value) {
        var length = array_length(array);
        
        for (var i = 0; i < length; i++) {
            if (array[i] == value) {
                return i;
            }
        }
        
        return -1;
    }
    
    /// @function                       clear()
    /// @description                    Clears all data from the ArrayList making array size to 0
    static clear = function() {
        array_resize(array, 0);
    }
    
    /// @function                       is_empty()
    /// @return {bool}
    /// @description                    Checks the ArrayList to see if it is empty
    static is_empty = function() {
        return (array_length(array) == 0);
    }
    
    /// @function                                           sort(ascending_or_comparator)
    /// @param {bool|function} ascending_or_comparator      Whether the values should be ascending (true) or descending (false) order or custom comparator function (see array_sort in manual for more info)
    /// @description                                        Modifies the ArrayList, sorting it ascending or descending order or using a custom function
    static sort = function(ascending_or_comparator) {
        array_sort(array, ascending_or_comparator);
    }
    
    /// @function                       swap(pos1, pos2)
    /// @param {real} pos1              Position of value to swap with the value of pos2
    /// @param {real} pos2              Position of value to swap with the value of pos1
    /// @description                    Swaps the values in pos1 and pos2
    static swap = function(pos1, pos2) {
        var temp = array[pos1];
        array[pos1] = array[pos2];
        array[pos2] = temp;
    }
    
    /// @function                       shuffle()
    /// @description                    Reorders all the values into random positions
    static shuffle = function() {
        var length = array_length(array);
        
        for (var i = length - 1; i > 0; i--) {
            swap(i, irandom(i));
        }
    }
    
    /// @function                       reverse()
    /// @description                    Reverses the order of the elements in the ArrayList
    static reverse = function() {
        var length = array_length(array);
        var hlength = length div 2;
        
        for (var left = 0; left < hlength; left++) {
            var right = length - 1 - left;
            swap(left, right);
        }
    }
    
    /// @function                       copy(source)
    /// @param {ArrayList} source       ArrayList to be copied from
    /// @description                    Shallow copy the content of one ArrayList into another
    static copy = function(source) {
        var length = array_length(source.array);
        
        clear();
        array_copy(array, 0, source.array, 0, length);
    }
    
    /// @function                       clone()
    /// @return {ArrayList}
    /// @description                    Returns a shallow copy of this ArrayList
    static clone = function() {
        var length = array_length(array);
        var list_clone = new ArrayList();
        
        array_copy(list_clone.array, 0, array, 0, length);
        
        return list_clone;
    }
}