import 'package:equatable/equatable.dart';

import '../../domain/entities/chart_entity.dart';
import 'result_model.dart';

class ChartModel extends Equatable {
  final List<ResultModel>? result;

  const ChartModel({
    required this.result,
  });

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        result: (json['result'] as List)
            .map((e) => ResultModel.fromJson(e))
            .toList(),
      );

  ChartEntity toEntity() => ChartEntity(
        result: result?.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => throw UnimplementedError();
}
