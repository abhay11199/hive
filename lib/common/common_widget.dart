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
                  Text(thumbnailUrl),
                  SizedBox(
                    width: appConfig.deviceWidth(2),
                  ),
                  Text(
                    author,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: appConfig.textSizeScale(18)),
                  ),
                  SizedBox(
                    width: appConfig.deviceWidth(2),
                  ),
                  Text(
                    community,
                    style: TextStyle(
                        fontSize: appConfig.textSizeScale(18),
                        color: AppColors.textgrey),
                  ),
                  SizedBox(
                    width: appConfig.deviceWidth(2),
                  ),
                  Text(time,
                      style: TextStyle(
                          fontSize: appConfig.textSizeScale(18),
                          color: AppColors.textgrey)),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post),
                  SizedBox(
                    width: appConfig.deviceWidth(10),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: appConfig.textSizeScale(18)),
                        ),
                        Text(description),
                        Divider(
                          color: AppColors.grey,
                          height: appConfig.deviceHeight(2),
                          indent: 0.1,
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
                              Text(votes),
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
                              Text(comments),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
