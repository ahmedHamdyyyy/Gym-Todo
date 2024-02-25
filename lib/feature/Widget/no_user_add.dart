import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class NoUserAdd extends StatelessWidget {
  const NoUserAdd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
        duration: const Duration(milliseconds: 1700),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "There are no users, please add..",
              style: TextStyle(fontSize: 20),
            )),
          ],
        ));
  }
}
