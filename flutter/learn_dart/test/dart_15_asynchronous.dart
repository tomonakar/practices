// ignore_for_file: avoid_print

Future<String> fetchUserOrder() => Future.delayed(
      const Duration(seconds: 2),
      () => 'Cappuccino',
      // () => throw Exception('Out of milk'),
    );

Future<String> fetchUserOrder2() => Future.value("Espresso");
Future<String> fetchUserOrder3() => Future.error(Exception('Out of milk'));

Future<void> countdown(int n) async {
  for (var i = n; i >= 0; i--) {
    Future.delayed(const Duration(seconds: 1), () => print(i));
  }
}

Future<void> main() async {
  print('Program started');

  try {
    fetchUserOrder()
        .then((value) => print('Order is $value'))
        .catchError((error) => print(error));

    final order = await fetchUserOrder();
    print(order);

    final order2 = await fetchUserOrder2();
    print(order2);

    print('Fetching user order...');
  } catch (e) {
    print(e);
  } finally {
    print('Program ended');
  }

  await countdown(5);
}
