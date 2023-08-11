import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("项目管理"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add), tooltip: "创建新项目",),
          IconButton(onPressed: (){findWorks(context);}, icon: const Icon(Icons.refresh), tooltip: "刷新列表",),
          homeMenu(context)
        ],
      ),
      body: const Column(),
    );
  }

  void findWorks(BuildContext context){
    var workList = Directory('/Users/bluedream/Documents/mstd-cp/');
    if(!workList.existsSync()){
      workList.create();
      GFToast.showToast("初始化完成", context);
    }
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