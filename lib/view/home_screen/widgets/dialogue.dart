import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function () onPressed;
  const FloatingButton({super.key, required this.title, required this.subTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
                     onPressed: () {
                      showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return AlertDialog(
                                 title: Text(
                              title,
                                 style: TextStyle(color: Colors.red,fontSize: 20),
                               ),
                             content: Text(
                               subTitle,
                               style: TextStyle(
                                   fontSize: 18, fontWeight: FontWeight.w500),
                               ),
                               actions: <Widget>[
                                 TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Yes'),
                                onPressed: onPressed
                        ),
                      ],
                    );
                   },
                    );
      },
      child: Icon(Icons.add),
    );
  }
}
