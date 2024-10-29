void main() {
  int? a;
  const b = 2;
  // if-null operator
  print(a ?? 0 + b);

  // null-aware assignment
  const x = -1;
  // initialize variables or type interface null safety work well with each other.
  var maybeValue;

  if (x > 0) {
    maybeValue = x;
  }
  maybeValue ??= 0;
  final value = maybeValue;
  print(value);

  /// null safety with collections
  // const e = <String>['a', 'b', 'c', null]; // Error: Null value in list.
  const f = <String?>['a', 'b', null, 'c']; // OK

  final ff = f.nonNulls.indexed.map((e) {
    final (index, value) = e;
    return (index, value);
  });
  print(ff); // [(0, a), (1, b), (2, c)]
}
