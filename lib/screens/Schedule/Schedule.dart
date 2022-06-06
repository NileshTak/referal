import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:referal/controller/button_click.dart';
import 'package:referal/screens/home/child/selectTemplate.dart';
import 'package:referal/screens/home/widget/social_media_icons.dart';
import 'package:referal/screens/notifications/notifications.dart';
import 'package:referal/screens/profile/profile.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/buttons/button.dart';
import 'package:referal/widgets/common/buttons/rounded_button.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';
import 'package:referal/widgets/drawer/customer_drawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The hove page which hosts the calendar
class schedule extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const schedule({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<schedule> {
  int _currentIndex = 0;
  String initialValue = 'Select message to share';

  bool socialMediaVisible = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<bool> onWillPop() async {
    // if (_currentIndex == 0) {
    //   return showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return AlertDialogBox(
    //         title: 'Confirm Exit',
    //         subtitle: 'Are you sure you want to exit?',
    //         onPress: () {
    //           SystemNavigator.pop();
    //         },
    //       );
    //     },
    //   );
    // } else {
    //   setState(() {
    //     _currentIndex = 0;
    //   });
    //   return false;
    // }
  }

  _getAppBar() {
    return CustomAppBar(
      title: 'Schedule',
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
              child: Image.asset('assets/bell.png', width: 25.0, height: 25.0),
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
        _scaffoldKey.currentState.openDrawer();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          key: _scaffoldKey,
          drawer: CustomDrawer(
            onHome: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          appBar: _getAppBar(),
          body: Column(
            children: [
              Container(
                height: 380,
                child: SfCalendar(
                  onTap: (data) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 16,
                          child: Container(
                            height: 350,
                            child: Column(
                              children: [
                                SizedBox(height: 14),
                                Text('Session Details',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade800)),
                                SizedBox(height: 14),
                                Container(
                                  height: 250,
                                  child: _showSessionDetails(
                                      'Moonpreneur Classroom Session [App. Dev.]',
                                      'Moonshot Junior is inviting you to a scheduled Zoom meeting.',
                                      'https://us02web.zoom.us/j/84058190926?pwd=TWdmQzZ6S2YvUmNyKytKSnQ4ckdjdz09',
                                      Colors.grey.shade600),
                                ),
                                Container(
                                    height: 1, color: Colors.grey.shade300),
                                SizedBox(height: 14),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancel',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  view: CalendarView.month,
                  dataSource: MeetingDataSource(_getDataSource()),
                  // by default the month appointment display mode set as Indicator, we can
                  // change the display mode as appointment using the appointment display
                  // mode property
                  monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment),
                ),
              ),
              Divider(
                thickness: 0.6,
                color: Colors.black.withOpacity(0.3),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'Scheduled Sessions',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return _buildtabItem(context);
                  },
                  itemCount: 5,
                ),
              ),
            ],
          )),
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
        ],
      ),
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime startTimef =
      DateTime(today.year, today.month, today.day + 1, 11, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));
  meetings.add(Meeting(
      'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  meetings
      .add(Meeting('Conference', startTime, endTime, darkPrimaryColor, false));
  meetings.add(Meeting(
      'Conference', startTimef, endTime, const Color(0xFFFF0000), false));
  return meetings;
}

Widget _showSessionDetails(
    String title, String summary, String link, Color shade800) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          SizedBox(height: 14),
          Column(
            children: [
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800)),
              SizedBox(height: 10),
              Container(height: 1, color: Colors.grey.shade300),
              SizedBox(height: 10),
              Text('Summary : ' + summary,
                  style:
                      TextStyle(fontSize: 16.0, color: Colors.grey.shade800)),
              SizedBox(height: 10),
              Container(height: 1, color: Colors.grey.shade300),
              SizedBox(height: 10),
              Text('Join Zoom Meeting : ',
                  style:
                      TextStyle(fontSize: 16.0, color: Colors.grey.shade800)),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: Text(link,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Colors.blue)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments[index];
    Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
