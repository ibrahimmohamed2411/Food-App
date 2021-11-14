import 'package:flutter/material.dart';

class LoadingBottomSheet extends StatelessWidget {
  const LoadingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Please wait',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'We are working on this...',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
