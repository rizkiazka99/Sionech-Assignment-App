import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sionech_assignment_app/app/utils/result.dart';

abstract class UseCase<Type, Params> {
  Future<bool> get hasInternetConnection async =>
      await Connectivity().checkConnectivity() != ConnectivityResult.none;
  
  Future<Result<Type>> call();
}