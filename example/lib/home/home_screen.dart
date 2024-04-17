import 'package:dynamic_router/approuter.dart';
import 'package:dynamic_router_example/detail/route/detail_route.dart';
import 'package:dynamic_router_example/extentions/box_extention.dart';
import 'package:dynamic_router_example/inner_detail/route/inner_detail_route.dart';
import 'package:dynamic_router_example/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<NavigatorState> navkey = GlobalKey<NavigatorState>();
  late PPageStack<PagePath> pageStack;
  late DynamicRouterDelegate routerDelegate;

  bool isFirst = true;
  @override
  initState() {
    pageStack = PageStack(bottomPage: HomeDetailRoute(id: 1));
    routerDelegate = DynamicRouterDelegate(pageStack, navkey: navkey);
    routerDelegate.addListener(() {
      setState(() {
        isFirst = inInMainDetail();
      });
    });
    super.initState();
  }

  routeToInnerDetail(BuildContext context, {required int id}) {
    AppRouter.pushPage(InnerDetailRoute(), context: context);
  }

  bool inInMainDetail() {
    var isFirst = routerDelegate.currentConfiguration?.paths.lastOrNull?.key ==
        Approutes.homeDetailRoute;
    return isFirst;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      return Scaffold(
        body: Row(
          children: [
            if (boxConstraints.isLarge())
              SafeArea(
                child: Container(
                  width: 200,
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      const Text("Layout"),
                      (isFirst)
                          ? Center(
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                ),
                                onPressed: () => routeToInnerDetail(
                                    navkey.currentContext!,
                                    id: 1),
                                child: const Text(
                                  "to inner Detail",
                                ),
                              ),
                            )
                          : Center(
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () =>
                                    AppRouter.pop(navkey.currentContext!),
                                child: const Text(
                                  "pop",
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            Expanded(
                child: Router(
              routerDelegate: routerDelegate,
            ))
          ],
        ),
      );
    });
  }
}
