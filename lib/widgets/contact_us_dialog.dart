// lib/widgets/contact_us_dialog.dart

import 'package:flutter/material.dart';

void showContactUsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Contact Us'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Have questions or feedback? Reach out to us!'),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 8),
                Text('asthatechbd3@gmail.com'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 8),
                Text('+8801234567890'),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}
