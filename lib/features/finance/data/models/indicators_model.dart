import 'package:equatable/equatable.dart';

import '../../domain/entities/indicators_entity.dart';
import 'quote_model.dart';

class IndicatorsModel extends Equatable {
  final List<QuoteModel>? quote;

  const IndicatorsModel({
    this.quote,
  });

  factory IndicatorsModel.fromJson(Map<String, dynamic> json) =>
      IndicatorsModel(
        quote:
            (json['quote'] as List).map((e) => QuoteModel.fromJson(e)).toList(),
      );

  IndicatorsEntity toEntity() => IndicatorsEntity(
        quote: quote?.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [quote];
}
