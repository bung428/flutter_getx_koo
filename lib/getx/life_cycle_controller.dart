import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LifeCycleController extends GetxController with WidgetsBindingObserver {}

mixin LifeCycle on LifeCycleController {
  @mustCallSuper
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @mustCallSuper
  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @mustCallSuper
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResumed();
        break;
      case AppLifecycleState.paused:
        onPaused();
        break;
      case AppLifecycleState.inactive || AppLifecycleState.detached || AppLifecycleState.hidden:
        break;
    }
  }

  void onResumed() {}
  void onPaused() {}
}