import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/constants/commonfunction.dart';
import 'package:cellsandcell/controller/qrgeneratecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeMoney extends StatefulWidget {
  final String paytoken;
  const ExchangeMoney({Key? key, required this.paytoken}) : super(key: key);

  @override
  State<ExchangeMoney> createState() => _ExchangeMoneyState();
}

class _ExchangeMoneyState extends State<ExchangeMoney> {
  TextEditingController amountcontroller = TextEditingController();
  var qrcontroler = Get.find<QRGenerateController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pale,
      appBar: buildAppBar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
                top: 150, left: 20, right: 20, bottom: 40),
            child: buildTextField(),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: purple),
              onPressed: () {
                if (amountcontroller.text.trim() != '') {
                  print(' widget.paytoken.....');
                  print(widget.paytoken);
                  qrcontroler.payrQR(
                      widget.paytoken, amountcontroller.text.trim());
                } else {
                  commonfunction.toast('Please Enter Ammount', Colors.red);
                }
              },
              child: const Text(
                'PAY',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: purple),
      backgroundColor: Colors.white,
      title: const Text(
        'Amount',
        style:
            TextStyle(fontSize: 20, color: purple, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  buildTextField() {
    return TextField(
      style: const TextStyle(color: Colors.black, fontSize: 20),
      keyboardType: TextInputType.number,
      controller: amountcontroller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        // prefixIcon: const Icon(
        //   Icons.search,
        //   color: Colors.black,
        //   size: 30,
        // ),
        fillColor: Colors.grey.shade100,
        filled: true,
        hintText: "Enter a amount",
        hintStyle: const TextStyle(fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
