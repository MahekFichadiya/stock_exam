// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:stock_management_exam/ui/auth/ui/login_screen.dart' as _i3;
import 'package:stock_management_exam/ui/auth/ui/signup_screen.dart' as _i4;
import 'package:stock_management_exam/ui/home/ui/buy_sell_stock_screen.dart'
    as _i1;
import 'package:stock_management_exam/ui/home/ui/home_screen.dart' as _i2;

/// generated route for
/// [_i1.BuySellStockScreen]
class BuySellStockRoute extends _i5.PageRouteInfo<BuySellStockRouteArgs> {
  BuySellStockRoute({
    _i6.Key? key,
    required int stockId,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         BuySellStockRoute.name,
         args: BuySellStockRouteArgs(key: key, stockId: stockId),
         initialChildren: children,
       );

  static const String name = 'BuySellStockRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BuySellStockRouteArgs>();
      return _i1.BuySellStockScreen(key: args.key, stockId: args.stockId);
    },
  );
}

class BuySellStockRouteArgs {
  const BuySellStockRouteArgs({this.key, required this.stockId});

  final _i6.Key? key;

  final int stockId;

  @override
  String toString() {
    return 'BuySellStockRouteArgs{key: $key, stockId: $stockId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BuySellStockRouteArgs) return false;
    return key == other.key && stockId == other.stockId;
  }

  @override
  int get hashCode => key.hashCode ^ stockId.hashCode;
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.SignupScreen]
class SignupRoute extends _i5.PageRouteInfo<void> {
  const SignupRoute({List<_i5.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignupScreen();
    },
  );
}
