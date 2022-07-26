import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/controller/walletamountcontroller.dart';
import 'package:cellsandcell/model/wallet_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/APIService.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  var controller = Get.put(WalletController());

  WalletHistoryListModel? walletHistoryListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    walletHistoryListModel = (await APIService().walletHistoryList())!;
    if (walletHistoryListModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pale, appBar: buildAppBar(), body: buildBody());
  }

  buildBody() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Total Wallet Amount',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              //'Rs 100',
              'Rs ${controller.WalletInfo[0].walletAmount}',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            buildListView()
          ],
        ),
      );
    });
  }

  buildListView() {
    return isLoading == false
        ? Center(
            child: CircularProgressIndicator(
              color: purple,
            ),
          )
        : Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ListView.builder(
                itemCount: walletHistoryListModel?.data?.transactions?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            '${walletHistoryListModel?.data?.transactions?[index].details}'),
                        subtitle: Text(
                            '${walletHistoryListModel?.data?.transactions?[index].createdAt?.toLocal()}'),
                        trailing: Text(
                          '${walletHistoryListModel?.data?.transactions?[index].amount}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          );
  }

  buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: purple),
      backgroundColor: Colors.white,
      title: const Text(
        'Wallet',
        style:
            TextStyle(fontSize: 20, color: purple, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
