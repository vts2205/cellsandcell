import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/model/details_by_phone_model.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumberScreen> {
  TextEditingController numberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  // var controller = Get.put(DetailsByPhoneController());

  GetDetailsByPhoneModel? getDetailsByPhoneModel;

  // var isLoading = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }
  //
  // getData() async {
  //   getDetailsByPhoneModel =
  //       (await APIService().getDetails(numberController.text));
  //   if (getDetailsByPhoneModel != null) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pale,
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  buildBody() {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(top: 70, left: 10, right: 10, bottom: 20),
          child: buildTextField(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //     style: ElevatedButton.styleFrom(primary: purple),
            //     onPressed: () async {
            //       var data =
            //           await APIService().getDetails(numberController.text);
            //       if (data!.status != null) {
            //         buildGetDetails();
            //       }
            //     },
            //     child: const Text(
            //       'Get Details',
            //       style: TextStyle(fontSize: 20),
            //     )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: purple),
                onPressed: () async {
                  var data = await APIService()
                      .payByPhone(numberController.text, amountController.text);
                  if (data["status"] == 1) {
                    print('Success');
                    Fluttertoast.showToast(
                        msg: 'Amount Transferred Successfully');
                  } else {
                    print('Failed');
                    Fluttertoast.showToast(msg: 'Amount Transaction Failed');
                  }
                },
                child: const Text(
                  'CHECK',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
        const SizedBox(height: 30),
        // buildGetDetails()
      ],
    );
  }

  buildTextField() {
    return Column(
      children: [
        TextField(
          style: const TextStyle(color: Colors.black, fontSize: 20),
          keyboardType: TextInputType.number,
          controller: numberController,
          cursorColor: purple,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: "Enter a Phone Number",
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
        ),
        const SizedBox(height: 20),
        TextField(
          style: const TextStyle(color: Colors.black, fontSize: 20),
          keyboardType: TextInputType.number,
          controller: amountController,
          cursorColor: purple,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: "Enter amount",
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
        ),
      ],
    );
  }

  buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: purple),
      backgroundColor: Colors.white,
      title: const Text(
        'Send Money',
        style:
            TextStyle(fontSize: 20, color: purple, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  buildGetDetails() {
    return Column(
      children: [
        Row(
          children: [
            Text('Name'),
            Text('${getDetailsByPhoneModel?.data?.name}')
          ],
        ),
        Row(
          children: [
            Text('Phone Number'),
            Text('${getDetailsByPhoneModel?.data?.phone}')
          ],
        ),
        Row(
          children: [
            Text('Address'),
            Text('${getDetailsByPhoneModel?.data?.address}')
          ],
        )
      ],
    );
  }
}
