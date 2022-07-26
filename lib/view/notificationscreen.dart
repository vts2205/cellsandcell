import 'package:cellsandcell/model/notification.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationListModel? notificationListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    notificationListModel = (await APIService().notificationList())!;
    if (notificationListModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pale,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: purple),
        backgroundColor: Colors.white,
        title: const Text(
          'Notifications',
          style: TextStyle(
              fontSize: 20, color: purple, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoading == false
          ? Center(
              child: CircularProgressIndicator(
                color: purple,
              ),
            )
          : Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ListView.builder(
                itemCount: notificationListModel?.data?.notifications?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            '${notificationListModel?.data?.notifications?[index].title}'),
                        subtitle: Text(
                            '${notificationListModel?.data?.notifications?[index].text}'),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
