import 'package:demo/model.dart';
import 'package:demo/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class HiveViewModel extends ChangeNotifier {
  final myRepo = AuthRepository();
  HiveModel? hiveModel;
  bool isLoading = false;

  hiveApi(BuildContext context) async {
    loading(true);

    try {
      var value = await myRepo.hiveListData();
      if (value?.result != null && value?.result != []) {
        hiveModel = value;
        loading(false);
      }
    } catch (error) {
      print("Error: $error");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  loading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
