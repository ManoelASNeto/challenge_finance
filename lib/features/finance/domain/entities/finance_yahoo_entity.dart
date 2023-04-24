import 'package:equatable/equatable.dart';

import 'chart_entity.dart';

class FinanceYahooEntity extends Equatable {
  final ChartEntity? chart;

  const FinanceYahooEntity({
    this.chart,
  });

  @override
  List<Object?> get props => [chart];
}
