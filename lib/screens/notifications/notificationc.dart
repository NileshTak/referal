import 'package:flutter/material.dart';
import 'package:referal/screens/home/widget/notification_all_new_btn.dart';
import 'package:referal/screens/notifications/notifications.dart';
import 'package:referal/screens/profile/profile.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';

class NotificationC extends StatefulWidget {
  const NotificationC({Key key}) : super(key: key);

  @override
  State<NotificationC> createState() => _SamplePageState();
}

class _SamplePageState extends State<NotificationC> {
  String notificationType = "All";
  _getAppBar() {
    return CustomAppBar(
      title: 'Notification',
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

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: _getAppBar(),
          backgroundColor: const Color(0xFFf3f3f2),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "New"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "All")
            ],
          ),
          body: IndexedStack(
            index: _currentIndex,
            children: _buildBody(context),
          )
          // SafeArea(
          //   child: Column(
          //     children: [
          //       const SizedBox(height: 16),
          //       SizedBox(
          //         child: TabBar(
          //           unselectedLabelColor: Colors.black,
          //           labelColor: Colors.blue,
          //           isScrollable: true,
          //           indicator: const BoxDecoration(
          //             color: Colors.transparent,
          //           ),
          //           tabs: [
          //             tabitem(
          //               color: Colors.green,
          //               icon: 'assets/bel.png',
          //               title: 'New',
          //             ),
          //             tabitem(
          //               color: Colors.amber,
          //               icon: 'assets/bel.png',
          //               title: 'All',
          //             ),
          //           ],
          //         ),
          //       ),
          //       Divider(
          //         thickness: 0.6,
          //         color: Colors.black.withOpacity(0.3),
          //       ),
          //       const SizedBox(height: 16),
          //       Expanded(child: _buildBody(context)),
          //     ],
          //   ),
          // ),

          ),
    );
  }

  Tab tabitem({
    final String icon,
    String title,
    Color color,
  }) {
    return Tab(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 20,
              height: 22,
            ),
            const SizedBox(height: 3),
            Text(title,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return [
      ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),
      ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
        itemCount: data.length,
      ),
    ];
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
