import 'package:dynamic_router/approuter.dart';
import 'package:flutter/widgets.dart';

class PageStackRouterDelegate extends RouterDelegate<PageStackConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<PageStackConfiguration> {
  final List<NavigatorObserver> observers;
  final PageStack pageStack;
  final GlobalKey<NavigatorState>? navkey;
  final TransitionDelegate<dynamic> transitionDelegate;
  PageStackRouterDelegate(
    this.pageStack, {
    this.navkey,
    this.observers = const <NavigatorObserver>[],
    this.transitionDelegate = const DefaultTransitionDelegate<dynamic>(),
  }) {
    pageStack.events.listen(_onPageStackEvent);
  }

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  PageStackConfiguration? get currentConfiguration {
    return pageStack.getConfiguration();
  }

  @override
  Widget build(BuildContext context) {
    return PageStackNavigator(
      navigatorKey: navkey,
      observers: observers,
      stack: pageStack,
      transitionDelegate: transitionDelegate,
    );
  }

  @override
  Future<void> setNewRoutePath(PageStackConfiguration configuration) async {
    return pageStack.setConfiguration(configuration);
  }

  void _onPageStackEvent(PageStackEvent event) {
    if (event is PageStackPageEvent) {
      if (event.pageEvent is PagePathChangedEvent) {
        notifyListeners();
      }
    }
  }
}
