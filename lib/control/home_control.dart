import 'dart:io';

import 'package:get/get.dart';

class HomeControl extends GetxController {
  var demo = "sad".obs;
  var simpleFileList = <FileSystemEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    var worksPath = Directory('/Users/bluedream/Documents/mstd-cp/workspace');
    if(!worksPath.existsSync()){
      worksPath.createSync();
    }
    var tempList = worksPath.listSync();
    for (var element in tempList) {
      if(!element.path.endsWith('Store')){
        simpleFileList.add(element);
      }
    }
    simpleFileList.value = tempList;
    if (Platform.isMacOS){
      simpleFileList.removeAt(0);
    }
  }

  void updateFileList(){
    var worksPath = Directory('/Users/bluedream/Documents/mstd-cp/workspace');
    if(!worksPath.existsSync()){
      worksPath.createSync();
    }
    var tempList = worksPath.listSync();
    for (var element in tempList) {
      if(!element.path.endsWith('Store')){
        simpleFileList.add(element);
      }
    }
    simpleFileList.value = tempList;
    if (Platform.isMacOS){
      simpleFileList.removeAt(0);
    }
    update();
  }

  String getDemo(){
    return demo.value;
  }
}