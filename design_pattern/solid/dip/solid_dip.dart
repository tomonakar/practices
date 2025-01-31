enum Relationship { parent, child, sibling }

class Person {
  final String name;
  Person(this.name);
}

class Info {
  final Person from;
  final Relationship relationship;
  final Person to;

  Info(this.from, this.relationship, this.to);
}

// 低レベルモジュールの抽象化
abstract interface class RelationshipBrowser {
  List<Person> findAllChildrenOf(String name);
}

// 低レベルモジュールの実装
class Relationships implements RelationshipBrowser {
  final List<Info> _relations = [];

  List<Info> get relations => List.unmodifiable(_relations);

  void addParentAndChild(Person parent, Person child) {
    _relations
      ..add(Info(parent, Relationship.parent, child))
      ..add(Info(child, Relationship.child, parent));
  }

  @override
  List<Person> findAllChildrenOf(String name) => _relations
      .where(
          (r) => r.from.name == name && r.relationship == Relationship.parent)
      .map((r) => r.to)
      .toList();
}

// 高レベルモジュール
class Research {
  const Research._();

  static void findChildren(RelationshipBrowser browser, String name) {
    final children = browser.findAllChildrenOf(name);
    for (final child in children) {
      print('$nameは${child.name}の親です');
    }
  }
}

void main() {
  final parent = Person('John');
  final child1 = Person('Chris');
  final child2 = Person('Matt');

  final relationships = Relationships();
  relationships.addParentAndChild(parent, child1);
  relationships.addParentAndChild(parent, child2);

  Research.findChildren(relationships, 'John');
}
