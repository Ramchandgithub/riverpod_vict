


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:victous/Controllers/auth_controller.dart';
import 'package:victous/Presentation/login_view.dart';
import 'package:victous/Utils/session_manager.dart';
import 'Presentation/main_view.dart';
import 'Utils/constants.dart';
import 'Utils/init_route.dart';
import 'Utils/local_package_info.dart';
import 'Utils/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalPackageInfo.init();
  await SessionManager.init();

  EasyLoading.instance
  ..loadingStyle =EasyLoadingStyle.custom
  ..textColor = Colors.black
  ..radius = 20
  ..backgroundColor = Colors.transparent
  ..maskColor = Colors.white
    ..indicatorColor = Colors.black54
    ..userInteractions = false
    ..dismissOnTap = false
    ..boxShadow = <BoxShadow>[]
    ..contentPadding=EdgeInsets.zero
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid;
   runApp(const ProviderScope(child: MyApp()));
}


final themeProvider = Provider<ThemeData>((ref) {
  return ThemeData(
    fontFamily: "Montserrat",
    primaryColor:  Constants.hexToColor('#792B90'),
      appBarTheme: AppBarTheme(
        backgroundColor: Constants.hexToColor('#792B90') ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Constants.hexToColor('#792B90') )
      )
  );
});


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final theme = ref.watch(themeProvider);

    return GetMaterialApp(
      theme: theme,
      initialRoute: '/',
      getPages:routes,
      builder:  EasyLoading.init(),
      home:  const SplashView(),
      debugShowCheckedModeBanner: false,

    );
  }
}


final appStartupProvider = FutureProvider<void>((ref) async {
  ref.read(authProvider.notifier).loadSession();
  // await Future.delayed(const Duration(seconds: 3));

});

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appStartupProvider, (prev, next){
      if(next is AsyncData){
        final auth = ref.read(authProvider);
        Logger.logger("auth:::${auth.isLoggedIn}");
        if(auth.isLoggedIn){
          Get.offAllNamed(Main.routeName);
        } else{
          Get.offAllNamed(Main.routeName);
        }


      }
    });

    return SplashUI();

  }
}

class SplashUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('${Constants.ImagePath}flash-screen.png', fit: BoxFit.cover,)
        ],
        
      ),
    );
  }
  
}
