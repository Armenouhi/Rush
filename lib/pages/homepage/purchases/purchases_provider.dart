import 'package:exam_at/models/purchases.dart';
import 'package:flutter/material.dart';

import '../../../api/project_api.dart';
import '../../../styles/style_of_container.dart';

class PurchasesProvider extends ChangeNotifier {
  PurchasesModel? purchasesModel;
  List<PurchasesModel>? purchases;
  bool isLoading = false;
  List<Color> colors = [];

  ContainerColors colorsContainer = ContainerColors();

  PurchasesProvider() {
    getData();
    changeColors();
  }

  void getData({bool initial = true}) async {
    isLoading = true;
    if (!initial) notifyListeners();

    final result = await ProjectAPI().purchasesApi.getPurchasesData();

    if (result.isEmpty) {
    } else {
      isLoading = false;
      purchases = result;

      notifyListeners();
    }

    notifyListeners();
  }

  void changeColors() {
    colors = colorsContainer.colors;
    notifyListeners();
  }
}
