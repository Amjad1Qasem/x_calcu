import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/global/data/url_api.dart';
import 'package:x_calcu/global/networking/dio_helper.dart';
import 'package:x_calcu/global/networking/result_freezed.dart';

class PartnerRepo {
  Future<Result<PartnerModel>> getPartnerDetailsData({required int id}) async {
    return await DioHelper.getModel<PartnerModel>(
      UrlApi.getPartner(id),
      PartnerModel.fromJson,
    );
  }

  Future<Result<List<PartnerModel>>> getPartnersData() async {
    return await DioHelper.getAllModel<PartnerModel>(
      url: UrlApi.getPartnerts,
      fromJson: PartnerModel.fromJson,
    );
  }

  Future<Result<PartnerModel>> addPartner({required PartnerModel data}) async {
    return await DioHelper.postModel<PartnerModel>(
      UrlApi.addPartner,
      PartnerModel.fromJson,
    );
  }
}
