import 'package:bks_case/services/authentication_service.dart';
import 'package:bks_case/services/user_profile_service.dart';
import 'package:bks_case/viewmodel/login_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => UserProfileService());

  locator.registerFactory(() => LoginViewModel());
  
}