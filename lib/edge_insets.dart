import 'package:flutter/cupertino.dart';

class EdgeInsetsApp extends EdgeInsetsDirectional {
  const EdgeInsetsApp({
    double? all,
    double? vertical,
    double? horizontal,
    double? start,
    double? top,
    double? end,
    double? bottom
  }) : super.only(
      start: (start ?? (horizontal ?? (all ?? 0))) >= 0
                ? start ?? (horizontal ?? (all ?? 0))
                : 0,
      end: (end ?? (horizontal ?? (all ?? 0))) >= 0
          ? end ?? (horizontal ?? (all ?? 0))
          : 0,
      top: (top ?? (vertical ?? (all ?? 0))) >= 0
          ? top ?? (vertical ?? (all ?? 0))
          : 0,
      bottom: (bottom ?? (vertical ?? (all ?? 0))) >= 0
          ? bottom ?? (vertical ?? (all ?? 0))
          : 0
  );
}