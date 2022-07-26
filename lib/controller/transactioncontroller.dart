import 'package:cellsandcell/model/transactions.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:get/get.dart';

class TransactionsController extends GetxController {
  var TransactionsInfo = <Transactions>[].obs;
  var isLoading = true.obs;
  var receiveList = <Transactions>[];
  var sendList = <Transactions>[];

  @override
  void onInit() async {
    FetchTransactionInfo();
    super.onInit();
  }

  void FetchTransactionInfo() async {
    try {
      isLoading(true);
      var transactionsInfo = await APIService().fetchTransactions();
      if (transactionsInfo != null) {
        // TransactionsInfo.assign(transactionsInfo.data!.transactions!);
        TransactionsInfo.value = transactionsInfo.data!.transactions!;

        for (var element in TransactionsInfo.value) {
          if (element.status == 'Recieved') {
            receiveList.add(element);
          } else {
            sendList.add(element);
          }
        }
        print(receiveList.toString());
      }
      return null;
    } finally {
      isLoading(false);
    }
  }
}
