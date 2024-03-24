// import 'package:flutter_test/flutter_test.dart';
// import 'package:approuter/approuter.dart';
// import 'package:approuter/approuter_platform_interface.dart';
// import 'package:approuter/approuter_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockApprouterPlatform
//     with MockPlatformInterfaceMixin
//     implements ApprouterPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final ApprouterPlatform initialPlatform = ApprouterPlatform.instance;

//   test('$MethodChannelApprouter is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelApprouter>());
//   });

//   test('getPlatformVersion', () async {
//     Approuter approuterPlugin = Approuter();
//     MockApprouterPlatform fakePlatform = MockApprouterPlatform();
//     ApprouterPlatform.instance = fakePlatform;

//     expect(await approuterPlugin.getPlatformVersion(), '42');
//   });
// }
