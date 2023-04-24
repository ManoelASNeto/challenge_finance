import 'package:equatable/equatable.dart';

import '../../domain/entities/result_entity.dart';
import 'indicators_model.dart';

class ResultModel extends Equatable {
  final List<int>? timestamp;
  final IndicatorsModel? indicators;

  const ResultModel({
    this.timestamp,
    this.indicators,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        timestamp: json['timestamp'].cast<int>(),
        indicators: IndicatorsModel.fromJson(json['indicators']),
      );

  ResultEntity toEntity() =>
      ResultEntity(timestamp: timestamp, indicators: indicators?.toEntity());

  @override
  List<Object?> get props => [
        timestamp,
        indicators,
      ];
}
