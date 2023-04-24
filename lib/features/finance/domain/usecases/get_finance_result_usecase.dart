import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/finance_yahoo_entity.dart';
import '../repositories/i_finance_yahoo_repository.dart';

class GetFinanceResultUsecase {
  final IFinanceYahooRepository iFinanceYahooRepository;

  GetFinanceResultUsecase({
    required this.iFinanceYahooRepository,
  });

  Future<Either<Failure, FinanceYahooEntity>> call() async {
    return await iFinanceYahooRepository.getResultFinance();
  }
}
