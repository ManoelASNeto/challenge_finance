import 'package:challenge_finance/core/errors/exceptions.dart';

import '../../../../core/errors/failure.dart';
import '../datasources/finance_yahoo_remote_data_source.dart';
import '../../domain/entities/finance_yahoo_entity.dart';
import '../../domain/repositories/i_finance_yahoo_repository.dart';
import 'package:dartz/dartz.dart';

class FinanceYahooRepository implements IFinanceYahooRepository {
  final IFinanceYahooRemoteDataSource iFinanceYahooRemoteDataSource;

  FinanceYahooRepository({
    required this.iFinanceYahooRemoteDataSource,
  });

  @override
  Future<Either<Failure, FinanceYahooEntity>> getResultFinance() async {
    try {
      var finance = await iFinanceYahooRemoteDataSource.resultfinance();
      final entity = finance.toEntity();
      return Right(entity);
    } on ServerException {
      throw Left(
        ServerFailure(),
      );
    }
  }
}
