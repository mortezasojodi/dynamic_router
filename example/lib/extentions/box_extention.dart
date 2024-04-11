import 'package:flutter/material.dart';

extension ExtensionValidator on BoxConstraints {
  bool isLarge() => maxWidth > 700;
}
