import 'package:demo/common/common_widget.dart';
import 'package:demo/constants/app_config.dart';
import 'package:demo/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig(context);
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
            Text('All Posts',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: appConfig.textSizeScale(20))),
            SizedBox(
              height: appConfig.deviceHeight(2),
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: appConfig.deviceHeight(2),
                  );
                },
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CommonWidgets.commonContainer(appConfig,
                      thumbnailUrl: 'abc',
                      author: 'abc',
                      community: 'abc',
                      time: 'abc',
                      post: 'abc',
                      title: 'abc',
                      description: 'abc',
                      votes: 'abc',
                      comments: 'abc');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
