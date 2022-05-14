import 'package:absensi_getx/utils/constants.dart';
import 'package:absensi_getx/utils/styling.dart';
import 'package:flutter/material.dart';

Widget absenTile(String imgUrl, String userName, String msg, String date,
    bool seen, BuildContext context) {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(imgUrl),
              radius: 28.0,
            ),
          ),
          const SizedBox(width: defaultPadding),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        userName,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(msg, style: Theme.of(context).textTheme.caption),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(date,
                            style: Theme.of(context).textTheme.caption)),
                    Icon(
                        seen
                            ? Icons.done_all_rounded
                            : Icons.remove_done_rounded,
                        color: seen ? Colors.green : Colors.red,
                        size: 20),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
