# ArrayList.gml

It is a custom List class / struct build on top of a standard GameMaker array. Works only with the 2.3+ version which introduced structs and constructors.

The advantages over ds_list or other struct realizations are: garbage collected, [fast sort function](https://github.com/KeeVeeGames/quicksort.gml), `[]` accessor and referencing as an array.

ArrayList is GC-friendly as it's basically an array inside of a struct so no need to manually destroy it as you do with the ds_list (although you can use `delete` on a ArrayList to dispose it explicitly).

There are some methods, including analogues of corresponding ds_list functions such as: [`add`](../../wiki/API-Reference#addvalue), [`remove`](../../wiki/API-Reference#removepos), [`insert`](../../wiki/API-Reference#insertpos-value), [`sort`](../../wiki/API-Reference#sortascending), [`shuffle`](../../wiki/API-Reference#shuffle), [`reverse`](../../wiki/API-Reference#reverse), [`copy`](../../wiki/API-Reference#copysource) and other.

Array reference is available from the struct in the [`array`](/wiki/API-Reference/_edit#array--) property and then can be passed anywhere or used with an accessor. Array reference is staying the same for the all lifecycle of struct so any changes made with that array will also reflects on the ArrayList and other way, if you pass that array somewhere (inside another data structure, draw it on GUI, etc.), all changes made with the ArrayList struct will also change the array. Basically you have all the array scripts ever written for GM available for this struct also.

So it is both an array and a list:

```js
list = new ArrayList();

list.add("howdy", "ho", "world", "!");
list.remove(1);

list.array[0] = "hello";
array_resize(list.array, 2);
```

Weak parts are: slower than pure array or ds_list, no outside of bounds checking and possibility of losing the reference if reassign it explicitly via `list.array = []`, which you shouldn't do.

## JSON Serialization:
You can easily encode/decode ArrayList to Json and vice versa with this packages:
* [TJSON](https://yellowafterlife.itch.io/gamemaker-tjson)
* [SNAP](https://github.com/JujuAdams/SNAP) (+ XML)
* etc.

## Installation:
Get the latest asset package from the [releases page](../../releases). Import it into IDE.   
Alternatively copy the code from corresponding scripts into your project.

## Dependencies:
ArrayList is using [quicksort](https://github.com/KeeVeeGames/quicksort.gml) package so you need to import this also if you do install as asset package and not from sources.

## Syntax:
### [API Reference](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference)
- [ArrayList Class](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#arraylist-class)
  * [Constructor](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#constructor)
  * [Members:](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#members)
    + [`array` : `*[]`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#-array--)
  * [Methods:](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#methods)
    + [`add(...value)`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#addvalue)
    + [`remove(pos)`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#removepos)
    + [`insert(pos, value)`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#insertpos-value)
    + [`size()` 🠆 `real`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#size--real)
    + [`find_index(value)` 🠆 `real`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#find_indexvalue--real)
    + [`clear()`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#clear)
    + [`is_empty()` 🠆 `bool`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#is_empty--bool)
    + [`sort(ascending)`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#sortascending)
    + [`shuffle()`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#shuffle)
    + [`reverse()`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#reverse)
    + [`copy(source)`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#copysource)
    + [`clone()` 🠆 `ArrayList`](https://github.com/KeeVeeGames/ArrayList.gml/wiki/API-Reference#clone--arraylist)
### Example
```js
var list1 = new ArrayList([2, 4, 43, 50, 79, 36, 93, 54, 99, 26, 65, 69, 81, 63, 72, 3]);

list1.add(10, 9);

list1.remove(list1.size() - 2);

list1.insert(2, 5);

list1.array[2] = 6;
list1.array[list1.find_index(81)] = 18;

var list2 = new ArrayList();

list2.copy(list1);

list1.sort(true);
list2.shuffle();

show_debug_message(list1.array);
show_debug_message(list2.array);
```

## Author:
Nikita Musatov - [MusNik / KeeVee Games](https://keevee.games/)

License: [MIT](https://en.wikipedia.org/wiki/MIT_License)
