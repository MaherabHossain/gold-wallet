// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:myapp/screens/HomePage.dart';
import 'package:myapp/services/transaction_remote_services.dart';
import 'package:myapp/utilities/showToastMessage.dart';

class TransactionController extends GetxController {
  var isLoading = false.obs;
  var balance;
  transaction(transactionData) async {
    // isLoading.value = true;
    var response = await TransactionRemoteServices.trnsaction(transactionData);
    showToastMessage(response['message']);
    Get.to(HomePage());
    print("LOG::from Trnsaction Contoller!");
    print(response);
    // isLoading.value = false;
  }

  checkBalance() async {
    isLoading.value = true;
    var response = await TransactionRemoteServices.checkBalance();
    isLoading.value = false;
    return response;
  }
}
