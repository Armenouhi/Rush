import 'package:exam_at/api/project_api.dart';
import 'package:exam_at/models/leaderboard.dart';
import 'package:flutter/material.dart';

import '../styles/style_of_container.dart';

class LeaderBoarderProvider extends ChangeNotifier {
  bool isLoading = true;
  List<LeaderbordModel> list = [];
  List<Color> colors = [];

  ContainerColors colorsContainer = ContainerColors();

  LeaderBoarderProvider() {
    getData();
    changeColors();
  }

  void getData({bool initial = true}) async {
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await ProjectAPI().leaderbordApi.getLeaderBoardData();

    if (result.isEmpty) {
    } else {
      isLoading = false;
      list = result;

      notifyListeners();
    }

    notifyListeners();
  }

  void changeColors() {
    colors = colorsContainer.colors;
    notifyListeners();
  }
}
