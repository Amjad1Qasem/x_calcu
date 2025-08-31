// main
class UrlApi {
  // auth & boarding
  static String baseUrl = 'https://api.x-secure.gmbh/api';

  static String login = '/auth/login';
  static String logout = '/auth/logout';

  static String systemSetting = '/system-setting';
  static String infoUser = '/auth/user';
  static String getPartnerts = '/getPartnerts';
  static String getPartner(id) => '/getPartner/$id';

  /// Operations
  static String addOperation = '/operation';

  static String allOperations = '/operations';

  /// Partner
  static String addPartner = '/partner';
  static String partnersFilter = '/partners?operationType=input&page=1';
}
