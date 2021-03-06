import 'dart:async';
import 'package:cool_alert/cool_alert.dart';
import 'package:fuodz/services/app.service.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:velocity_x/velocity_x.dart';

class AlertService {
  //

  static Future<bool> showConfirm({
    String title,
    String text,
    String cancelBtnText = "Cancel",
    String confirmBtnText = "Ok",
  }) async {
    //
    bool result = false;

    await CoolAlert.show(
        context: AppService().navigatorKey.currentContext,
        type: CoolAlertType.confirm,
        title: title,
        text: text,
        cancelBtnText: cancelBtnText.tr(),
        confirmBtnText: confirmBtnText.tr(),
        onConfirmBtnTap: () {
          result = true;
          AppService().navigatorKey.currentContext.pop();
        });

    //
    return result;
  }

  static void showLoading() {
    CoolAlert.show(
      context: AppService().navigatorKey.currentContext,
      type: CoolAlertType.loading,
      title: "".tr(),
      text: "Processing. Please wait...".tr(),
      barrierDismissible: false,
    );
  }

  static void stopLoading() {
    AppService().navigatorKey.currentContext.pop();
  }
}
