import 'package:absensi_getx/loaders/skeleton_dark.dart';
import 'package:absensi_getx/utils/constants.dart';
import 'package:flutter/material.dart';

class StorySkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        const SkeletonDark(width: 50)
      ],
    );
  }
}
