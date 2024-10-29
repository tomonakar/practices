import 'package:flutter_test/flutter_test.dart';

/// List, Set, and Map are the three collection types in Dart.

void listMethods() {
  const cities = ['Mumbai', 'Delhi', 'Bangalore', 'Hyderabad', null, 'Chennai'];

  print(cities[2]);
  print(cities.first);
  print(cities.length);
  print(cities.isEmpty);
  print(cities.isNotEmpty);
  print(cities.reversed);
  print(cities.asMap());
  print(cities.contains('Mumbai'));
  print(cities.nonNulls.toList());

  const emptyList = [];
  print(emptyList.firstOrNull);

  const list = [1, 2, 3, 4];
  print(list.singleOrNull);
}

void typeAnnotationWithList() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);
}

void keywordWithList() {
  // The final keyword is used to declare a variable that can only be set once.
  final List<int> a = [1, 2, 3, 4, 5];
  // But the elements of the list can be changed.
  a[1] = 10;
  print(a);

// The const keyword is used to declare a variable that is a compile-time constant.
  const List<int> b = [1, 2, 3, 4, 5];
  // The elements of the list cannot be changed.
  b[0] = 10; // Error: Cannot change the value of a constant.
  print(b);

  var c = [1.1, 2.2, 3.3];
  c = [4.4, 5.5, 6.6];
  print(c);
}

void setsExample() {
  var set1 = {1, 2, 3, 4, 5};
  var set2 = {3, 4, 5, 6, 7};

  print(set1.union(set2)); // {1, 2, 3, 4, 5, 6, 7}
  print(set1.intersection(set2)); // {3, 4, 5}
  print(set1.difference(set2)); // {1, 2}
  print(set1.lookup(3)); // 3
  print(set1.lookup(6)); // null

  //xorを表現　（set1とset2の和集合から積集合を引いたもの)
  print(set1.union(set2).difference(set1.intersection((set2)))); // {1, 2, 6, 7}

  // Sets can be iterated using the for-in loop.
  for (var s in set1) {
    print(s);
  }
}

void mapsExample() {
  Map<String, dynamic> map = {
    'name': 'John',
    'age': 30,
    'city': 'New York',
  };

  print(map['name'] as String); // john
  print(map['age']); // 30
  print(map['city']); // New York

  map['city'] = 'Chicago';
  print(map['city']);

  map.remove('city');
  print(map['city']); // null

  map.clear();
  print(map); // {}

  // maps can assign with var keyword.
  var map2 = <String, dynamic>{
    'name': 'John',
    'age': 30,
    'city': 'New York',
  };

  // maps return null if the key is not found.
  var weight = map2['weight'];
  print(weight); // null

  for (var item in map2.keys) {
    print(item); // name, age, city
  }

  for (var item in map2.values) {
    print(item); // John, 30, New York
  }

  for (var entry in map2.entries) {
    print('${entry.key}: ${entry.value}');
  }
}

void getAverageNestedCollection() {
  var restaurants = [
    {
      'name': 'Pizza Mario',
      'cuisine': 'Italian',
      'ratings': [4.0, 3.5, 4.5],
    },
    {
      'name': 'Chez Anne',
      'cuisine': 'French',
      'ratings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'Navaratna',
      'cuisine': 'Indian',
      'ratings': [4.0, 4.5, 4.0],
    },
  ];

  for (var restaurant in restaurants) {
    var sum = 0.0;
    final ratings = restaurant['ratings'] as List<double>;
    for (var rating in ratings) {
      sum += rating;
    }
    var average = sum / ratings.length;
    print('${restaurant['name']} has an average rating of $average');
  }
}

/// collection-if and collection-for
void collectionIfForAndSpread() {
  var numbers = [1, 2, 3, 4, 5];
  var evenNumbers = [if (numbers[0] % 2 == 0) numbers[0]];
  print(evenNumbers);

  var numbers2 = [1, 2, 3, 4, 5];
  var numbers3 = [10, 11, 12];
  var evenNumbers2 = [
    for (var number in numbers2)
      if (number % 2 == 0) number,
    ...numbers3
  ];
  print(evenNumbers2);
}

void deepCopyAndShallowCopy() {
  var list1 = [1, 2, 3];
  // Shallow copy
  var list2 = list1;
  list2[0] = 10;
  print(list1); // [10, 2, 3]
  print(list2); // [10, 2, 3]

// Deep copy
  var list3 = [1, 2, 3];
  var list4 = List.from(list3); // or [...list3];
  list4[0] = 10;
  print(list3); // [1, 2, 3]
  print(list4); // [10, 2, 3]
}

void main() {
  test('list methods', () {
    listMethods();
  });

  test('keyword with list', () {
    keywordWithList();
  });

  test('sets example', () {
    setsExample();
  });

  test('maps example', () {
    mapsExample();
  });

  test('get average nested collection', () {
    getAverageNestedCollection();
  });

  test('collection if and for', () {
    collectionIfForAndSpread();
  });
}
