import 'package:flutter/material.dart';
import 'dart:ui';

/// 画布尺寸计算
class Adapt {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static int canvasWidth = 750; // 画布宽度
  static double _width = mediaQuery.size.width;
  static double _height = mediaQuery.size.height;
  static double _topbarH = mediaQuery.padding.top;
  static double _botbarH = mediaQuery.padding.bottom;
  static double _pixelRatio = mediaQuery.devicePixelRatio;
  static var _ratio;
  static init(int number){
    int uiwidth = number is int ? number : canvasWidth;
    _ratio = _width / uiwidth;
  }

  /// px转实际尺寸
  ///
  /// [number] 需要转换的像素值
  static px(number){
    if(!(_ratio is double || _ratio is int)){Adapt.init(canvasWidth);}
    return number * _ratio;
  }

  /// 获取1px对应的实际尺寸
  static onepx(){
    return 1/_pixelRatio;
  }

  /// 屏幕宽度
  static screenW(){
    return _width;
  }

  /// 屏幕高度
  static screenH(){
    return _height;
  }

  /// 顶部被系统遮挡的高度（刘海屏或系统状态栏）
  static padTopH(){
    return _topbarH;
  }

  /// 底部被系统遮挡的高度（刘海屏或系统状态栏）
  static padBotH(){
    return _botbarH;
  }
}