import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/features/operations/data/operation_request_model.dart';
import 'package:x_calcu/global/data/url_api.dart';
import 'package:x_calcu/global/networking/dio_helper.dart';
import 'package:x_calcu/global/networking/result_freezed.dart';

class OperationsRepo {
  //* Get Partners for User */

  Future<Result<List<DropDownModel>>> getPartnersDropdown() async {
    final response = await DioHelper.getAllModel(
      url: UrlApi.partnersFilter,
      fromJson: DropDownModel.fromJson,
    );
    return response;
  }

  //* Get Operations Data */
  Future<Result<List<OperationModel>>> getOperationsData({
    String operationType = 'input',
    String orderBy = 'asc',
  }) async {
    final response = await DioHelper.getAllModel<OperationModel>(
      url: UrlApi.allOperations,
      fromJson: OperationModel.fromJson,
      query: {'operationType': operationType, 'orderBy': orderBy},
    );
    return response;
  }

  //* Create Operation */
  Future<Result<OperationModel>> createOperation({
    required OperationRequestModel data,
  }) async {
    return await DioHelper.postModel<OperationModel>(
      UrlApi.addOperation,
      obj: data,
      fromJson: OperationModel.fromJson,
    );
  }

  //* Update Operation */
  Future<Result<OperationModel>> updateOperation({
    required int operationId,
    required OperationRequestModel data,
  }) async {
    return await DioHelper.postModel<OperationModel>(
      UrlApi.editOperations(operationId),
      obj: data,
      fromJson: OperationModel.fromJson,
    );
  }

  //* Get Operation Details */
  Future<Result<OperationModel>> getOperationDetails({
    required int operationId,
  }) async {
    return await DioHelper.getModel<OperationModel>(
      UrlApi.operationsDetails(operationId),
      OperationModel.fromJson,
    );
  }

  //* Get Operations Data with Filtering */
  Future<Result<List<OperationModel>>> getOperationsDataWithFilter({
    String? operationType,
    String? orderBy,
    String? search,
    int? page,
    int? limit,
  }) async {
    final queryParams = <String, dynamic>{};

    // Add required parameters with defaults
    queryParams['operationType'] = operationType ?? 'input';
    queryParams['orderBy'] = orderBy ?? 'asc';

    // Add optional parameters
    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }
    if (page != null) {
      queryParams['page'] = page;
    }
    if (limit != null) {
      queryParams['limit'] = limit;
    }

    final response = await DioHelper.getAllModel<OperationModel>(
      url: UrlApi.allOperations,
      fromJson: OperationModel.fromJson,
      query: queryParams,
    );
    return response;
  }
}
