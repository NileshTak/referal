import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/buttons/button.dart';
import 'package:referal/widgets/common/buttons/rounded_button.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';
import 'package:referal/widgets/drawer/customer_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';

class EditTemplate extends StatefulWidget {
  EditTemplate({Key key}) : super(key: key);

  @override
  State<EditTemplate> createState() => _TemplateState();
}

class _TemplateState extends State<EditTemplate> {
  _getAppBar() {
    return CustomAppBar(
      title: 'Edit Template',
      isleading: true,
      onPress: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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

    return GestureDetector(
      child: Scaffold(
        appBar: _getAppBar(),
        body: Container(
          color: const Color(0xFFf3f3f2),
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 16),
                        dropdownColor: Colors.white,
                        focusColor: Colors.black,
                        value: initialValue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: itemList.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
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
                EditorWidget(),
              ],
            ),
          ),
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
        child: Container(
      width: MediaQuery.of(context).size.width,
      padding: new EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 200,
              margin: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    ));
  }
}

class EditorWidget extends StatelessWidget {
  EditorWidget({Key key}) : super(key: key);
  final HtmlEditorController controller = HtmlEditorController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HtmlEditor(
              controller: controller,
              htmlEditorOptions: HtmlEditorOptions(
                hint: 'Your text here...',
                shouldEnsureVisible: true,
                //initialText: "<p>text content initial, if any</p>",
              ),
              htmlToolbarOptions: HtmlToolbarOptions(
                toolbarPosition: ToolbarPosition.aboveEditor, //by default
                toolbarType: ToolbarType.nativeScrollable, //by default
                onButtonPressed:
                    (ButtonType type, bool status, Function updateStatus) {
                  return true;
                },
                onDropdownChanged: (DropdownType type, dynamic changed,
                    Function(dynamic) updateSelectedItem) {
                  return true;
                },
                mediaLinkInsertInterceptor: (String url, InsertFileType type) {
                  print(url);
                  return true;
                },
                mediaUploadInterceptor:
                    (PlatformFile file, InsertFileType type) async {
                  print(file.name); //filename
                  print(file.size); //size in bytes
                  print(file.extension); //file extension (eg jpeg or mp4)
                  return true;
                },
              ),
              otherOptions: OtherOptions(height: 500),
              callbacks: Callbacks(onBeforeCommand: (String currentHtml) {
                print('html before change is $currentHtml');
              }, onChangeContent: (String changed) {
                print('content changed to $changed');
              }, onChangeCodeview: (String changed) {
                print('code changed to $changed');
              }, onChangeSelection: (EditorSettings settings) {
                print('parent element is ${settings.parentElement}');
                print('font name is ${settings.fontName}');
              }, onDialogShown: () {
                print('dialog shown');
              }, onEnter: () {
                print('enter/return pressed');
              }, onFocus: () {
                print('editor focused');
              }, onBlur: () {
                print('editor unfocused');
              }, onBlurCodeview: () {
                print('codeview either focused or unfocused');
              }, onInit: () {
                print('init');
              },
                  //this is commented because it overrides the default Summernote handlers
                  /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                  onImageUploadError:
                      (FileUpload file, String base64Str, UploadError error) {
                print(base64Str ?? '');
                if (file != null) {
                  print(file.name);
                  print(file.size);
                  print(file.type);
                }
              }, onKeyDown: (int keyCode) {
                print('$keyCode key downed');
                print('current character count: ${controller.characterCount}');
              }, onKeyUp: (int keyCode) {
                print('$keyCode key released');
              }, onMouseDown: () {
                print('mouse downed');
              }, onMouseUp: () {
                print('mouse released');
              }, onNavigationRequestMobile: (String url) {
                print(url);
                return NavigationActionPolicy.ALLOW;
              }, onPaste: () {
                print('pasted into editor');
              }, onScroll: () {
                print('editor scrolled');
              }),
              plugins: [
                SummernoteAtMention(
                    getSuggestionsMobile: (String value) {
                      var mentions = <String>['test1', 'test2', 'test3'];
                      return mentions
                          .where((element) => element.contains(value))
                          .toList();
                    },
                    mentionsWeb: ['test1', 'test2', 'test3'],
                    onSelect: (String value) {
                      print(value);
                    }),
              ],
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 75,
                    child: Button(
                      title: 'Publish',
                      radius: 50,
                      textsize: 12,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    height: 75,
                    margin: EdgeInsets.only(left: 5),
                    child: Button(
                      title: 'Save',
                      textsize: 12,
                      radius: 50,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.undo();
            //         },
            //         child: Text('Undo', style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.clear();
            //         },
            //         child: Text('Reset', style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).colorScheme.secondary),
            //         onPressed: () async {
            //           var txt = await controller.getText();
            //           if (txt.contains('src=\"data:')) {
            //             txt =
            //                 '<text removed due to base-64 data, displaying the text could cause the app to crash>';
            //           }
            //           // setState(() {
            //           //   result = txt;
            //           // });
            //         },
            //         child: Text(
            //           'Submit',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).colorScheme.secondary),
            //         onPressed: () {
            //           controller.redo();
            //         },
            //         child: Text(
            //           'Redo',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(result),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.disable();
            //         },
            //         child: Text('Disable', style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).colorScheme.secondary),
            //         onPressed: () async {
            //           controller.enable();
            //         },
            //         child: Text(
            //           'Enable',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).colorScheme.secondary),
            //         onPressed: () {
            //           controller.insertText('Google');
            //         },
            //         child: Text('Insert Text',
            //             style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).colorScheme.secondary),
            //         onPressed: () {
            //           controller.insertHtml(
            //               '''<p style="color: blue">Google in blue</p>''');
            //         },
            //         child: Text('Insert HTML',
            //             style: TextStyle(color: Colors.white)),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).colorScheme.secondary),
            //         onPressed: () async {
            //           controller.insertLink(
            //               'Google linked', 'https://google.com', true);
            //         },
            //         child: Text(
            //           'Insert Link',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).colorScheme.secondary),
            //         onPressed: () {
            //           controller.insertNetworkImage(
            //               'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png',
            //               filename: 'Google network image');
            //         },
            //         child: Text(
            //           'Insert network image',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.addNotification(
            //               'Info notification', NotificationType.info);
            //         },
            //         child: Text('Info', style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.addNotification(
            //               'Warning notification', NotificationType.warning);
            //         },
            //         child: Text('Warning', style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).colorScheme.secondary),
            //         onPressed: () async {
            //           controller.addNotification(
            //               'Success notification', NotificationType.success);
            //         },
            //         child: Text(
            //           'Success',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).colorScheme.secondary),
            //         onPressed: () {
            //           controller.addNotification(
            //               'Danger notification', NotificationType.danger);
            //         },
            //         child: Text(
            //           'Danger',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.addNotification(
            //               'Plaintext notification', NotificationType.plaintext);
            //         },
            //         child:
            //             Text('Plaintext', style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Theme.of(context).colorScheme.secondary),
            //         onPressed: () async {
            //           controller.removeNotification();
            //         },
            //         child: Text(
            //           'Remove',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
