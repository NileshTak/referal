import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referal/controller/calendar_view_changer.dart';
import 'package:referal/screens/notifications/notifications.dart';
import 'package:referal/screens/profile/profile.dart';
import 'package:referal/screens/template/EditTemplate.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/buttons/button.dart';
import 'package:referal/widgets/common/buttons/rounded_button.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';
import 'package:referal/widgets/drawer/customer_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Template extends StatefulWidget {
  Template({Key key}) : super(key: key);

  @override
  State<Template> createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  _getAppBar() {
    return CustomAppBar(
      title: 'Template',
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
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 80,
                width: 170,
                child: Button(
                  textsize: 12,
                  title: 'ADD NEW TEMPLATE',
                  onPressed: () {},
                ),
              ),
            ),
            MyCardWidget(),
          ],
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyCardWidget extends StatefulWidget {
  MyCardWidget({Key key}) : super(key: key);

  @override
  _MyCardWidgetState createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  List<String> messagedata = [
    "Template Hewading1",
    "template head 2",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: MediaQuery.of(context).size.width,
      padding: new EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(
                          msg: "Template Copied.", // message
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.BOTTOM, // location
                        );
                      },
                      child: Image.asset(
                        'assets/copy1.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child:
                            Image.asset('assets/fb.png', width: 46, height: 46),
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 160,
                            child: Text('Template Heading 1',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700)),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 160,
                            child: Text(
                                'A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument. A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey.shade600)),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 72,
                      child: Button(
                        title: 'Publish',
                        radius: 50,
                        textsize: 11,
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: 72,
                      margin: EdgeInsets.only(left: 5),
                      child: Button(
                        title: 'Edit',
                        textsize: 11,
                        radius: 50,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditTemplate()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
