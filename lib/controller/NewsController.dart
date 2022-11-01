import 'package:get/get.dart';
import 'package:myapp/services/news_remote_services.dart';

class NewsController extends GetxController {
  var isLoading = false.obs;
  var newsList = [].obs;
  getNews() async {
    isLoading.value = true;
    var response = await NewsRemoteServices.getNews();
    if (response['status']) {
      newsList.value = response['data'];
      print("LOG:: from news controller!");
      print(newsList);
    }
    isLoading.value = false;
  }
}
