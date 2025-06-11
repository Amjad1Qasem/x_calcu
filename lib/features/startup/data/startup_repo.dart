

import 'package:x_calcu/features/startup/data/boarding_model.dart';
import 'package:x_calcu/features/startup/data/system_setting_model.dart';
import 'package:x_calcu/global/data/auth_model.dart';
import 'package:x_calcu/global/data/url_api.dart';
import 'package:x_calcu/global/networking/dio_helper.dart';
import 'package:x_calcu/global/networking/result_freezed.dart';

class StartUpRepo {
  // Future<Result<List<Boarding>>> getBoardingData() async {
  //   return await DioHelper.getAllModel<Boarding>(
  //     url: UrlApi.boarding,
  //     fromJson: Boarding.fromJson,
  //   );
  // }

  Future<Result<AuthModel>> getInfoData() async {
    final response = await DioHelper.getModel(
      UrlApi.infoUser,
      AuthModel.fromJson,
    );
    return response;
  }

  // Future<Result<List<CountryModel>>> getCountriesData() async {
  //   final response = await DioHelper.getAllModel(
  //     url: UrlApi.countries,
  //     fromJson: CountryModel.fromJson,
  //   );
  //   return response;
  // }

  // Future<Result<List<GovernoratesModel>>> getGovernoratesData(
  //     {required int countryId}) async {
  //   final response = await DioHelper.getAllModel(
  //     url: UrlApi.getGovernorates(countryId),
  //     fromJson: GovernoratesModel.fromJson,
  //   );
  //   return response;
  // }

  Future<Result<SystemSettingModel>> getSystemSettings() async {
    final response = await DioHelper.getModel(
      UrlApi.systemSetting,
      SystemSettingModel.fromJson,
    );
    return response;
  }
}
