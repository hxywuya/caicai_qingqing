import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Network请求类
class Network {
  String baseUrl = 'https://qing.ntcai.com/api';

  /// 接口请求
  ///
  /// [url] 为请求的接口地址不包含 [baseUrl]
  /// [method] Http 请求 method 默认为 'get'，'post' 为可选
  /// [params] 请求参数
  /// [loading] 当传入true时显示无文字的loading，传入字符串时显示有蚊子的loading，不传则不显示loading
  /// [success] 成功回调
  /// [fail] 失败回调
  /// [complete] 请求完成回调（不管成功还是失败）
  static void api(String url, {
    String method = 'GET',
    Map<String, dynamic>? params,
    var loading,
    void Function(Map<String, dynamic> data, Res response)? success,
    void Function(Res response)? fail,
    void Function()? complete,
  }) async {
    /// loading 存在值才会显示Loading
    if (loading != null) {
      EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.ring;
      EasyLoading.instance.contentPadding = loading != true ? EdgeInsets.fromLTRB(40, 30, 40, 30) : EdgeInsets.all(40);
      EasyLoading.instance.indicatorSize = 50;
      EasyLoading.show(
        status: loading != true ? loading : null,
        maskType: EasyLoadingMaskType.black,
      );
    }

    /// 初始化 dio 配置
    var dio = Dio(BaseOptions(
      baseUrl: 'https://qing.ntcai.com/api'
    ));

    /// 进行请求
    try {
      Response response = await dio.request(
        url,
        data: params,
        queryParameters: params,
        options: Options(method: method)
      );

      Res res = Res.fromJson(response.data);

      switch(res.code) {
        /// 接口处理成功
        case 1: {
          if (success != null) {
            success(res.data, res);
          }
        }
        break;
        /// 需要登录
        case 10001: {
          // 需要登录
        }
        break;
        /// 需要登录
        case 10002: {
          // 需要登录
        }
        break;
        /// 各种未知code的报错
        default: {
          EasyLoading.instance.contentPadding = EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          );
          EasyLoading.showToast(res.msg, toastPosition: EasyLoadingToastPosition.bottom);

          if (fail != null) {
            fail(res);
          }
        }
        break;
      }

      /// 关闭Loading
      EasyLoading.dismiss();

    } catch (e) {
      EasyLoading.instance.contentPadding = EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      );
      EasyLoading.showToast('未知服务器错误', toastPosition: EasyLoadingToastPosition.bottom);
    }

    if (complete != null) {
      complete();
    }
  }
}

/// 响应值实例
class Res {
  final int code;
  final String msg;
  var data;

  Res(this.code, this.msg, this.data);

  Res.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        msg = json['msg'],
        data = json['data'];

  Map<String, dynamic> toJson() => {
    'code': code,
    'msg': msg,
    'data': data,
  };
}
