import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/controller/profilecontroller.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:cellsandcell/view/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final username = TextEditingController();
  final password = TextEditingController();
  final box = GetStorage();
  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [purple, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text('SIGNIN',
                      style: TextStyle(
                          fontSize: 25,
                          color: purple,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: username,
                    onSaved: (value) {},
                    cursorColor: purple,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Enter Phone Number",
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
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: password,
                    onSaved: (value) {},
                    cursorColor: purple,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Enter PIN",
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
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: purple),
                      onPressed: () async {
                        var data = await APIService()
                            .getUserLogin(username.text, password.text);
                        if (data["status"] == 1) {
                          box.write("token", data["token"]);
                          box.write("password", password.text.trim());
                          box.write('isLogged', true);
                          Fluttertoast.showToast(msg: 'Logged In Successfully');
                          Get.offAll(const MainScreen());
                        } else {
                          print("false...");
                          Fluttertoast.showToast(msg: data["message"]);
                        }
                      },
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: const Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
