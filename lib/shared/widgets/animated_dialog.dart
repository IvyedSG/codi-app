import 'package:flutter/material.dart';


Future<T?> showAnimatedDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Color? barrierColor,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
}) {
  // Simplemente usar showDialog regular sin animaciones
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    barrierColor: barrierColor,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    builder: (context) {
      Widget dialog = builder(context);
      
      if (useSafeArea) {
        dialog = SafeArea(child: dialog);
      }
      
      return dialog;
    },
  );
}