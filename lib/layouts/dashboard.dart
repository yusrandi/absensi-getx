import 'package:absensi_getx/config/api.dart';
import 'package:absensi_getx/controllers/absen_controller.dart';
import 'package:absensi_getx/layouts/widgets/absen_tile.dart';
import 'package:absensi_getx/loaders/absen_skeleton.dart';
import 'package:absensi_getx/loaders/story_skeleton.dart';
import 'package:absensi_getx/utils/constants.dart';
import 'package:absensi_getx/utils/images.dart';
import 'package:absensi_getx/utils/size_config.dart';
import 'package:absensi_getx/utils/styling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/storybutton.dart';

// ignore: must_be_immutable
class DashboardScreen extends StatelessWidget {
  var containerRadius = const Radius.circular(30.0);
  final absenController = Get.put(AbsenController());

  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          flexibleSpace: Container(decoration: gradientDecoration()),
          title: Row(
            children: [
              Image.asset(Images.logoImage, height: 30),
              const SizedBox(width: 16),
              const Text("Erwin"),
            ],
          ),
        ),
        body: Container(
          decoration: gradientDecoration(),
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 120,
                  child: Obx(() => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: absenController.isLoading.value
                          ? storyLoading()
                          : storyBody())),
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: containerRadius, topRight: containerRadius),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: absenBody(context),
                  ),
                ))
              ],
            ),
          ),
        ));
  }

  ListView absenLoading() {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) => AbsenSkeleton(),
      separatorBuilder: (context, index) =>
          const SizedBox(height: defaultPadding),
    );
  }

  ListView storyLoading() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) => StorySkeleton(),
      separatorBuilder: (context, index) =>
          const SizedBox(width: defaultPadding / 2),
    );
  }

  Padding storyBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: absenController.absensiList.length,
          itemBuilder: (context, index) {
            var data = absenController.absensiList[index];
            return storyButton(
                Api.imageURL +
                    '/' +
                    absenController.absensiList[index].user!.photo,
                data.user!.name,
                context);
          }),
    );
  }

  Stack absenBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 1 * SizeConfig.textMultiplier,
            bottom: 1 * SizeConfig.textMultiplier,
            left: 1 * SizeConfig.textMultiplier,
            right: 1 * SizeConfig.textMultiplier,
            child: Obx(() => absenController.isLoading.value
                ? absenLoading()
                : absenContent())),
        Positioned(
          bottom: 8 * SizeConfig.textMultiplier,
          left: 4 * SizeConfig.textMultiplier,
          right: 4 * SizeConfig.textMultiplier,
          child: Container(
            height: 60,
            decoration: gradientDecoration()
                .copyWith(borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.supervised_user_circle_outlined,
                    color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  "Check In",
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
              ],
            )),
          ),
        )
      ],
    );
  }

  ListView absenContent() {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: absenController.absensiList.length,
        itemBuilder: (context, index) {
          var data = absenController.absensiList[index];
          var url = data.date == 'date'
              ? Api.imageURL +
                  '/' +
                  absenController.absensiList[index].user!.photo
              : Api.imageAbsenURL +
                  '/' +
                  absenController.absensiList[index].photo;
          return absenTile(
              url,
              data.user!.name,
              data.user!.unit,
              data.date != 'date'
                  ? "Telah Absen pada pukul ${data.date} ${data.time} di daerah ${data.location}"
                  : 'Belum ada kabar',
              data.date == 'date' ? false : true,
              context);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: defaultPadding));
  }
}
