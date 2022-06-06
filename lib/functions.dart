import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Functions {
  var todaysDate = '';

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  setDate(String date) {
    todaysDate = date;
  }

  getTpDateFormat(String date) {
    try {
      print('aaaaaaaa   ' +
          DateFormat('dd MMM, yyyy').add_jm().format(DateTime.parse(date)));
      return DateFormat('dd MMM, yyyy')
          .add_jm()
          .format(DateTime.parse(date).toLocal());
    } catch (e) {
      return date;
    }
  }

  getDateFormat(String date) {
    try {
      return DateFormat('dd-MM-yyyy').format(DateTime.parse(date));
    } catch (e) {
      return date;
    }
  }

  getFormatedMMMDateFormat(String date) {
    try {
      return DateFormat('dd MMM, yyyy').format(DateTime.parse(date));
    } catch (e) {
      return date;
    }
  }

  String getDate() {
    return todaysDate;
  }

  navigateToScreen(BuildContext context, Widget home) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (c, a1, a2) => home,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 400),
      ),
    );
  }
}
