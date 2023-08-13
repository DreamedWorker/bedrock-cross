import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mstd_cp/control/home_control.dart';
import 'package:mstd_cp/screens/blueprint/model_choose.dart';

class HomeScreen extends StatelessWidget {
  final homeControl = Get.put(HomeControl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("项目管理"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){ Get.to(() => ModelChoose()); }, icon: const Icon(Icons.add), tooltip: "创建新项目",),
          IconButton(onPressed: (){findWorks(context);}, icon: const Icon(Icons.refresh), tooltip: "刷新列表",),
          homeMenu(context)
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: projectLists(context),
      ),
    );
  }

  Widget projectLists(BuildContext buildContext){
    var worksPath = Directory('/Users/bluedream/Documents/mstd-cp/workspace');
    if(!worksPath.existsSync()){
      worksPath.createSync();
    }
    var workList = worksPath.listSync();
    return Obx(() => ListView.builder(
      itemCount: homeControl.simpleFileList.value.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Text(homeControl.simpleFileList.value[index].path.split('/').last),
          leading: const Icon(Icons.file_present),
        );
      }));
  }

  void findWorks(BuildContext context){
    homeControl.updateFileList();
  }

  Widget homeMenu(BuildContext context){
    return PopupMenuButton(itemBuilder: (context){
      return <PopupMenuEntry<String>>[
        const PopupMenuItem(value: 'bin',child: Text("项目仓库"),),
        const PopupMenuItem(value: 'import',child: Text('导入项目'),),
        const PopupMenuItem(value: 'dev-tool',child: Text('开发工具'),),
        const PopupMenuItem(value: 'settings',child: Text('设置'),),
        const PopupMenuItem(value: 'about',child: Text('关于'),)
      ];
    },
    tooltip: '更多选项',
    icon: const Icon(Icons.more_vert),
    onSelected: (value) => {
      GFToast.showToast(value, context)
    },
    );
  }
}