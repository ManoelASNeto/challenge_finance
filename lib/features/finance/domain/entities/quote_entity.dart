import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final List<dynamic>? open;

  const QuoteEntity({
    this.open,
  });

  @override
  List<Object?> get props => [
        open,
      ];
}
