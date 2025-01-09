import 'package:demo/constants/app_config.dart';
import 'package:demo/constants/colors.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  static commonContainer(
    AppConfig appConfig, {
    required String thumbnailUrl,
    required String author,
    required String community,
    required String time,
    required String post,
    required String title,
    required String description,
    required String votes,
    required String comments,
  }) {
    return Container(
      width: appConfig.deviceWidth(45),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: AppColors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
          padding: EdgeInsets.all(appConfig.rWP(2)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      thumbnailUrl,
                      height: appConfig.deviceHeight(3),
                      width: appConfig.deviceWidth(6),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: appConfig.deviceWidth(1),
                  ),
                  Text(
                    author,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: appConfig.textSizeScale(12)),
                  ),
                  SizedBox(
                    width: appConfig.deviceWidth(1),
                  ),
                  Text(
                    community,
                    style: TextStyle(
                        fontSize: appConfig.textSizeScale(12),
                        color: AppColors.textgrey),
                  ),
                  SizedBox(
                    width: appConfig.deviceWidth(1),
                  ),
                  Text(time,
                      style: TextStyle(
                          fontSize: appConfig.textSizeScale(12),
                          color: AppColors.textgrey)),
                ],
              ),
              SizedBox(
                height: appConfig.deviceHeight(2),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    post,
                    height: appConfig.deviceHeight(15),
                    width: appConfig.deviceWidth(25),
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: appConfig.deviceWidth(10),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: appConfig.textSizeScale(10)),
                        ),
                        Text(
                          description,
                          style:
                              TextStyle(fontSize: appConfig.textSizeScale(10)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                color: AppColors.grey,
                thickness: 1,
                indent: appConfig.deviceWidth(35),
                endIndent: appConfig.deviceWidth(2),
              ),
              Row(
                children: [
                  SizedBox(
                    width: appConfig.deviceWidth(40),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_drop_up_sharp,
                          color: AppColors.grey,
                        ),
                        SizedBox(
                          width: appConfig.deviceWidth(2),
                        ),
                        Text(
                          votes,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: appConfig.textSizeScale(10)),
                        ),
                        SizedBox(
                          width: appConfig.deviceWidth(8),
                        ),
                        VerticalDivider(
                          color: AppColors.grey,
                          thickness: 1,
                        ),
                        SizedBox(
                          width: appConfig.deviceWidth(8),
                        ),
                        Icon(Icons.chat_bubble, color: AppColors.grey),
                        SizedBox(
                          width: appConfig.deviceWidth(2),
                        ),
                        Text(
                          comments,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: appConfig.textSizeScale(10)),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
