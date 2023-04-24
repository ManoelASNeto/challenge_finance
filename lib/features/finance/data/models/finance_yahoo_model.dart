import 'package:equatable/equatable.dart';

import '../../domain/entities/finance_yahoo_entity.dart';
import 'chart_model.dart';

class FinanceYahooModel extends Equatable {
  final ChartModel? chart;

  const FinanceYahooModel({
    required this.chart,
  });

  factory FinanceYahooModel.fromJson(Map<String, dynamic> json) =>
      FinanceYahooModel(
        chart: ChartModel.fromJson(json['chart']),
      );

  FinanceYahooEntity toEntity() => FinanceYahooEntity(
        chart: chart?.toEntity(),
      );

  @override
  List<Object?> get props => [];
}
