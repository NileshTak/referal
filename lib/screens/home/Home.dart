import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referal/controller/button_click.dart';
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
class MyHomePage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MyHomePage({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  String initialValue = 'Select message to share';

  bool socialMediaVisible = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var itemList = [
    'Select message to share',
    'Template Heading 1',
    'Template Heading 2',
    'Template Heading 3',
    'Template Heading 4',
    'Template Heading 5',
    'Template Heading 6'
  ];

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
      title: 'Home',
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
              child: Image.asset('assets/bel.png', width: 25.0, height: 25.0),
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
                height: 300,
                child: SfCalendar(
                  view: CalendarView.week,
                  dataSource: MeetingDataSource(_getDataSource()),
                  // by default the month appointment display mode set as Indicator, we can
                  // change the display mode as appointment using the appointment display
                  // mode property
                  monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(40),
                      width: 200,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'When your friend signup using the referal code, you get \$20 ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.green,
                        //   ),
                        //   margin: EdgeInsets.symmetric(horizontal: 20),
                        //   child: DropdownButton(
                        //     isExpanded: true,
                        //     iconEnabledColor: Colors.white,
                        //     style: TextStyle(color: Colors.white, fontSize: 16),
                        //     dropdownColor: Colors.green,
                        //     focusColor: Colors.black,
                        //     value: initialValue,
                        //     icon: Icon(Icons.keyboard_arrow_down),
                        //     items: itemList.map((String items) {
                        //       return DropdownMenuItem(
                        //           value: items, child: Text(items));
                        //     }).toList(),
                        //     onChanged: (String newValue) {
                        //       setState(() {
                        //         initialValue = newValue;
                        //       });
                        //     },
                        //   ),
                        // ),

                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade200,
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: DropdownButton(
                            isExpanded: true,
                            iconEnabledColor: Colors.grey.shade600,
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                            dropdownColor: Colors.white,
                            focusColor: Colors.black,
                            value: initialValue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: itemList.map((String items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: items == 'Select message to share'
                                      ? Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            items,
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.only(left: 20),
                                          child: Text(
                                            items,
                                            style: TextStyle(
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ));
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                initialValue = newValue;
                                if (newValue == 'Select message to share') {
                                  socialMediaVisible = false;
                                } else {
                                  socialMediaVisible = true;
                                }
                              });
                            },
                          ),
                        ),

                        Container(
                          height: 80,
                          child: Button(
                            title: 'Search',
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    Visibility(
                      child: SocialMediaButton(),
                      visible: socialMediaVisible,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
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