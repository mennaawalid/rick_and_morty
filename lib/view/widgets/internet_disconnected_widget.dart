import 'package:flutter/material.dart';

class InternetDisconnected extends StatelessWidget {
  const InternetDisconnected({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Couldn\'t connect...Check internet connection!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Image.asset(
            'assets/images/undraw_Warning_re_eoyhhh.png',
          ),
        ],
      ),
    );
    ;
  }
}
