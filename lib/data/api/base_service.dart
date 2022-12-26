import 'package:flutter_boilerplate_mvvm/data/api/api_response.dart';

abstract class BaseService {
  final String BASE_URL = "http://demo1201562.mockable.io/";

  Future<dynamic> getAuthentication(String endpoint);
}
