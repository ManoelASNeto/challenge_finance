import 'package:connectivity_plus/connectivity_plus.dart';

abstract class INetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfo implements INetworkInfo {
  final Connectivity connectivity;

  NetworkInfo({
    required this.connectivity,
  });

  @override
  Future<bool> get isConnected async {
    final status = await connectivity.checkConnectivity();
    return status != ConnectivityResult.none;
  }
}
