import 'package:flutter/material.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';

class EditPersonalProfilePage extends StatelessWidget{
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _introductionController = TextEditingController();
  TextEditingController _businessController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("编辑个人资料"),
      ),
      body:_buildBody(),
    );
  }

  Widget _buildBody(){
    return ListView(
      children: <Widget>[
        Center(
          heightFactor: 1.5,
          child: GestureDetector(
            //TODO:本地图片上传
            onTap: (){print("实现从本地图片上传图片的功能");},
            child: Container(
              height: 80,
              width: 80,
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage("images/avatar4.jpg"),
                    radius: 40,
                  ),
                  Align(
                    child: Icon(Icons.photo_camera,color: Colors.blueAccent,),
                    alignment: Alignment.bottomRight,
                  )
                ],
              ),
            ),
          )
        ),
        _buildfieldsList(),
      ],
    );
  }

  Widget _buildfieldsList(){
    //TODO:设置各个TextField的默认文本
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          _editItem(iconData: Icons.person,labeltext: "用户名",controller: _nameController,),
          _buildCheckBoxRow(),
          _editItem(iconData: Icons.format_quote,labeltext: "一句话描述自己",controller: _descriptionController,),
          _editItem(iconData: Icons.assignment,labeltext: "个人介绍",controller: _introductionController,),
          _editItem(iconData: Icons.business,labeltext: "行业",controller: _businessController,)
        ],
      ),
    );
  }

  Widget _buildCheckBoxRow(){
    return Container(
      child:Row(
        children: <Widget>[
          Icon(Icons.all_inclusive,color: Colours.iconColorGrey,),
          Gaps.hGap15,
          Expanded(
            child: Row(
              children: <Widget>[
                Checkbox(
                  //是否允许三态
                  tristate: false,
                  value:true ,
                  onChanged:(bool newValue){},
                ),
                Gaps.hGap5,
                Text("男"),
                Gaps.hGap15,
                Checkbox(
                  tristate: false,
                  value: false,
                  onChanged: (bool newValue){},
                ),
                Gaps.hGap5,
                Text("女"),
              ],
            ),
          )
        ],
      ) ,
    );
  }
}

class _editItem extends StatelessWidget {
  final IconData iconData;
  final String labeltext;
  final TextEditingController controller;
  //TODO:为什么命名参数不能以下划线开头
  _editItem({@required this.iconData,@required this.labeltext, @required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(iconData,color: Colours.iconColorGrey,),
          Gaps.hGap15,
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: labeltext,
              ),
            ),
          )
        ],
      ),
    );
  }
}
