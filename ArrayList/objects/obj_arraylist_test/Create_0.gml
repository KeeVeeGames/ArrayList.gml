var list1 = new ArrayList([2, 4, 43, 50, 79, 36, 93, 54, 99, 26, 65, 69, 81, 63, 72, 3]);

list1.add(10, 9);

list1.remove(list1.size() - 2);

list1.insert(2, 5);

list1.array[2] = 6;
list1.array[list1.index_of(81)] = 18;

var list2 = list1.clone();

list1.sort(true);
list2.shuffle();

show_debug_message(list1.array);
show_debug_message(list2.array);