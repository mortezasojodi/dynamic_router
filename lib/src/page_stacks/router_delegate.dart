import 'package:flutter/widgets.dart';

import 'configuration.dart';
import 'page_stacks.dart';

abstract class PageStacksRouterDelegate
    extends RouterDelegate<PageStacksConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<PageStacksConfiguration> {
  @override
  final navigatorKey = GlobalKey<NavigatorState>();
  final PageStacks pageStacks;

  PageStacksRouterDelegate(this.pageStacks) {
    pageStacks.events.listen((e) => notifyListeners());
  }

  @override
  PageStacksConfiguration? get currentConfiguration {
    return pageStacks.getConfiguration();
  }

  @override
  Future<void> setNewRoutePath(PageStacksConfiguration configuration) async {
    return pageStacks.setConfiguration(configuration);
  }
}
