import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:tiktok_tool/src/router/routes.dart';
import '../presentation/home/home_page.dart';
import '../presentation/splash/splash_page.dart';
import '../presentation/stream_container/stream_page.dart';
import '../presentation/host/host_page.dart';
import '../presentation/room/room_page.dart';
import '../presentation/comment/comment_page.dart';

part 'auto_route.gr.dart';

// flutter packages pub run build_runner build --delete-conflicting-outputs

@AutoRouterConfig()
class XRouter extends _$XRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: XRoutes.splash, page: SplashRoute.page),
        AutoRoute(path: XRoutes.home, page: HomeRoute.page),
        AutoRoute(path: XRoutes.livestream, page: StreamRoute.page),
        AutoRoute(path: XRoutes.host, page: HostRoute.page),
        AutoRoute(path: XRoutes.room, page: RoomRoute.page),
        AutoRoute(path: XRoutes.comment, page: CommentRoute.page),
        RedirectRoute(path: '*', redirectTo: '/'),
      ];

  @override
  Future<bool> popTop<T extends Object?>([T? result]) {
    // if (XLoading.isShow) {
    //   return Future(() => true);
    // } else {
    return super.popTop(result);
    // }
  }
}
