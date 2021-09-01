import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ShowToast on Widget {
  showToast(BuildContext context, {required String message}) {
    final toast = FToast().init(context);

    final reverseAccentColor = Theme.of(context).backgroundColor;
    final reverseBackgroundColor =
        Theme.of(context).accentColor.withAlpha(200); // (200/255)の割合
    final widget = Container(
      width: MediaQuery.of(context).size.width,
      color: reverseBackgroundColor,
      child: TextButton(
        child: Text(message,
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: reverseAccentColor)),
        onPressed: () {
          hideToast(context);
        },
      ),
    );
    toast.showToast(
        child: widget,
        toastDuration: Duration(seconds: 3),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            bottom: MediaQuery.of(context).padding.bottom, // SafeAreaの最下部
            left: 0,
            right: 0,
          );
        });
  }

  hideToast(BuildContext context) {
    final toast = FToast().init(context);
    toast.removeCustomToast();
  }
}
