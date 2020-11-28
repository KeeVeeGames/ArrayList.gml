/// @class                          ArrayList([array])
/// @param {*[]} [array]            Array to make the ArrayList from
/// @description                    List struct build on top of an array
function ArrayList() constructor {
    /// @hint :array
    /// @member {*[]} array             Can be used with an accessor or as a reference, points to the same array for full lifecycle
    if (argument_count == 1) {
        array = argument[0];
    } else {
        array = [];
    }
    
    /// @function                       get(pos)
    /// @param {real} pos               Position to look at from 0 to size-1
    /// @return {*}                     Value found on position
    /// @description                    Returns the value at the specified position in the ArrayList
    static get = function(pos) {
        return array[pos];
    }
    
    /// @function                       set(pos, value)
    /// @param {real} pos               Position to set the value
    /// @param {*} value                Value to set
    /// @description                    Replaces the value at the specified position in the ArrayList with other value
    static set = function(pos, value) {
        array[pos] = value;
        
        return self;                    // For method chaining
    }
    
    /// @function                       add(...value)
    /// @param {*} ...value             Value(s) to add to the ArrayList
    /// @description                    Adds a new value to the ArrayList, will be added at the end
    static add = function() {        
        for (var i = 0; i < argument_count; i++) {
            array_push(array, argument[i]);
        }
        
        return self;                    // For method chaining
    }
    
    /// @function                                   add_from(source_arraylist)
    /// @param {ArrayList} source_arraylist         ArrayList to be added from
    /// @description                                Adds the value(s) from another ArrayList at the end
    static add_from = function(source) {
        var length = array_length(source.array);
        
        for (var i = 0; i < length; i++) {
            array_push(array, source.array[i]);
        }
        
        return self;                                // For method chaining                    
    }
    
    /// @function                                   add_from_range(source_arraylist, source_pos, number)
    /// @param {ArrayList} source_arraylist         ArrayList to be inserted from
    /// @param {real} source_pos                    Position within the ArrayList to start adding from
    /// @param {real} number                        Number of values to add
    /// @description                                Adds the range of another ArrayList at the end
    static add_from_range = function(source, source_pos, number) {        
        for (var i = source_pos; i < source_pos + number; i++) {
            array_push(array, source.array[i]);
        }
        
        return self;                                // For method chaining
    }
    
    /// @function                               add_array(source_array)
    /// @param {*[]} source_array               Array to be added from
    /// @description                            Adds the value(s) from array into the ArrayList at the end
    static add_array = function(source, pos) {
        var length = array_length(source);
        
        for (var i = 0; i < length; i++) {
            array_push(array, source[i]);
        }
        
        return self;                            // For method chaining
    }
    
    /// @function                               add_array_range(source_array, source_pos, number)
    /// @param {*[]} source_array               Array to be added from
    /// @param {real} source_pos                Position within the array to start adding from
    /// @param {real} number                    Number of values to insert
    /// @param {real} pos                       Position to add the value(s) from 0 to size-1
    /// @description                            Adds the range of array into the ArrayList at the end
    static add_array_range = function(source, source_pos, number) {     
        for (var i = source_pos; i < source_pos + number; i++) {
            array_push(array, source[i]);
        }
        
        return self;                            // For method chaining
    }
    
    /// @function                       remove_at(pos)
    /// @param {real} pos               Position of value to delete
    /// @description                    Removes the value at a specific position within the ArrayList
    static remove_at = function(pos) {
        array_delete(array, pos, 1);
        
        return self;                    // For method chaining
    }
    
    /// @function                       remove_range(pos, number)
    /// @param {real} pos               Position of value(s) to delete
    /// @param {real} number            Number of value(s) to delete
    /// @description                    Removes the value(s) at a specific position within the ArrayList
    static remove_range = function(pos, number) {
        array_delete(array, pos, number);
        
        return self;                    // For method chaining
    }
    
    /// @function                       insert(pos, ...value)
    /// @param {real} pos               Position to add the value(s) from 0 to size-1
    /// @param {*} ...value             Value(s) to add to the ArrayList
    /// @description                    Adds the given value(s) into the ArrayList at the given position, values after will be shifted
    static insert = function(pos, value) {
        for (var i = 0; i < argument_count; i++) {
            array_insert(array, pos, argument[i]);
        }
        
        return self;                    // For method chaining
    }
    
    /// @function                                   insert_from(source_arraylist, pos)
    /// @param {ArrayList} source_arraylist         ArrayList to be inserted from
    /// @param {real} pos                           Position to add the value(s) from 0 to size-1
    /// @description                                Adds the value(s) from another ArrayList at the given position, values after will be shifted
    static insert_from = function(source, pos) {
        var length = array_length(source.array);
        
        for (var i = 0; i < length; i++) {
            array_insert(array, pos, source.array[i]);
        }
        
        return self;                                // For method chaining
    }
    
    /// @function                                   insert_from_range(source_arraylist, source_pos, number, pos)
    /// @param {ArrayList} source_arraylist         ArrayList to be inserted from
    /// @param {real} source_pos                    Position within the ArrayList to start inserting from
    /// @param {real} number                        Number of values to insert
    /// @param {real} pos                           Position to add the value(s) from 0 to size-1
    /// @description                                Adds the range of another ArrayList at the given position, values after will be shifted
    static insert_from_range = function(source, source_pos, number, pos) {        
        for (var i = source_pos; i < source_pos + number; i++) {
            array_insert(array, pos, source.array[i]);
        }
        
        return self;                                // For method chaining
    }
    
    /// @function                           insert_array(source_array, pos)
    /// @param {*[]} source_array           Array to be inserted from
    /// @param {real} pos                   Position to add the value(s) from 0 to size-1
    /// @description                        Adds the value(s) from array into the ArrayList at the given position, values after will be shifted
    static insert_array = function(source, pos) {
        var length = array_length(source);
        
        for (var i = 0; i < length; i++) {
            array_insert(array, pos, source[i]);
        }
        
        return self;                        // For method chaining
    }
    
    /// @function                           insert_array_range(source_array, source_pos, number, pos)
    /// @param {*[]} source_array           Array to be inserted from
    /// @param {real} source_pos            Position within the array to start inserting from
    /// @param {real} number                Number of values to insert
    /// @param {real} pos                   Position to add the value(s) from 0 to size-1
    /// @description                        Adds the range of array into the ArrayList at the given position, values after will be shifted
    static insert_array_range = function(source, source_pos, number, pos) {     
        for (var i = source_pos; i < source_pos + number; i++) {
            array_insert(array, pos, source[i]);
        }
        
        return self;                        // For method chaining
    }
    
    /// @function                       index_of(value)
    /// @param {*} value                Value to find
    /// @return {real}                  Index of the first value found in the ArrayList, -1 if value doesn't exist
    /// @description                    Checks the ArrayList for the first occurrence of the value
    static index_of = function(value) {
        var length = array_length(array);
        
        for (var i = 0; i < length; i++) {
            if (array[i] == value) {
                return i;
            }
        }
        
        return -1;
    }
    
    /// @function                       last_index_of(value)
    /// @param {*} value                Value to find
    /// @return {real}                  Index of the last value found in the ArrayList, -1 if value doesn't exist
    /// @description                    Checks the ArrayList for the last occurrence of the value
    static last_index_of = function(value) {
        var length = array_length(array);
        
        for (var i = length - 1; i >= 0; i--) {
            if (array[i] == value) {
                return i;
            }
        }
        
        return -1;
    }
    
    /// @function                       contains(value)
    /// @param {*} value                Value to check
    /// @return {bool}
    /// @description                    Returns true if the ArrayList contains the specified element
    static contains = function(value) {
        var length = array_length(array);
        
        for (var i = 0; i < length; i++) {
            if (array[i] == value) {
                return true;
            }
        }
        
        return false;
    }
    
    /// @function                                   contains_from(source_arraylist)
    /// @param {ArrayList} source_arraylist         ArrayList to check values from
    /// @return {bool}
    /// @description                                Returns true if the ArrayList contains all of the elements of other ArrayList
    static contains_from = function(source) {
        var length = array_length(array);
        var source_array = source.array;
        var source_length = array_length(source_array);
        
        for (var i = 0; i < length; i++) {
            for (var j = 0; j < source_length; j++) {
                if (array[i] != source_array[j]) {
                    return false;
                }
            }
        }
        
        return true;
    }
    
    /// @function                                   contains_from_range(source_arraylist, source_pos, number)
    /// @param {ArrayList} source_arraylist         ArrayList to check values from
    /// @param {real} source_pos                    Position within the ArrayList to start checking from
    /// @param {real} number                        Number of values to check
    /// @return {bool}
    /// @description                                Returns true if the ArrayList contains the range of other ArrayList
    static contains_from_range = function(source, source_pos, number) {
        var length = array_length(array);
        var source_array = source.array;
        
        for (var i = 0; i < length; i++) {
            for (var j = source_pos; j < source_pos + number; j++) {
                if (array[i] != source_array[j]) {
                    return false;
                }
            }
        }
        
        return true;
    }
    
    /// @function                           contains_array(source_array)
    /// @param {*[]} source_array           Array to check values from
    /// @return {bool}
    /// @description                        Returns true if the ArrayList contains all of the elements of the specified array
    static contains_array = function(source) {
        var length = array_length(array);
        var source_length = array_length(source);
        
        for (var i = 0; i < length; i++) {
            for (var j = 0; j < source_length; j++) {
                if (array[i] != source_array[j]) {
                    return false;
                }
            }
        }
        
        return true;
    }
    
    /// @function                           contains_array_range(source_array, source_pos, number)
    /// @param {*[]} source_array           Array to check values from
    /// @param {real} source_pos            Position within the array to start checking from
    /// @param {real} number                Number of values to check
    /// @return {bool}
    /// @description                        Returns true if the ArrayList contains the range of the specified array
    static contains_array_range = function(source, source_pos, number) {
        var length = array_length(array);
        
        for (var i = 0; i < length; i++) {
            for (var j = source_pos; j < source_pos + number; j++) {
                if (array[i] != source[j]) {
                    return false;
                }
            }
        }
        
        return true;
    }
    
    /// @function                           find(predicate)
    /// @param {function} predicate         One-argument function that should return true if the argument value meets some conditions
    /// @return {*}                         First occurrence within the ArrayList
    /// @description                        Searches for the first element that matches the conditions defined by the specified predicate function
    static find = function(predicate) {
        var length = array_length(array);
        
        for (var i = 0; i < length; i++) {
            var value = array[i];
            
            if (predicate(value)) {
                return value;
            }
        }
    }
    
    /// @function                           find_last(predicate)
    /// @param {function} predicate         One-argument function that should return true if the argument value meets some conditions
    /// @return {*}                         Last occurrence within the ArrayList
    /// @description                        Searches for the last element that matches the conditions defined by the specified predicate function
    static find_last = function(predicate) {
        var length = array_length(array);
        
        for (var i = length - 1; i >= 0; i--) {
            var value = array[i];
            
            if (predicate(value)) {
                return value;
            }
        }
    }
    
    /// @function                           find_all(predicate)
    /// @param {function} predicate         One-argument function that should return true if the argument value meets some conditions
    /// @return {ArrayList}                 New ArrayList with all elements that match the conditions
    /// @description                        Searches for all elements that match the conditions defined by the specified predicate function
    static find_all  = function(predicate) {
        var result = new ArrayList();
        var length = array_length(array);
        
        for (var i = 0; i < length; i++) {
            var value = array[i];
            
            if (predicate(value)) {
                result.add(value);
            }
        }
        
        return result;
    }
    
    /// @function                           find_index(predicate)
    /// @param {function} predicate         One-argument function that should return true if the argument value meets some conditions
    /// @return {*}                         Indef of the first occurrence within the ArrayList
    /// @description                        Searches for the first element that matches the conditions defined by the specified predicate function
    static find_index  = function(predicate) {
        var length = array_length(array);
        
        for (var i = 0; i < length; i++) {
            var value = array[i];
            
            if (predicate(value)) {
                return i;
            }
        }
    }
    
    /// @function                           find_last_index(predicate)
    /// @param {function} predicate         One-argument function that should return true if the argument value meets some conditions
    /// @return {*}                         Index of the last occurrence within the ArrayList
    /// @description                        Searches for the last element that matches the conditions defined by the specified predicate function
    static find_last_index = function(predicate) {
        var length = array_length(array);
        
        for (var i = length - 1; i >= 0; i--) {
            var value = array[i];
            
            if (predicate(value)) {
                return i;
            }
        }
    }
    
    /// @function                           remove(predicate)
    /// @param {function} predicate         One-argument function that should return true if the argument value meets some conditions
    /// @description                        Removes the first occurrence of the element that matches the conditions defined by the specified predicate function
    static remove = function(predicate) {
        var length = array_length(array);
        
        for (var i = 0; i < length; i++) {
            var value = array[i];
            
            if (predicate(value)) {
                array_delete(array, i, 1);
                exit;
            }
        }
        
        return self;                        // For method chaining
    }
    
    /// @function                           remove_last(predicate)
    /// @param {function} predicate         One-argument function that should return true if the argument value meets some conditions
    /// @description                        Removes the last occurrence of the element that matches the conditions defined by the specified predicate function
    static remove_last = function(predicate) {
        var length = array_length(array);
        
        for (var i = length - 1; i >= 0; i--) {
            var value = array[i];
            
            if (predicate(value)) {
                array_delete(array, i, 1);
                exit;
            }
        }
        
        return self;                        // For method chaining
    }
    
    /// @function                           remove_all(predicate)
    /// @param {function} predicate         One-argument function that should return true if the argument value meets some conditions
    /// @description                        Removes all elements that match the conditions defined by the specified predicate function
    static remove_all = function(predicate) {
        var length = array_length(array);
        
        for (var i = 0; i < length; i++) {
            var value = array[i];
            
            if (predicate(value)) {
                array_delete(array, i, 1);
            }
        }
        
        return self;                        // For method chaining
    }
    
    /// @function                       foreach(func)
    /// @param {function} func          Function to call on the each element
    /// @description                    Calls a function on the each ArrayList element
    static foreach = function(func) {
        var length = array_length(array);
        
        for (var i = 0; i < length; i++) {
            func(array);
        }
        
        return self;                    // For method chaining
    }
    
    /// @function                       iterator()
    /// @return {Iterator}              See {@link https://github.com/KeeVeeGames/Iterator.gml}
    /// @description                    Returns an iterator over the elements in the ArrayList
    static iterator = function() {
        return new Iterator(array);
    }
    
    /// @function                       size()
    /// @return {real}
    /// @description                    Returns the number of items in the ArrayList
    static size = function() {
        return array_length(array);
    }
    
    /// @function                       resize(new_size)
    /// @param {real} new_size          New size (can be 0)
    /// @description                    Resizes the ArrayList
    static resize = function(new_size) {
        array_resize(array, new_size);
        
        return self;                    // For method chaining
    }
    
    /// @function                       clear()
    /// @description                    Clears all data from the ArrayList making array size to 0
    static clear = function() {
        array_resize(array, 0);
        
        return self;                    // For method chaining
    }
    
    /// @function                       is_empty()
    /// @return {bool}
    /// @description                    Checks the ArrayList to see if it is empty
    static is_empty = function() {
        return (array_length(array) == 0);
    }
    
    /// @function                                               sort(ascending_or_comparator)
    /// @param {bool|function} ascending_or_comparator          Whether the values should be ascending (true) or descending (false) order or custom comparator function (see array_sort in manual for more info)
    /// @description                                            Modifies the ArrayList, sorting it ascending or descending order or using a custom function
    static sort = function(ascending_or_comparator) {
        array_sort(array, ascending_or_comparator);
        
        return self;                    // For method chaining
    }
    
    /// @function                       swap(pos1, pos2)
    /// @param {real} pos1              Position of value to swap with the value of pos2
    /// @param {real} pos2              Position of value to swap with the value of pos1
    /// @description                    Swaps the values in pos1 and pos2
    static swap = function(pos1, pos2) {
        var temp = array[pos1];
        array[pos1] = array[pos2];
        array[pos2] = temp;
        
        return self;                    // For method chaining
    }
    
    /// @function                       shuffle()
    /// @description                    Reorders all the values into random positions
    static shuffle = function() {
        var length = array_length(array);
        
        for (var i = length - 1; i > 0; i--) {
            swap(i, irandom(i));
        }
        
        return self;                    // For method chaining
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
        
        return self;                    // For method chaining
    }
    
    /// @function                                   copy(source_arraylist)
    /// @param {ArrayList} source_arraylist         ArrayList to be copied from
    /// @description                                Copies (shallow) the content of one ArrayList into another (clears the destination ArrayList)
    static copy = function(source) {
        var length = array_length(source.array);
        
        clear();
        array_copy(array, 0, source.array, 0, length);
        
        return self;                                // For method chaining
    }
    
    /// @function                                   copy_range(source_arraylist, source_pos, number, pos)
    /// @param {ArrayList} source_arraylist         ArrayList to be copied from
    /// @param {real} source_pos                    Position within the ArrayList to start copying from
    /// @param {real} number                        Number of values to copy
    /// @param {real} pos                           Position within the ArrayList to copy to
    /// @description                                Copies (shallow) the range of one ArrayList into another (without clearing)
    static copy_range = function(source, source_pos, number, pos) {        
        array_copy(array, pos, source.array, source_pos, number);
        
        return self;                                // For method chaining
    }
    
    /// @function                           copy_array(source_array)
    /// @param {*[]} source_array           Array to be copied from
    /// @description                        Copies (shallow) the content of array into the ArrayList (clears the destination ArrayList)
    static copy_array = function(source) {
        var length = array_length(source);
        
        clear();
        array_copy(array, 0, source, 0, length);
        
        return self;                        // For method chaining
    }
    
    /// @function                           copy_array_range(source_array, source_pos, number, pos)
    /// @param {*[]} source_array           Array to be copied from
    /// @param {real} source_pos            Position within the array to start copying from
    /// @param {real} number                Number of values to copy
    /// @param {real} pos                   Position within the ArrayList to copy to
    /// @description                        Copies (shallow) the range of array into the ArrayList (without clearing)
    static copy_array_range = function(source, source_pos, number, pos) {        
        array_copy(array, pos, source, source_pos, number);
        
        return self;                        // For method chaining
    }
    
    /// @function                       clone()
    /// @return {ArrayList}
    /// @description                    Returns a shallow copy of the ArrayList
    static clone = function() {
        var length = array_length(array);
        var list_clone = new ArrayList();
        
        array_copy(list_clone.array, 0, array, 0, length);
        
        return list_clone;
    }
    
    /// @function                       clone_range(pos, number)
    /// @param {real} pos               Position of value(s) to clone
    /// @param {real} number            Number of value(s) to clone
    /// @return {ArrayList}
    /// @description                    Returns a rangeial shallow copy of the ArrayList
    static clone_range = function(pos, number) {
        var list_clone = new ArrayList();
        
        array_copy(list_clone.array, 0, array, pos, number);
        
        return list_clone;
    }
    
    /// @function                       to_array()
    /// @return {*[]}
    /// @description                    Creates a new array containing all values from the ArrayList
    static to_array = function() {
        var length = array_length(array);
        var array_clone = array_create(length);
        
        array_copy(array_clone, 0, array, 0, length);
        
        return array_clone;
    }
    
    /// @function                       to_array_range(pos, number)
    /// @param {real} pos               Position of value(s) to copy
    /// @param {real} number            Number of value(s) to copy
    /// @return {*[]}
    /// @description                    Creates a new array containing some values from the ArrayList
    static to_array_range = function(pos, number) {
        var array_clone = array_create(number);
        
        array_copy(array_clone, 0, array, pos, number);
        
        return array_clone;
    }    
    /// @function                       to_ds_list()
    /// @return {ds_list}
    /// @description                    Creates a new ds_list containing all values from the ArrayList
    static to_array = function() {
        var length = array_length(array);
        var list_clone = ds_list_create();
        
        for (var i = 0; i < length; i++) {
            ds_list_add(list_clone, array[i]);
        }
        
        return list_clone;
    }
    
    /// @function                       to_ds_list_range(pos, number)
    /// @param {real} pos               Position of value(s) to copy
    /// @param {real} number            Number of value(s) to copy
    /// @return {*[]}
    /// @description                    Creates a new ds_list containing some values from the ArrayList
    static to_ds_list_range = function(pos, number) {
        var list_clone = ds_list_create();
        
        for (var i = pos; i < pos + number; i++) {
            ds_list_add(list_clone, array[i]);
        }
        
        return list_clone;
    }
    
    /// @function                           equals(array_list)
    /// @param {ArrayList} array_list       ArrayList to check with
    /// @return {bool}
    /// @description                        Checks if two ArrayLists are equal (has the same values)
    static equals = function(array_list) {
        return array_equals(array, array_list.array);
    }
    
    static toString = function() {
        return "ArrayList: " + string(array);
    }
}