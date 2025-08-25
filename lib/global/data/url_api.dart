// main
class UrlApi {
  // auth & boarding
  static String baseUrl = 'https://api.x-secure.gmbh/api';

  static String login = '/auth/login';

  static String systemSetting = '/system-setting';
  static String infoUser = '/user-info';
  static String getPartnerts = '/getPartnerts';
  static String getPartner(id) => '/getPartner/$id';
  static String addPartner = '/Partner';
}
