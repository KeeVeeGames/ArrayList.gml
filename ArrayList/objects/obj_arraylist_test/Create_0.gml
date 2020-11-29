
ArrayList_Tests = function() constructor {
    static run = function() {
        var names = variable_struct_get_names(self);
        var length = variable_struct_names_count(self);
        
        for (var i = 0; i < length; i++) {
            var test = variable_struct_get(self, names[i]);
            test();
        }
    }
    
    static assert = function(value, expected, name) {
        if (value == expected) {
            show_debug_message("Test " + name + " complete!");
        } else {
            show_debug_message("Test " + name + " failed! Value: " + string(value) + ", expected: " + string(expected));
        }
    }
    
    static assert_array = function(value, expected, name) {
        if (array_equals(value, expected)) {
            show_debug_message("Test " + name + " complete!");
        } else {
            show_debug_message("Test " + name + " failed! Value: " + string(value) + ", expected: " + string(expected));
        }
    }
    
    static assert_func = function(value, expected, comparator, name) {
        if (comparator(value, expected)) {
            show_debug_message("Test " + name + " complete!");
        } else {
            show_debug_message("Test " + name + " failed! Value: " + string(value) + ", expected: " + string(expected));
        }
    }
}

var tests = new ArrayList_Tests();

with (tests) {
    constructor_test = function() {
        var list/*:ArrayList*/ = new ArrayList();
        
        assert_array(list.array, [], "constructor");
    }
    
    get_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        
        assert(list.get(2), 30, "get");
    }
    
    set_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.set(2, "woop!");
        
        assert_array(list.array, [10, 20, "woop!", 40, 50], "set");
    }
    
    add_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.add(60, 70, 80);
        
        assert_array(list.array, [10, 20, 30, 40, 50, 60, 70, 80], "add");
    }
    
    add_from_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([1, 2, 3, 4, 5]);
        var list2/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list1.add_from(list2);
        
        assert_array(list1.array, [1, 2, 3, 4, 5, 10, 20, 30, 40, 50], "add_from");
    }
    
    add_from_range_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([1, 2, 3, 4, 5]);
        var list2/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list1.add_from_range(list2, 1, 3);
        
        assert_array(list1.array, [1, 2, 3, 4, 5, 20, 30, 40], "add_from_range");
    }
    
    add_array_test = function() {
        var list/*:ArrayList*/ = new ArrayList([1, 2, 3, 4, 5]);
        var array = [10, 20, 30, 40, 50];
        list.add_array(array);
        
        assert_array(list.array, [1, 2, 3, 4, 5, 10, 20, 30, 40, 50], "add_array");
    }
    
    add_array_range_test = function() {
        var list/*:ArrayList*/ = new ArrayList([1, 2, 3, 4, 5]);
        var array = [10, 20, 30, 40, 50];
        list.add_array_range(array, 1, 3);
        
        assert_array(list.array, [1, 2, 3, 4, 5, 20, 30, 40], "add_array_range");
    }
    
    remove_test
    remove_last_test
    remove_all_test
    remove_at_test
    remove_range_test
    insert_test
    insert_from_test
    insert_from_range_test
    insert_array_test
    insert_array_range_test
    index_of_test
    last_index_of_test
    contains_test
    contains_from(source_arraylist)->bool
    contains_from_range(source_arraylist, source_pos, number)->bool
    contains_array(source_array)->bool
    contains_array_range(source_array, source_pos, number)->bool
    find(predicate)->?any
    find_last(predicate)->?any
    find_all(predicate)->ArrayList
    find_index(predicate)->real
    find_last_index(predicate)->real
    remove_where(predicate)
    remove_where_last(predicate)
    remove_where_all(predicate)
    foreach(func)
    iterator()->Iterator
    size()->real
    clear()
    is_empty()->bool
    sort(ascending_or_comparator)
    swap(pos1, pos2)
    shuffle()
    reverse()
    copy(source_arraylist)
    copy_range(source_arraylist, source_pos, number, pos)
    copy_array(source_array)
    copy_array_range(source_array, source_pos, number, pos)
    copy_ds_list(source_ds_list)
    copy_ds_list_range(source_ds_list, source_pos, number, pos)
    clone()->ArrayList
    clone_range(pos, number)->ArrayList
    to_array()->any[]
    to_array_range(pos, number)->any[]
    to_ds_list()->ds_list
    to_ds_list_range(pos, number)->ds_list
    equals(array_list)->bool
}

tests.run();