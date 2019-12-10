import 'package:dio/browser_imp.dart';
import 'package:dio_interceptors/dio_interceptors.dart';
import 'package:interact/shared/auth/auth_bloc.dart';

class CustomDio extends DioForBrowser {
  CustomDio() {
    options.baseUrl = "https://www.googleapis.com/youtube/v3";
    /*interceptors.add(
        InterceptorToken(token: () async => AuthBloc.getInstance().getJWT()));*/
  }
}
