import 'package:equatable/equatable.dart';

import 'indicators_entity.dart';

class ResultEntity extends Equatable {
  final List<int>? timestamp;
  final IndicatorsEntity? indicators;

  const ResultEntity({
    this.timestamp,
    this.indicators,
  });

  @override
  List<Object?> get props => [
        timestamp,
        indicators,
      ];
}
