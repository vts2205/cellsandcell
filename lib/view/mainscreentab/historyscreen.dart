import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/view/historyscreentab/recievedscreen.dart';
import 'package:cellsandcell/view/historyscreentab/sendscreen.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildTabBar(),
        body: buildTabBarView(),
      ),
    );
  }

  buildTabBar() {
    return TabBar(
        labelColor: purple,
        labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        indicatorColor: purple,
        indicatorWeight: 5,
        unselectedLabelColor: Colors.black54,
        unselectedLabelStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        tabs: const [Tab(text: 'Send'), Tab(text: 'Received')]);
  }

  buildTabBarView() {
    return TabBarView(children: [SendScreen(), ReceivedScreen()]);
  }
}
