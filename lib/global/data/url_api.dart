// main
class UrlApi {
  // auth & boarding
  static String baseUrl = 'https://api.x-secure.gmbh/api';

  static String login = '/auth/login';
  static String logout = '/auth/logout';

  static String systemSetting = '/system-setting';
  static String infoUser = '/auth/user';
  static String getPartner(id) => '/getPartner/$id';

  /// Operations
  static String addOperation = '/operations';
  static String operationsDetails(operationId) => '/operations/$operationId';
  static String editOperations(operationId) => '/operations/$operationId';

  static String allOperations = '/operations';

  /// Partner
  static String getPartnerts = '/partners';
  static String addPartner = '/partners';
  static String partnersFilter = '/partners?operationType=input&page=1';
  static String statistic = '/statistic';
  static String getPartnersDropdown = '/partners-select';
}
