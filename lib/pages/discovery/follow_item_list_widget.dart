import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_eyepetizer/entity/category_entity.dart';
import 'package:flutter_eyepetizer/entity/follow_entity.dart';
import 'package:flutter_eyepetizer/http/http.dart';
import 'package:flutter_eyepetizer/util/constant.dart';
import 'category_item_widget.dart';
import 'follow_item_details_widget.dart';
import 'follow_item_widget.dart';

class FollowItemListWidget extends StatelessWidget {
  final FollowItemlistDataItemlist item;
  final int index;

  FollowItemListWidget({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((this.index + 1) % 2 == 0) {
      return Padding(
        padding: EdgeInsets.only(left: 6, right: 6),
        child: renderItemWidget(),
      );
    } else {
      return renderItemWidget();
    }
  }

  Widget renderItemWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Stack(
            alignment: FractionalOffset(0.97, 0.05),
            children: <Widget>[
              CachedNetworkImage(
                width: 300,
                height: 180,
                fit: BoxFit.cover,
                imageUrl: item.data.cover.feed,
                errorWidget: (context, url, error) =>
                    Image.asset('images/img_load_fail'),
              ),
              Positioned(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      item.data.category,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
          child: Text(
            item.data.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 14,
            ),
          ),
        ),
        Text(
          DateUtil.formatDateMs(item.data.author.latestReleaseTime,
              format: 'yyyy/MM/dd HH:mm'),
          style: TextStyle(color: Colors.black26, fontSize: 12),
        ),
      ],
    );
  }
}
