import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InternetDisconnectedWidet extends StatelessWidget {
  const InternetDisconnectedWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Couldn\'t connect...Check internet connection!',
            style: TextStyle(
              fontSize: 18.sp,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset(
              'assets/images/undraw_Warning_re_eoyhhh.png',
            ),
          ),
        ],
      ),
    );
  }
}
