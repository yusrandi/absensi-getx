import 'package:absensi_getx/utils/constants.dart';
import 'package:flutter/material.dart';

import 'skeleton.dart';

class AbsenSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.04),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 150),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: const [
                  Expanded(
                    flex: 3,
                    child: Skeleton(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    flex: 1,
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
