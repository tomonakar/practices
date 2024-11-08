import 'package:flutter_boilerplate/domain/common/result.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type>> execute(Params params);
}

class NoParams {
  const NoParams();
}
