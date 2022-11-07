import 'package:get/get.dart';
import 'package:myapp/services/marketplace_remote_services.dart';
import 'package:myapp/utilities/showToastMessage.dart';

class MarketPlaceController extends GetxController {
  var isLoading = false.obs;
  var sellList = [].obs;
  var buyList = [].obs;
  // newsList.value = response['data'];

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
