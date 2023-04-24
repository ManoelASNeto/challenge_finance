import '../../../../core/errors/failure.dart';
import '../entities/finance_yahoo_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IFinanceYahooRepository {
  Future<Either<Failure, FinanceYahooEntity>> getResultFinance();
}
