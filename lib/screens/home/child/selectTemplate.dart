import 'package:flutter/material.dart';
import 'package:referal/screens/notifications/notifications.dart';
import 'package:referal/screens/profile/profile.dart';
import 'package:referal/screens/template/EditTemplate.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/buttons/button.dart';
import 'package:referal/widgets/common/buttons/rounded_button.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';
import 'package:referal/widgets/drawer/customer_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

class selectTemplate extends StatefulWidget {
  selectTemplate({Key key}) : super(key: key);

  @override
  State<selectTemplate> createState() => _TemplateState();
}

class _TemplateState extends State<selectTemplate> {
  String initialValue = 'Select social icon';

  var itemList = [
    'Select social icon',
    'Template 1',
    'Template 2',
    'Template 3',
    'Template 4',
    'Template 5',
    'Template 6'
  ];

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
            Row(
              children: [
                Container(
                  width: 160,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.shade200,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButton(
                    isExpanded: true,
                    iconEnabledColor: Colors.grey.shade400,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    dropdownColor: Colors.white,
                    focusColor: Colors.black,
                    value: initialValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: itemList.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        initialValue = newValue;
                      });
                    },
                  ),
                ),
                Container(
                  height: 80,
                  width: 170,
                  child: Button(
                    textsize: 12,
                    title: 'ADD NEW TEMPLATE',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            MyCardWidget(),
          ],
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyCardWidget extends StatelessWidget {
  MyCardWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) =>
          EntryItem(data[index], context),
      itemCount: data.length,
    ));
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    'assets/fb.png',
    <Entry>[
      Entry(
          'Expandable should not be confused with ExpansionPanel. ExpansionPanel, which is a part of Flutter material library, is designed to work only within ExpansionPanelList and cannot be used for making other widgets, for example, expandable Card widgets.'),
    ],
  ),
  Entry(
    'assets/insta.png',
    <Entry>[
      Entry(
          'Expandable should not be confused with ExpansionPanel. ExpansionPanel, which is a part of Flutter material library, is designed to work only within ExpansionPanelList and cannot be used for making other widgets, for example, expandable Card widgets.'),
    ],
  ),
  Entry(
    'assets/wp.png',
    <Entry>[
      Entry(
          'Expandable should not be confused with ExpansionPanel. ExpansionPanel, which is a part of Flutter material library, is designed to work only within ExpansionPanelList and cannot be used for making other widgets, for example, expandable Card widgets.'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.context);

  final BuildContext context;

  final Entry entry;

  Widget _buildTiles(Entry root) {
    return Container(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 16,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          SizedBox(height: 25),
                                          Center(
                                            child: Text('Alert',
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.grey.shade700)),
                                          ),
                                          SizedBox(height: 15),
                                          GestureDetector(
                                            onTap: () {
                                              Fluttertoast.showToast(
                                                msg:
                                                    "Template Deleted.", // message
                                                toastLength: Toast
                                                    .LENGTH_SHORT, // length
                                                gravity: ToastGravity
                                                    .BOTTOM, // location
                                              );
                                              Navigator.pop(context);
                                            },
                                            child: _buildRow(
                                                'Delete', Colors.red.shade800),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: _buildRow(
                                                'Cancel', Colors.grey.shade800),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/delete.png',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        GestureDetector(
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
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Image.asset(root.title, width: 40, height: 40),
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10, top: 10),
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
                                'A paragraph is a series of related sentences developing a central idea, called the topic.',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey.shade600)),
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
                        title: 'View',
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
                    Container(
                      height: 72,
                      margin: EdgeInsets.symmetric(horizontal: 5),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }

  Widget _buildRow(String name, Color shade800) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        children: <Widget>[
          Container(height: 1, color: Colors.grey.shade300),
          SizedBox(height: 14),
          Text(name,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: shade800)),
        ],
      ),
    );
  }
}
