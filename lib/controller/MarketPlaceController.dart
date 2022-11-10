import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/screens/HomePage.dart';
import 'package:myapp/screens/MarketPlaceScreen.dart';
import 'package:myapp/services/marketplace_remote_services.dart';
import 'package:myapp/utilities/showToastMessage.dart';

class MarketPlaceController extends GetxController {
  var isLoading = false.obs;
  var sellList = [].obs;
  var buyList = [].obs;
  // newsList.value = response['data'];

  sellGold(info, context) async {
    isLoading.value = true;
    var response = await MarketPlaceRemoteServices.sellGold(info);
    if (response['status']) {
      showToastMessage("Sale Added successfully!");
      Navigator.of(context).pop();
      Get.to(HomePage());
    } else {
      showToastMessage("Something went wrong! try again");
      Navigator.of(context).pop();
    }
    isLoading.value = false;
  }

  getSellList() async {}

  getBuyList() async {
    isLoading.value = true;
    var response = await MarketPlaceRemoteServices.getBuyList();

    if (response['status']) {
      buyList.value = response['data'];
    } else {
      showToastMessage("Something went wrong!");
    }
    isLoading.value = false;
  }

  buyGold(id) async {}

  deleteSell(id) {}
}
