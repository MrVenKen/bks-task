import 'package:bks_case/services/authentication_service.dart';
import 'package:bks_case/view/loginview.dart';
import 'package:bks_case/view/router.dart';
import 'package:bks_case/viewmodel/login_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'locator.dart';

void main() async{
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => LoginViewModel())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      initialData: locator<AuthenticationService>().myCurrentUser(),
      stream: locator<AuthenticationService>().onAuthStateChanged(),
      builder: (context, AsyncSnapshot<User?> snapshot) => Consumer<User?>(builder: (context,user, Widget? child){
        return MaterialApp(
          title: 'BKS Task',
          initialRoute: user ==null ? '/login': '/',
          onGenerateRoute: AppRouter.generateRoute,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
