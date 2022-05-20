import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Logo extends StatelessWidget {
  final bool isShowTitle;
  final int size;
  const Logo({this.isShowTitle = false, this.size = 160});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF7563d4),
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 4, 4, 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/prof.png",
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 4, 4, 2),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nilesh Tak',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 2, 4, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nilesh.t@moonpreneur.com',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
            if (isShowTitle)
              Text(
                'You are 30 seconds away from selling/renting a vehicle!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
          ],
        ),
      ),
    );
  }
}
