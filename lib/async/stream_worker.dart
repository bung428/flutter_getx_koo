import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum WorkerState {
  hide,
  show,
  normal,
}

class AppLoadingModel {
  String? title;
  String? description;

  AppLoadingModel({this.title, this.description});

  factory AppLoadingModel.init() => AppLoadingModel(
    title: null,
    description: null
  );
}

mixin StreamWorker on GetxController {
  int workerCnt = 0;

  final fullLoading = RxBool(false);
  final workerState = Rx<WorkerState>(WorkerState.normal);
  final appLoadingModel = Rx(AppLoadingModel.init());

  @override
  void onClose() {
    workerState.close();
  }

  void changeLoadingWidget(
    bool fullLoading, [
    String? title,
    String? description
  ]) {
    this.fullLoading.value = fullLoading;
    appLoadingModel.value = AppLoadingModel(
      title: title ?? '로딩중 입니다.', description: description
    );
  }

  void streamWorker<T>(
    Future<T> Function() worker, {
    void Function(T data)? onData,
    Object? Function(Object e)? onError,
  }) async {
    showLoading();
    try {
      final T result = await worker();
      onData?.call(result);
    } catch (e) {
      try {
        final Object? error;
        if (onError != null) {
          error = onError(e);
        } else {
          error = e;
        }

        if (error == null) {
          return;
        }

        final context = Get.context;
        if (context != null) {
          // showExceptionBuilder(error);
        }
      } catch (_) {}
    } finally {
      hideLoading();
    }
  }

  void showLoading() {
    workerCnt++;
    updateWorkerState();
  }
  void hideLoading() {
    workerCnt--;
    if(fullLoading.value) {
      fullLoading.value = false;
      appLoadingModel.value = AppLoadingModel.init();
    }
    updateWorkerState();
  }

  void updateWorkerState() {
    if (workerCnt > 0) {
      switch (workerState.value) {
        case WorkerState.normal:
        case WorkerState.hide:
          workerState.value = WorkerState.show;
          break;
        case WorkerState.show:
          break;
      }
    } else {
      switch (workerState.value) {
        case WorkerState.normal:
          break;
        case WorkerState.show:
          workerState.value = WorkerState.normal;
          break;
        case WorkerState.hide:
          break;
      }
    }
  }
}

class StreamWorkerWidget extends StatelessWidget {
  final StreamWorker worker;
  final Widget? child;

  const StreamWorkerWidget({super.key, required this.worker, this.child});

  @override
  Widget build(BuildContext context) {
    final child = this.child;
    return Stack(children: [
      if (child != null) child,
      Obx(() => buildState(context, worker.workerState.value))
    ]);
  }

  Widget buildState(BuildContext context, WorkerState state) {
    return switch(state) {
      WorkerState.normal => const SizedBox(),
      WorkerState.show => Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0x00000000),
          child: _getLoadingBuilder(context, true)),
      WorkerState.hide => Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0x00000000),
          child: _getLoadingBuilder(context, false)),
    };
  }

  Widget _getLoadingBuilder(BuildContext context, bool loading) => loading
      // ? !worker.fullLoading.value
        ? const Center(
          child: CircularProgressIndicator.adaptive(),
        )
        // : AppLoading(model: worker.appLoadingModel.value)
      : const SizedBox();
}

// class AppLoading extends StatefulWidget {
//   final AppLoadingModel model;
//
//   const AppLoading({super.key, required this.model});
//
//   @override
//   State<AppLoading> createState() => _AppLoadingState();
// }
//
// class _AppLoadingState extends State<AppLoading> with TickerProviderStateMixin {
//   late final AnimationController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final model = widget.model;
//     return SafeArea(
//       child: Container(
//         color: theme.scaffoldBackgroundColor,
//         child: Stack(
//           fit: StackFit.expand,
//           alignment: Alignment.center,
//           children: [
//             if (model.title != null)
//               Positioned(
//                   child: Column(
//                     children: [
//                       const Gap(60),
//                       DefaultTextStyle(
//                           style: theme.textColor.normal(18),
//                           child: Text(
//                               model.title!
//                           )
//                       ),
//                       const Gap(24),
//                       if (model.description != null)
//                         DefaultTextStyle(
//                           style: theme.textColor.bold(24),
//                           child: Text(
//                             model.description!,
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                     ],
//                   )
//               ),
//             Center(
//               child: Lottie.asset(
//                 'assets/lottie/intro.json',
//                 width: 56.0,
//                 height: 60.0,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

