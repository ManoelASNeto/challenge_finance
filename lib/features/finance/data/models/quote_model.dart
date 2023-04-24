import 'package:equatable/equatable.dart';

import '../../domain/entities/quote_entity.dart';

class QuoteModel extends Equatable {
  final List<dynamic>? open;

  const QuoteModel({
    this.open,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        open: (json['open'] as List<dynamic>).map((e) => e).toList(),
      );

  QuoteEntity toEntity() => QuoteEntity(
        open: open,
      );

  @override
  List<Object?> get props => [
        open,
      ];
}
