import 'package:equatable/equatable.dart';

import 'result_entity.dart';

class ChartEntity extends Equatable {
  final List<ResultEntity>? result;

  const ChartEntity({
    this.result,
  });

  @override
  List<Object?> get props => [
        result,
      ];
}
