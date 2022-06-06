import 'package:flutter/material.dart';
import 'package:referal/screens/notifications/notifications.dart';
import 'package:referal/screens/profile/profile.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';

class MyReferal extends StatefulWidget {
  const MyReferal({Key key}) : super(key: key);

  @override
  State<MyReferal> createState() => _SamplePageState();
}

class _SamplePageState extends State<MyReferal> {
  _getAppBar() {
    return CustomAppBar(
      title: 'My Referals',
      isleading: true,
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notifications(),
                  ),
                );
              },
              child: Image.asset('l', width: 25.0, height: 25.0),
            )),
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _getAppBar(),
        backgroundColor: const Color(0xFFf3f3f2),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.blue,
                isScrollable: true,
                indicator: const BoxDecoration(
                  color: Colors.transparent,
                ),
                tabs: [
                  tabitem(
                    color: primaryColor,
                    icon: 'assets/All.png',
                    title: 'All',
                  ),
                  tabitem(
                    color: Colors.red,
                    icon: 'assets/NotAttendantup.png',
                    title: 'Not Attendant',
                  ),
                  tabitem(
                    color: Colors.green,
                    icon: 'assets/Attendant.png',
                    title: 'Attendant',
                  ),
                  tabitem(
                    color: Colors.amber,
                    icon: 'assets/Registerd.png',
                    title: 'Registered',
                  ),
                ],
              ),
              Divider(
                thickness: 0.6,
                color: Colors.black.withOpacity(0.3),
              ),
              const SizedBox(height: 16),
              Expanded(child: _buildBody(context)),
            ],
          ),
        ),
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
            CircleAvatar(
                radius: 8,
                backgroundColor: color,
                child: Image.asset(
                  icon,
                  width: 15,
                  height: 15,
                )),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                // fontSize: 12,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return TabBarView(
      children: [
        ListView.builder(
          itemBuilder: (context, index) {
            return _buildtabItem(context);
          },
          itemCount: 5,
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return _buildtabItem(context);
          },
          itemCount: 5,
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return _buildtabItem(context);
          },
          itemCount: 5,
        ),
        ListView.builder(
          itemBuilder: (context, index) {
            return _buildtabItem(context);
          },
          itemCount: 5,
        ),
      ],
    );
  }

  _buildtabItem(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.14,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.red,
                child: Text("HS"),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Himanshu Singh",
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        ImageIcon(
                          AssetImage("assets/Cal.png"),
                          size: 12,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "12/12/2020",
                          style: TextStyle(
                              fontSize: 10, fontStyle: FontStyle.italic),
                        ),
                        SizedBox(width: 8),
                        ImageIcon(
                          AssetImage("assets/clo.png"),
                          size: 12,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "12:00 PM",
                          style: TextStyle(
                              fontSize: 10, fontStyle: FontStyle.italic),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              MaterialButton(
                color: darkPrimaryColor,
                onPressed: () {},
                height: 25,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.notifications,
                      size: 15,
                      color: Colors.white,
                    ),
                    SizedBox(width: 3),
                    Text(
                      "Reminder",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: StepProgressView(
                    curStep: 2,
                    titles: const [
                      "Refer",
                      "View",
                      "Registered",
                      "Attendant",
                      'join',
                    ],
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: darkPrimaryColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class StepProgressView extends StatelessWidget {
  final double _width;

  final List<String> _titles;
  final int _curStep;
  final Color _activeColor;
  final Color _inactiveColor = const Color(0xFFE6EEF3);
  final double lineWidth = 3.0;

  const StepProgressView(
      {int curStep, List<String> titles, double width, Color color})
      : _titles = titles,
        _curStep = curStep,
        _width = width,
        _activeColor = color,
        assert(width > 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: _width,
        child: Column(
          children: <Widget>[
            Row(
              children: _iconViews(),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _titleViews(),
            ),
          ],
        ));
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, icon) {
      var circleColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;
      var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;
      var iconColor =
          (i == 0 || _curStep > i + 1) ? _activeColor : _inactiveColor;

      list.add(
        Container(
          width: 15.0,
          height: 15.0,
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: circleColor,
            borderRadius: const BorderRadius.all(Radius.circular(22.0)),
            border: Border.all(
              color: circleColor,
              width: 2.0,
            ),
          ),
          // child: Icon(
          //   Icons.circle,
          //   color: iconColor,
          //   size: 12.0,
          // ),
        ),
      );

      //line between icons
      if (i != _titles.length - 1) {
        list.add(Expanded(
            child: Container(
          height: lineWidth,
          color: lineColor,
        )));
      }
    });

    return list;
  }

  List<Widget> _titleViews() {
    var list = <Widget>[];
    _titles.asMap().forEach((i, text) {
      list.add(Text(text,
          style: const TextStyle(
              color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic)));
    });
    return list;
  }
}
