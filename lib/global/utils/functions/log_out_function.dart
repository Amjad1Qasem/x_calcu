
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:x_calcu/global/core/app_state.dart';
import 'package:x_calcu/global/utils/di/dependency_injection.dart';

void logOutFunction(BuildContext context) async {
  await getIt<AppStateModel>().logout();
  context.pushReplacement('/login');
}
