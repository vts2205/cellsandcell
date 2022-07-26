import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/controller/walletamountcontroller.dart';
import 'package:cellsandcell/model/profileview.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:cellsandcell/view/loginscreen.dart';
import 'package:cellsandcell/view/mainscreentab/historyscreen.dart';
import 'package:cellsandcell/view/mainscreentab/homescreen.dart';
import 'package:cellsandcell/view/mainscreentab/profilescreen.dart';
import 'package:cellsandcell/view/mainscreentab/storescreen.dart';
import 'package:cellsandcell/view/notificationscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'mainscreentab/addscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  final screens = [
    HomeScreen(),
    StoreScreen(),
    AddScreen(),
    const ProfileScreen(),
    HistoryScreen()
  ];

  final box = GetStorage();
  var controller = Get.put(WalletController());

  ProfileModel? profileModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    profileModel = (await APIService().FetchProfile());
    if (profileModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: screens[index],
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: CircleAvatar(
          child: Image.asset('assets/images/profile.png'),
        ),
      ),
      leadingWidth: 50,
      title: isLoading == false
          ? Container()
          : Text(
              '${profileModel?.name}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: purple),
            ),
      actions: [
        Obx(() {
          return Center(
            child: isLoading == false
                ? Container()
                : Text(
                    '\u{20B9} ${controller.WalletInfo[0].walletAmount}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: purple),
                  ),
          );
        }),
        IconButton(
            onPressed: () {
              Get.to(const NotificationScreen());
            },
            visualDensity:
                const VisualDensity(horizontal: -4.0, vertical: -4.0),
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.notifications,
              color: purple,
            )),
        IconButton(
            onPressed: () {
              buildAlertBox();
            },
            visualDensity:
                const VisualDensity(horizontal: -4.0, vertical: -4.0),
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.logout,
              color: purple,
            )),
      ],
    );
  }

  buildAlertBox() {
    return Get.defaultDialog(
      title: 'Are your sure you want to exit ?',
      middleText: '',
      radius: 5,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.all(10)),
              onPressed: () {
                box.remove("token");
                box.write('isLogged', false);
                APIService().SignOut();
                Get.offAll(LoginScreen());
              },
              child: Text(
                'Yes',
                style: TextStyle(color: purple, fontSize: 20),
              )),
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('No', style: TextStyle(color: purple, fontSize: 20))),
        ],
      ),
    );
  }

  buildBottomNavigationBar() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: purple.withOpacity(0.2),
          labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
      child: NavigationBar(
          height: 70,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
                this.index = index;
              }),
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.store), label: 'Store'),
            NavigationDestination(
                icon: IconButton(
                  visualDensity:
                      const VisualDensity(horizontal: -4.0, vertical: -4.0),
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    openWhatsappChat();
                  },
                  icon: Icon(
                    Icons.whatsapp,
                    color: Color(0xff25D366),
                  ),
                ),
                label: 'Whatsapp'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
            NavigationDestination(icon: Icon(Icons.history), label: 'History')
          ]),
    );
  }

  void openWhatsappChat() async {
    var url = 'https://wa.me/+919087953000';
    await launch(url);
  }
}
