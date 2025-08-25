import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/global/data/url_api.dart';
import 'package:x_calcu/global/networking/dio_helper.dart';
import 'package:x_calcu/global/networking/result_freezed.dart';

class OperationsRepo {
  //* Get Partners for User */

  Future<Result<List<DropDownModel>>> getCvFieldssData() async {
    final response = await DioHelper.getAllModel(
      url: UrlApi.getPartnerts,
      fromJson: DropDownModel.fromJson,
    );
    return response;
  }

  // Future<Result<bool>> createOperation(OperationModel model) async {
  //   return await DioHelper.postModel('/operations', model.toJson());
  // }

  Future<Result<OperationModel>> createOperation({
    required OperationModel data,
  }) async {
    return await DioHelper.postModel<OperationModel>(
      UrlApi.login,
      data,
      fromJson: OperationModel.fromJson,
    );
  }
}
