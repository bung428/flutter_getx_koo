import 'package:flutter/material.dart';
import 'package:flutter_getx_koo/async/stream_worker.dart';
import 'package:flutter_getx_koo/widget/keyboard_unfocus_widget.dart';
import 'package:get/get.dart';

typedef AppGetxBuilder<T extends GetxController> = Widget Function(
    BuildContext context, T controller);

class AppGetBuilder<T extends GetxController> extends StatelessWidget {
  final T? init;
  final bool outsideUnFocus;
  final AppGetxBuilder<T> builder;

  const AppGetBuilder({
    super.key,
    this.init,
    this.outsideUnFocus = false,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
        init: init,
        autoRemove: init != null,
        builder: (T controller) {
          var child = builder(context, controller);
          if (outsideUnFocus) {
            child = KeyboardUnFocus(child: child);
          }

          if (controller is StreamWorker) {
            child = StreamWorkerWidget(
              worker: controller,
              child: child,
            );
          }

          return child;
        }
    );
  }
}