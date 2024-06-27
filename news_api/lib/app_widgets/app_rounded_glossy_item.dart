import 'dart:ui';

import 'package:flutter/material.dart';

class AppRoundedGlossyItem extends StatelessWidget{
  IconData iconData;
  AppRoundedGlossyItem({required this.iconData});

  @override
  Widget build(BuildContext context) {
     return ClipOval(
          child: BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: new Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)
                  ),
                  child: new Center(
                    child: Icon(iconData, color: Colors.white,)
                  ),
              ),
            ),
     );
  }
  
}