// import 'package:Gestart/app/constants/route_name.dart';
// import 'package:Gestart/data/data_sources/auth/auth_local_data_source.dart';
// import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/data/datasource/auth/auth_local_data_source.dart';
import 'package:Gestart/data/local/shared_preferences.dart';
import 'package:Gestart/di/di.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final Dio dio;
  final sharedPreferences = getIt.get<SharedPreferencesManager>();

  AuthInterceptor(this.dio);

  @override
  Future onError(DioError error, handler) async {
    if (error.response?.statusCode == 401 &&
        error.requestOptions.path != 'login') goToLogin();
    return super.onError(error, handler);
  }

  goToLogin() {
    getIt.get<SharedPreferencesManager>().removeAll();
    Modular.to.pushReplacementNamed(RouteName.login,
        arguments: 'Sua sessão expirou, logue–se novamente.');
  }

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var tokenFcm = await sharedPreferences.getString('devicekey');
    var token = await getIt<AuthLocalDataSource>().getToken();
    if (token != null) options.headers['accesstoken'] = token;
    if (tokenFcm != null) options.headers['devicekey'] = tokenFcm;
    return super.onRequest(options, handler);
  }
}
