import 'package:dio/dio.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../model.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<HiveModel?> hiveListData() async {
    try {
      Response response = await NetworkApiServices()
          .getPostApiResponse(url: "https://api.hive.blog/", data: {
        "id": 1,
        "jsonrpc": "2.0",
        "method": "bridge.get_ranked_posts",
        "params": {"sort": "trending", "tag": "", "observer": "hive.blog"}
      });
      return HiveModel.fromJson(response.data);
    } catch (error) {
      error;
    }
    return null;
  }
}
