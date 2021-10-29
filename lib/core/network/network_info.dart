import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Abstract class that holds Network Information
abstract class NetworkInfo {
  /// check if device connected to internet
  Future<bool> get isConnected;
}

/// Implementaion for Netwrok Information class
class NetworkInfoImpl implements NetworkInfo {
  /// constructor
  NetworkInfoImpl(this.internetConnectionChecker);

  /// internet connection checker
  final InternetConnectionChecker internetConnectionChecker;

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
