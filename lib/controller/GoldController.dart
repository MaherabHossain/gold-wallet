import 'package:get/get.dart';
import 'package:myapp/screens/HomePage.dart';
import 'package:myapp/services/gold_remote_services.dart';
import 'package:myapp/utilities/showToastMessage.dart';

class GoldController extends GetxController {
  var isLoading = false.obs;
  var goldPrice = [].obs;
  getGoldPrice() async {
    isLoading.value = true;
    var response = await GoldRemoteServices.getGoldPrice();
    if (response['status']) {
      goldPrice.value = response['data'];
    } else {
      showToastMessage("something went wrong! try again");
    }
    isLoading.value = false;
  }

  buySellGold(data) async {
    isLoading.value = true;
    var response = await GoldRemoteServices.buySellGold(data);
    if (response['status']) {
      showToastMessage(response['message']);
      Get.to(HomePage(
        buySellGold: true,
      ));
    } else {
      showToastMessage(response['message']);
    }
    isLoading.value = false;
  }
}
