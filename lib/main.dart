import 'package:flutter/material.dart';

import 'app.dart';
import 'instance_locator.dart';

void main() {
  InstanceLocator().setupLocator();
  runApp(App());
}