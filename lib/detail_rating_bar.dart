import 'package:flutter/material.dart';

class DetailsRatingBar extends StatelessWidget {
  final List<Map<String, String>> sampleRatingData = [
    {'Rating': '4.6'},
    {'Price': '\$12'},
    {'Open': '24hrs'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: sampleRatingData.map((entry) {
          String key = entry.keys.first;
          String value = entry.values.first;

          TextStyle valueStyle = TextStyle(
            color: key == 'Price' ? Colors.blue : Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          );

          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  key,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  value,
                  style: valueStyle,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
