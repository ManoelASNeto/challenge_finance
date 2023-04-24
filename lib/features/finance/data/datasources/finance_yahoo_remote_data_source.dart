import 'dart:convert';

import '../../../../core/api/api_interceptors.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/api/url_creator.dart';
import '../../../../core/device/network_info.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/finance_yahoo_model.dart';

abstract class IFinanceYahooRemoteDataSource {
  Future<FinanceYahooModel> resultfinance();
}

class FinanceYahooRemoteDataSource implements IFinanceYahooRemoteDataSource {
  final IHttpClient client;
  final INetworkInfo iNetworkInfo;
  final IUrlCreator iUrlCreator;

  FinanceYahooRemoteDataSource({
    required this.client,
    required this.iNetworkInfo,
    required this.iUrlCreator,
  });

  @override
  Future<FinanceYahooModel> resultfinance() async {
    final isConnected = await iNetworkInfo.isConnected;
    if (isConnected) {
      final response = await client.get(
        iUrlCreator.created(
          endpoint: Endpoints.petra,
        ),
      );
      switch (response.statusCode) {
        case 200:
          return FinanceYahooModel.fromJson(jsonDecode(response.body));
        default:
          throw ServerException();
      }
    }
    throw NetworkException();
  }
}
