import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/api/api_interceptors.dart';
import 'core/api/url_creator.dart';
import 'core/device/network_info.dart';
import 'features/finance/data/datasources/finance_yahoo_remote_data_source.dart';
import 'features/finance/data/repositories/finance_yahoo_repository.dart';
import 'features/finance/domain/repositories/i_finance_yahoo_repository.dart';
import 'features/finance/domain/usecases/get_finance_result_usecase.dart';
import 'features/finance/presentation/bloc/finance_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(connectivity: sl()));
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<IHttpClient>(() => HttpClient());
  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton<IUrlCreator>(() => UrlCreator());

  sl.registerLazySingleton(() => FinanceBloc(sl()));
  sl.registerLazySingleton(
      () => GetFinanceResultUsecase(iFinanceYahooRepository: sl()));
  sl.registerLazySingleton<IFinanceYahooRepository>(
      () => FinanceYahooRepository(iFinanceYahooRemoteDataSource: sl()));
  sl.registerLazySingleton<IFinanceYahooRemoteDataSource>(() =>
      FinanceYahooRemoteDataSource(
          client: sl(), iNetworkInfo: sl(), iUrlCreator: sl()));

  await sl.allReady();
}
