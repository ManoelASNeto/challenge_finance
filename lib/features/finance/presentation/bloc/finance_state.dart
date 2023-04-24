part of 'finance_bloc.dart';

enum FinanceStatus {
  loading,
  ready,
  error,
}

class FinanceState extends Equatable {
  final FinanceStatus? status;
  final FinanceYahooEntity? entity;
  final String? message;

  const FinanceState._(
    this.status,
    this.entity,
    this.message,
  );

  const FinanceState.initial() : this._(FinanceStatus.loading, null, null);

  FinanceState loading() {
    return FinanceState._(FinanceStatus.loading, entity, message);
  }

  FinanceState ready(FinanceYahooEntity? entity) {
    return FinanceState._(FinanceStatus.ready, entity, message);
  }

  FinanceState error(String msgError) {
    return FinanceState._(FinanceStatus.error, entity, msgError);
  }

  @override
  List<Object?> get props => [status, entity, message];
}
