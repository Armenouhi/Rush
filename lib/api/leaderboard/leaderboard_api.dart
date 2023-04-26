import 'package:dio/dio.dart';
import 'package:exam_at/models/leaderboard.dart';

class LeaderbordApi {
  final Dio appDioClient;

  LeaderbordApi(
    this.appDioClient,
  );

  Future<List<LeaderbordModel>> getLeaderBoardData() async {
    List<LeaderbordModel> leaderBordList = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/leaderboard',
    );

    print(result.runtimeType);

     if (result.data is List) {
      leaderBordList = result.data
          .map<LeaderbordModel>(
            (e) => LeaderbordModel.fromJson(e),
          )
          .toList();
    }

    return leaderBordList;
  }
}
