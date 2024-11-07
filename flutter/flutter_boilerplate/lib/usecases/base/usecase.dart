import 'package:flutter_boilerplate/domain/entities/common/result.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type>> execute(Params params);
}

class NoParams {
  const NoParams();
}
