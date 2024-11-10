import 'package:flutter/foundation.dart';

enum DeviceType{
  Mobile(1),
  PC(2),
  Pad(3),
  Web(4);
  final int type;
  const DeviceType(this.type);
}



class DeviceInfo{
  static final int deviceType = _initDeviceInfo();

  static int _initDeviceInfo(){
    if (kIsWeb){
      return DeviceType.Web.type;
    }
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.fuchsia) {
      if (false){
        return DeviceType.Pad.type;
      }
      return DeviceType.Mobile.type;
    }
    if (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS){
      return DeviceType.PC.type;
    }
    return DeviceType.Mobile.type;
  }
}