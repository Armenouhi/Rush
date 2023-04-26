import 'package:dio/dio.dart';
import 'package:exam_at/models/purchases.dart';

class PurchasesApi {
  final Dio appDioClient;

  PurchasesApi(
    this.appDioClient,
  );

  Future<List<PurchasesModel>> getPurchasesData() async { 
    List<PurchasesModel> purchasesData = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/purchases',
    );

    if (result.data is List) {
      purchasesData = result.data.first
          .map<PurchasesModel>(
            (e) => PurchasesModel.fromJson(e),
          )
          .toList();
    }
    return purchasesData;
  }
}
