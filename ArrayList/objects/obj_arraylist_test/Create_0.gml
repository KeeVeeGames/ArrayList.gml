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
        if (value == expected) _complete(name); else _failed(value, expected, name);
    }
    
    static assert_array = function(value, expected, name) {
        if (array_equals(value, expected)) _complete(name); else _failed(value, expected, name);
    }
    
    static assert_func = function(value, expected, comparator, name) {
        if (comparator(value, expected)) _complete(name); else _failed(value, expected, name);
    }
    
    static _complete = function(name) {
        show_debug_message("Test " + name + " complete!");
    }
    
    static _failed = function(value, expected, name) {
        show_debug_message("Test " + name + " failed! Value: " + string(value) + ", expected: " + string(expected));
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
    
    remove_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 30, 20, 30, 40, 30, 50]);
        list.remove(30);
        
        assert_array(list.array, [10, 20, 30, 40, 30, 50], "remove");
    }
    
    remove_last_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 30, 20, 30, 40, 30, 50]);
        list.remove_last(30);
        
        assert_array(list.array, [10, 30, 20, 30, 40, 50], "remove_last");
    }
    
    remove_all_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 30, 20, 30, 40, 30, 50]);
        list.remove_all(30);
        
        assert_array(list.array, [10, 20, 40, 50], "remove_all");
    }
    
    remove_at_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.remove_at(3);
        
        assert_array(list.array, [10, 20, 30, 50], "remove_at");
    }
    
    remove_range_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.remove_range(1, 3);
        
        assert_array(list.array, [10, 50], "remove_range");
    }
    
    insert_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.insert(2, "one", "two", "three");
        
        assert_array(list.array, [10, 20, "one", "two", "three", 30, 40, 50], "insert");
    }
    
    insert_from_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2/*:ArrayList*/ = new ArrayList(["one", "two", "three"]);
        list1.insert_from(list2, 2);
        
        assert_array(list1.array, [10, 20, "one", "two", "three", 30, 40, 50], "insert_from");
    }
    
    insert_from_range_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2/*:ArrayList*/ = new ArrayList(["one", "two", "three"]);
        list1.insert_from_range(list2, 1, 2, 2);
        
        assert_array(list1.array, [10, 20, "two", "three", 30, 40, 50], "insert_from_range");
    }
    
    insert_array_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var array = ["one", "two", "three"];
        list.insert_array(array, 2);
        
        assert_array(list.array, [10, 20, "one", "two", "three", 30, 40, 50], "insert_array");
    }
    
    insert_array_range_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var array = ["one", "two", "three"];
        list.insert_array_range(array, 1, 2, 2);
        
        assert_array(list.array, [10, 20, "two", "three", 30, 40, 50], "insert_array_range");
    }
    
    index_of_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 30, 20, 30, 40, 30, 50]);
        
        assert(list.index_of(30), 1, "index_of");
    }
    
    last_index_of_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 30, 20, 30, 40, 30, 50]);
        
        assert(list.last_index_of(30), 5, "last_index_of");
    }
    
    contains_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        
        assert(list.contains(30), true, "contains true");
        assert(list.contains(60), false, "contains false");
    }
    
    contains_from_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2/*:ArrayList*/ = new ArrayList([10, 30, 40]);
        var list3/*:ArrayList*/ = new ArrayList([10, 30, 60]);
        
        assert(list1.contains_from(list2), true, "contains_from true");
        assert(list1.contains_from(list3), false, "contains_from false");
    }
    
    contains_from_range_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2/*:ArrayList*/ = new ArrayList([10, 30, 60]);
        
        assert(list1.contains_from_range(list2, 0, 2), true, "contains_from_range true");
        assert(list1.contains_from_range(list2, 1, 2), false, "contains_from_range false");
    }
    
    contains_array_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var array1 = [10, 30, 40];
        var array2 = [10, 30, 60];
        
        assert(list.contains_array(array1), true, "contains_array true");
        assert(list.contains_array(array2), false, "contains_array false");
    }
    
    contains_array_range_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var array = [10, 30, 60];
        
        assert(list.contains_array_range(array, 0, 2), true, "contains_array_range true");
        assert(list.contains_array_range(array, 1, 2), false, "contains_array_range false");
    }
    
    find_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        
        assert(list.find(function(val) { return val > 10; }), 20, "find");
    }
    
    find_last_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        
        assert(list.find_last(function(val) { return val < 50; }), 40, "find_last");
    }
    
    find_all_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2/*:ArrayList*/ = list1.find_all(function(val) { return val > 10 && val < 50; });
        
        assert_array(list2.array, [20, 30, 40], "find_all");
    }
    
    find_index_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        
        assert(list.find_index(function(val) { return val > 10; }), 1, "find_index");
    }
    
    find_last_index_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        
        assert(list.find_last_index(function(val) { return val < 50; }), 3, "find_last_index");
    }
    
    remove_where_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.remove_where(function(val) { return val > 10; });
        
        assert_array(list.array, [10, 30, 40, 50], "remove_where");
    }
    
    remove_where_last_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.remove_where_last(function(val) { return val < 50; });
        
        assert_array(list.array, [10, 20, 30, 50], "remove_where_last");
    }
    
    remove_where_all_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.remove_where_all(function(val) { return val > 10 && val < 50; });
        
        assert_array(list.array, [10, 50], "remove_where_all");
    }
    
    size_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        
        assert(list.size(), 5, "size");
    }
    
    clear_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.clear();
        
        assert(array_length(list.array), 0, "clear");
    }
    
    is_empty_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2/*:ArrayList*/ = new ArrayList();
        
        assert(list1.is_empty(), false, "is_empty false");
        assert(list2.is_empty(), true, "is_empty true");
    }
    
    sort_test = function() {
        var list/*:ArrayList*/ = new ArrayList([30, 50, 40, 10, 20]);
        list.sort(true);
        
        assert_array(list.array, [10, 20, 30, 40, 50], "sort");
    }
    
    swap_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.swap(1, 3);
        
        assert_array(list.array, [10, 40, 30, 20, 50], "swap");
    }
    
    shuffle_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.shuffle();
        
        assert_func(list, new ArrayList([10, 20, 30, 40, 50]), function(a, b) { return a.contains_from(b) && !a.equals(b); }, "shuffle");
    }
    
    reverse_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        list.reverse();
        
        assert_array(list.array, [50, 40, 30, 20, 10], "reverse");
    }
    
    copy_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2/*:ArrayList*/ = new ArrayList(["twenty", "thirty", "forty"]);
        list1.copy(list2, 1);
        
        assert_array(list1.array, [10, "twenty", "thirty", "forty", 50], "copy");
    }
    
    copy_range_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2/*:ArrayList*/ = new ArrayList(["twenty", "thirty", "forty"]);
        list1.copy_range(list2, 1, 2, 2);
        
        assert_array(list1.array, [10, 20, "thirty", "forty", 50], "copy_range");
    }
    
    copy_array_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var array = ["twenty", "thirty", "forty"];
        list.copy_array(array, 1);
        
        assert_array(list.array, [10, "twenty", "thirty", "forty", 50], "copy_array");
    }
    
    copy_array_range_test = function() {
        var list/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var array = ["twenty", "thirty", "forty"];
        list.copy_array_range(array, 1, 2, 2);
        
        assert_array(list.array, [10, 20, "thirty", "forty", 50], "copy_array_range");
    }
    
    copy_ds_list_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2 = ds_list_create(); ds_list_add(list2, "twenty", "thirty", "forty");
        list1.copy_ds_list(list2, 1);
        
        assert_array(list1.array, [10, "twenty", "thirty", "forty", 50], "copy_ds_list");
    }
    
    copy_ds_list_range_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2 = ds_list_create(); ds_list_add(list2, "twenty", "thirty", "forty");
        list1.copy_ds_list_range(list2, 1, 2, 2);
        
        assert_array(list1.array, [10, 20, "thirty", "forty", 50], "copy_ds_list_range");
    }
    
    clone_test = function() {
        
    }
    
    clone_range_test = function() {
        
    }
    
    copy_deep_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2/*:ArrayList*/ = new ArrayList([{ twenty : 20 } , { thirty : 30 }, { forty : 40 }]);
        list1.copy_deep(list2, 1);
        
        assert_func(list1.array, [10, { twenty : 20 } , { thirty : 30 }, { forty : 40 }, 50], function(a, b) { return string(a) == string(b) && !array_equals(a, b); }, "copy_deep");
    }
    
    to_array_test = function() {
        
    }
    
    to_array_range_test = function() {
        
    }
    
    to_ds_list_test = function() {
        
    }
    
    to_ds_list_range_test = function() {
        
    }
    
    equals_test = function() {
        var list1/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list2/*:ArrayList*/ = new ArrayList([10, 20, 30, 40, 50]);
        var list3/*:ArrayList*/ = new ArrayList([10, 30, 50]);
        
        assert(list1.equals(list2), true, "equals true");
        assert(list1.equals(list3), false, "equals false");
    }
}

tests.run();