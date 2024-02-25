import 'package:flutter/material.dart';

class Utils {
  static String id() => DateTime.now()
      .difference(DateTime(2000))
      .inMicroseconds
      .remainder(10000000000)
      .toString();

  static Future showLoadingDialog(BuildContext context) => showDialog(
        context: context,
        // ignore: deprecated_member_use
        builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Loading...',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 25),
                  const LinearProgressIndicator(),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        ),
      );

  static Future showFailureDialog(BuildContext context, String msg) =>
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Error.',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 25),
                Text(msg, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      );
}
