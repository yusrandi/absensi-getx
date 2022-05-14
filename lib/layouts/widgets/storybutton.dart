import 'package:flutter/material.dart';

Widget storyButton(String imgUrl, String userName, BuildContext context) {
  return Container(
    width: 70,
    padding: const EdgeInsets.only(right: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
              radius: 26.0,
            ),
            const Positioned(
                bottom: 3,
                right: 3,
                child: Icon(Icons.circle,
                    color: Colors.lightGreenAccent, size: 10)),
          ],
        ),
        const SizedBox(height: 5.0),
        Flexible(
          child: Text(
            userName,
            style: Theme.of(context).primaryTextTheme.caption,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
