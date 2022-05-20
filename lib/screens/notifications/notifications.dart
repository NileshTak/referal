import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:referal/screens/home/widget/notification_all_new_btn.dart';
import 'package:referal/screens/profile/profile.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/buttons/button.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String notificationType = "All";

  _getAppBar() {
    return CustomAppBar(
      title: 'Template',
      isleading: true,
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
              child: Image.asset('assets/m-user-profile1.png',
                  width: 28.0, height: 28.0),
            )),
      ],
      onPress: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Container(
        color: const Color(0xFFf3f3f2),
        padding: EdgeInsets.all(10),
        child: data.length > 0
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      NotificationAllNewButton(
                        icon: 'assets/bel.png',
                        fontSize: 18,
                        iconSize: 20,
                        textColor: primaryColor,
                        onPress: () {
                          setState(() {
                            notificationType = "New";
                          });
                        },
                        adType: notificationType,
                        type: 'New',
                        text: 'New',
                      ),
                      NotificationAllNewButton(
                        icon: 'assets/bel.png',
                        textColor: primaryColor,
                        fontSize: 18,
                        iconSize: 20,
                        onPress: () {
                          setState(() {
                            notificationType = "All";
                          });
                        },
                        adType: notificationType,
                        type: 'All',
                        text: 'All',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        EntryItem(data[index]),
                    itemCount: data.length,
                  ),
                ],
              )
            : Column(
                children: [
                  Image.asset('assets/bel-bg.jpg', width: 145.0, height: 145.0),
                ],
              ),
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    'Notification Test',
    <Entry>[
      Entry(
          'Expandable should not be confused with ExpansionPanel. ExpansionPanel, which is a part of Flutter material library, is designed to work only within ExpansionPanelList and cannot be used for making other widgets, for example, expandable Card widgets.'),
    ],
  ),
  Entry(
    'Notification 2',
    <Entry>[
      Entry(
          'Expandable should not be confused with ExpansionPanel. ExpansionPanel, which is a part of Flutter material library, is designed to work only within ExpansionPanelList and cannot be used for making other widgets, for example, expandable Card widgets.'),
    ],
  ),
  Entry(
    'Notification 3',
    <Entry>[
      Entry(
          'Expandable should not be confused with ExpansionPanel. ExpansionPanel, which is a part of Flutter material library, is designed to work only within ExpansionPanelList and cannot be used for making other widgets, for example, expandable Card widgets.'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty)
      return Container(
          color: white,
          child: ListTile(
              title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              root.title,
              style: TextStyle(fontSize: 14),
            ),
          )));
    return Container(
      color: primaryColor,
      child: ExpansionTile(
        leading: Image.asset(
          'assets/nn.png',
          width: 25,
          height: 25,
        ),
        key: PageStorageKey<Entry>(root),
        title: Text(root.title, style: TextStyle(color: white)),
        children: root.children.map(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
