import 'dart:async';

import 'package:rxdart/rxdart.dart';

mixin AppStreamSubscription {
  final compositeSubscription = CompositeSubscription();
  
  StreamSubscription<T> streamSubscription<T>({
    required Stream<T> stream,
    required void Function(T data) onData,
    void Function(bool success)? onDone,
    Exception? Function(Exception exception)? onError,
    void Function()? onShowLoading,
    void Function()? onHideLoading,
  }) {
    return compositeSubscription.add(
      DeferStream(() {
        if(onShowLoading != null) onShowLoading();
        return stream;
      }).listen(
        onData,
        onDone: () {
          if (onHideLoading != null) onHideLoading();
          if (onDone != null) onDone(true);
        },
        onError: (e) {
          if (onHideLoading != null) onHideLoading();
          if (onError != null) {
            onError(e);
          } else {
            // showExceptionBuilder(e);
            return e;
          }
          if (onDone != null) onDone(false);
        }
      )
    );
  }
  
  void disposeSubscription() => compositeSubscription.dispose();
  
  void clearSubscription() => compositeSubscription.clear();
}