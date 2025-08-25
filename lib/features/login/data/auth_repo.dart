import 'package:x_calcu/global/data/auth_model.dart';
import 'package:x_calcu/global/data/url_api.dart';
import 'package:x_calcu/global/networking/dio_helper.dart';
import 'package:x_calcu/global/networking/result_freezed.dart';

class AuthRepository {
  /// **Login User**
  Future<Result<AuthModel>> loginRepo({required String email,required String password,}) async {
    return await DioHelper.postModel<AuthModel>(
      UrlApi.login,
      AuthModel(username: email, password: password),
      fromJson: AuthModel.fromJson,
    );
  }
}
