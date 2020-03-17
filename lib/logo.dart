import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 120),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                child: Align(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    width: 150,
                    height: 150,
                  ),
                  alignment: Alignment.center,
                ),
                height: 154,
              ),
            ),
            Positioned(
              child: Container(
                height: 154,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "GO",
                    style: TextStyle(
                      fontSize: 120.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              width: 60,
              height: 60,
              top: 140,
              left: 260,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              width: 30,
              height: 30,
              left: 230,
              top: 200,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
