var time1, time2, list1, list2, val;

time1 = get_timer();
repeat(1000) list1 = new ArrayList();
time2 = get_timer();
show_debug_message("Create ArrayList: " + string(time2 - time1));

//

time1 = get_timer();
repeat(1000) list2 = ds_list_create();
time2 = get_timer();
show_debug_message("Create ds_list: " + string(time2 - time1));

//

time1 = get_timer();
repeat(1000) list1.add(12345);
time2 = get_timer();
show_debug_message("Add to ArrayList: " + string(time2 - time1));

//

time1 = get_timer();
repeat(1000) ds_list_add(list2, 12345);
time2 = get_timer();
show_debug_message("Add to ds_list: " + string(time2 - time1));

//

time1 = get_timer();
repeat(1000) val = list1.get(12);
time2 = get_timer();
show_debug_message("Get from ArrayList: " + string(time2 - time1));

//

time1 = get_timer();
repeat(1000) val = list2[| 12];
time2 = get_timer();
show_debug_message("Get from ds_list: " + string(time2 - time1));

//

time1 = get_timer();
//repeat(1000) list1.array[12] = 12345;
repeat(1000) val = list1.set(12, 12345);
time2 = get_timer();
show_debug_message("Set set ArrayList: " + string(time2 - time1));

//

time1 = get_timer();
repeat(1000) list2[| 12] = 12345;
time2 = get_timer();
show_debug_message("Set set ds_list: " + string(time2 - time1));

/*var list1 = new ArrayList([2, 4, 43, 50, 79, 36, 93, 54, 99, 26, 65, 69, 81, 63, 72, 3]);

list1.add(10, 9);

list1.remove_at(list1.size() - 2);

list1.insert(2, 5);

list1.array[2] = 6;
list1.array[list1.index_of(81)] = 18;

var list2 = list1.clone();

list1.sort(true);
list2.shuffle();

show_debug_message(list1);
show_debug_message(list2);*/