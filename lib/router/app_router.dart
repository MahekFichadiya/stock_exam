import 'package:auto_route/auto_route.dart';
import 'package:stock_management_exam/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: BuySellStockRoute.page),
  ];
}
