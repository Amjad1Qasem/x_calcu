import 'package:x_calcu/features/partners/data/models/partner_model.dart';
import 'package:x_calcu/features/partners/data/models/statistics_model.dart';
import 'package:x_calcu/features/partners/data/models/partner_details_model.dart';
import 'package:x_calcu/global/data/url_api.dart';
import 'package:x_calcu/global/networking/dio_helper.dart';
import 'package:x_calcu/global/networking/result_freezed.dart';

class PartnerRepo {
  // Future<Result<PartnerModel>> getPartnerDetailsData({required int id}) async {
  //   return await DioHelper.getModel<PartnerModel>(
  //     UrlApi.getPartner(id),
  //     PartnerModel.fromJson,
  //   );
  // }

  Future<Result<StatisticModel>> getStatistic({
    required String operationType,
    // required int parentId,
  }) async {
    final queryParams = <String, dynamic>{'operationType': operationType};

    return await DioHelper.getModel<StatisticModel>(
      UrlApi.statistic,
      StatisticModel.fromJson,
      qurey: queryParams,
    );
  }

  Future<Result<List<PartnerModel>>> getPartnersDataWithFilter({
    String? operationType,
    String? orderBy,
    int? page,
    int? limit,
  }) async {
    final queryParams = <String, dynamic>{};

    // Add required parameters with defaults
    queryParams['operationType'] = operationType ?? 'input';
    queryParams['orderBy'] = orderBy ?? 'asc';

    if (page != null) {
      queryParams['page'] = page;
    }
    if (limit != null) {
      queryParams['limit'] = limit;
    }

    return await DioHelper.getAllModel<PartnerModel>(
      url: UrlApi.getPartnerts,
      fromJson: PartnerModel.fromJson,
      query: queryParams,
    );
  }

  Future<Result<PartnerModel>> addPartner({required PartnerModel data}) async {
    return await DioHelper.postModel<PartnerModel>(
      UrlApi.addPartner,
      obj: data.toJson(),
      fromJson: PartnerModel.fromJson,
    );
  }

  Future<Result<PartnerModel>> updatePartner({
    required int id,
    required PartnerModel data,
  }) async {
    return await DioHelper.postModel<PartnerModel>(
      UrlApi.updatePartner(id),
      obj: data.toJson(),
      fromJson: PartnerModel.fromJson,
    );
  }

  Future<Result<bool>> deletePartner({required int id}) async {
    return await DioHelper.deleteModel(
      url: UrlApi.deletePartner(id),
      body: {}, // Empty body for DELETE request
    );
  }

  Future<Result<PartnerDetailsData>> getPartnerDetailsWithOperations({
    required int id,
    required String operationType,
    String? orderBy,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final queryParams = <String, dynamic>{};

    // Add optional parameters
    if (orderBy != null) {
      queryParams['orderBy'] = orderBy;
    }
    if (startDate != null) {
      queryParams['start_date'] = startDate.toIso8601String().split('T')[0];
    }
    if (endDate != null) {
      queryParams['end_date'] = endDate.toIso8601String().split('T')[0];
    }

    print(
      '📡 PartnerRepo: getPartnerDetailsWithOperations called with queryParams: $queryParams',
    );

    return await DioHelper.getModel<PartnerDetailsData>(
      UrlApi.getPartnerDetails(id, operationType),
      PartnerDetailsData.fromJson,
      qurey: queryParams,
    );
  }

  Future<Result<List<PartnerDetailsOperation>>> getPartnerOperations({
    required int id,
    required String operationType,
    required int page,
    String orderBy = 'asc',
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final queryParams = <String, dynamic>{
      'operationType': operationType,
      'page': page,
      'perPage': 6,
      'orderBy': orderBy,
    };

    // Add optional date parameters
    if (startDate != null) {
      queryParams['start_date'] = startDate.toIso8601String().split('T')[0];
    }
    if (endDate != null) {
      queryParams['end_date'] = endDate.toIso8601String().split('T')[0];
    }

    print(
      '📡 PartnerRepo: getPartnerOperations called with queryParams: $queryParams',
    );

    return await DioHelper.getAllModel<PartnerDetailsOperation>(
      url: '/partners/$id/operations',
      fromJson: PartnerDetailsOperation.fromJson,
      query: queryParams,
    );
  }
}
