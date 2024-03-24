abstract class Bindings {
  void dependencies([dynamic data]);
}

class BindingsBuilder<T> extends Bindings {
  /// Register your dependencies in the [builder] callback.
  final BindingBuilderCallback builder;

  /// Shortcut to register 1 Controller with Get.put(),
  /// Prevents the issue of the fat arrow function with the constructor.
  /// BindingsBuilder(() => Get.put(HomeController())),
  ///
  /// Sample:
  /// ```
  /// GetPage(
  ///   name: '/',
  ///   page: () => Home(),
  ///   binding: BindingsBuilder.put(() => HomeController()),
  /// ),
  /// ```
  // factory BindingsBuilder.put(InstanceBuilderCallback<T> builder,
  //     {String? tag, bool permanent = false}) {
  //   return BindingsBuilder(
  //       () => GetInstance().put<T>(builder(), tag: tag, permanent: permanent));
  // }

  /// WARNING: don't use `()=> Get.put(Controller())`,
  /// if only passing 1 callback use `BindingsBuilder.put(Controller())`
  /// or `BindingsBuilder(()=> Get.lazyPut(Controller()))`
  BindingsBuilder(this.builder);

  @override
  void dependencies([dynamic data]) {
    builder();
  }
}

// abstract class INavigation {}
// typedef Snack = Function();
// typedef Modal = Function();
// typedef Route = Function();
typedef BindingBuilderCallback = void Function();
