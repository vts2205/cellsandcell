import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/controller/transactioncontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReceivedScreen extends GetView<TransactionsController> {
  ReceivedScreen({Key? key}) : super(key: key);

  final controller = Get.put(TransactionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: pale, body: buildBody());
  }

  buildBody() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.black,
        ));
      } else if (controller.TransactionsInfo.isEmpty) {
        return const Center(child: Text("No records found"));
      }
      return buildTransactionInfo();
    });
  }

  buildTransactionInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: controller.receiveList.length,
        itemBuilder: (context, index) {
          var data = controller.receiveList[index];
          var touser = 'N/A';
          var fromuser = 'N/A';
          var date;

          if (data.to != '') {
            touser = data.to!;
          }
          if (data.from != '') {
            fromuser = data.from!;
          }
          if (data.date != '') {
            date = dateformat(data.date);
          }

          return Column(
            children: <Widget>[
              ListTile(
                title: Text('$fromuser to $touser '),
                subtitle: Text(
                  ' Amount-${data.amount!}\n Date-$date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text('${data.status}'),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }

  String dateformat(dataformat) {
    var afterdateformat = '';
    var date = DateTime.parse(dataformat);

    var days = DateFormat('EEEE').format(date);
    var months = month(date.month);

    afterdateformat = date.day.toString() +
        '- ' +
        months +
        "-" +
        date.year.toString() +
        " -" +
        date.hour.toString() +
        ':' +
        date.minute.toString();
    return afterdateformat;
  }

  String month(index) {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'April',
      'May',
      'June',
      'July',
      'August',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    var daaats;
    daaats = months[index - 1];

    return daaats;
  }
}
