import 'dart:developer';

import 'package:demo/common/common_widget.dart';
import 'package:demo/constants/app_config.dart';
import 'package:demo/constants/colors.dart';
import 'package:demo/view_model/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final controller = Provider.of<HiveViewModel>(context, listen: false);
    controller.hiveApi(context);
  }

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);
    return Consumer<HiveViewModel>(
      builder: (BuildContext context, controller, Widget? child) {
        if (controller.isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Hive',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: AppColors.grey,
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Hive',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: AppColors.grey,
          ),
          body: Padding(
            padding: EdgeInsets.all(appConfig.rWP(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'All Posts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: appConfig.textSizeScale(20),
                  ),
                ),
                SizedBox(
                  height: appConfig.deviceHeight(2),
                ),
                controller.hiveModel?.result != null &&
                        controller.hiveModel!.result.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: appConfig.deviceHeight(2),
                            );
                          },
                          itemCount: controller.hiveModel?.result.length ?? 0,
                          itemBuilder: (context, index) {
                            final result = controller.hiveModel?.result[index];
                            if (result == null) {
                              return Container();
                            }

                            final createdString = result.created ?? "";
                            DateTime createdTime;
                            try {
                              createdTime = DateTime.parse(createdString);
                            } catch (e) {
                              createdTime = DateTime.now();
                            }

                            final now = DateTime.now();
                            final difference = now.difference(createdTime);
                            String timeAgo;
                            if (difference.inHours > 24) {
                              timeAgo = "${difference.inDays} days ago";
                            } else if (difference.inMinutes >= 60) {
                              timeAgo = "${difference.inHours} hours ago";
                            } else {
                              timeAgo = "${difference.inMinutes} minutes ago";
                            }

                            return CommonWidgets.commonContainer(
                              appConfig,
                              thumbnailUrl: (result
                                      .jsonMetadata.thumbnail.isNotEmpty)
                                  ? result.jsonMetadata.thumbnail.first
                                  : 'https://images.ecency.com/DQmZSd733B9z96wh2hk8GkwriinprkiwJ8Dk139n535Tnkg/image.png',
                              author: result.author ?? "",
                              community: result.community ?? "",
                              time: timeAgo,
                              post: (result.jsonMetadata.image.isNotEmpty)
                                  ? result.jsonMetadata.image.first
                                  : 'https://images.ecency.com/DQmZSd733B9z96wh2hk8GkwriinprkiwJ8Dk139n535Tnkg/image.png',
                              title: result.title ?? "",
                              description:
                                  result.jsonMetadata.description ?? '',
                              votes: result.stats.totalVotes.toString(),
                              comments: result.communityTitle.length.toString(),
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Text('No data'),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
