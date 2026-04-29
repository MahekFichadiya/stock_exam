import 'package:flutter/material.dart';
import 'package:stock_management_exam/core/locator/locator.dart';
import 'package:stock_management_exam/generated/l10n.dart';
import 'package:stock_management_exam/router/app_router.dart';
import 'package:stock_management_exam/values/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(MainApp(appRouter: locator<AppRouter>()));
}

class MainApp extends StatelessWidget {
  final AppRouter appRouter;
  const MainApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: appRouter.config(),
    );
  }
}
