import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ShowToast on Widget {
  showToast(BuildContext context, {required String message}) {
    final toast = FToast().init(context);
    toast.showToast(child: Text(message), toastDuration: Duration(seconds: 1));
  }

  hideToast(BuildContext context) {
    final toast = FToast().init(context);
    toast.removeCustomToast();
  }
}
