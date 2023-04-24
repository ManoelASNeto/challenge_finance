import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/finance_yahoo_entity.dart';
import '../../domain/usecases/get_finance_result_usecase.dart';

part 'finance_event.dart';
part 'finance_state.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  final GetFinanceResultUsecase getFinanceResultUsecase;

  FinanceBloc(this.getFinanceResultUsecase)
      : super(const FinanceState.initial()) {
    on<FinanceEvent>((event, emit) async {
      emit(state.loading());
      var fold = await getFinanceResultUsecase();
      emit(await fold.fold(
        (failure) => state.error(_mapFinanceFailureToString(failure)),
        (finance) => state.ready(finance),
      ));
    });
  }

  String _mapFinanceFailureToString(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Erro ao conectar ao servidor Tente novamente';
      default:
        return 'Tente novamente';
    }
  }
}
