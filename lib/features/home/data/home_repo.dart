import 'package:x_calcu/features/operations/data/operations_model.dart';
import 'package:x_calcu/global/data/url_api.dart';
import 'package:x_calcu/global/networking/dio_helper.dart';
import 'package:x_calcu/global/networking/result_freezed.dart';

class HomeRepo {
  Future<Result<List<OperationModel>>> getOperationsData({
    String operationType = 'input',
    String orderBy = 'asc',
  }) async {
    return await DioHelper.getAllModel<OperationModel>(
      url: UrlApi.allOperations,
      fromJson: OperationModel.fromJson,
      query: {'operationType': operationType, 'orderBy': orderBy},
    );
  }

  Future<Result<List<OperationModel>>> getOperationsDataWithFilter({
    String? operationType,
    String? orderBy,
    String? search,
    DateTime? startDate,
    DateTime? endDate,
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
    if (startDate != null) {
      queryParams['start_date'] = startDate.toIso8601String().split('T')[0];
    }
    if (endDate != null) {
      queryParams['end_date'] = endDate.toIso8601String().split('T')[0];
    }
    if (page != null) {
      queryParams['page'] = page;
    }
    if (limit != null) {
      queryParams['limit'] = limit;
    }

    return await DioHelper.getAllModel<OperationModel>(
      url: UrlApi.allOperations,
      fromJson: OperationModel.fromJson,
      query: queryParams,
    );
  }
}
