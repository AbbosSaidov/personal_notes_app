import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_notes_app/src/presentation/utils/Colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundLight,
      body: Column(
        children: [
          SizedBox(
            height: 143.h,
          ),
          Image.asset("assets/icons/logo_light.png",height: 242.h,width: 242.h,),
          const Spacer(),

          SizedBox(
            height: 63.h,
          )
        ],
      ),
    );
  }
}
