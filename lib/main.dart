import 'package:flutter/material.dart';
import 'page/index.dart';
import 'page/mypage_file/index.dart';
import 'page/notification_file/index.dart';
import 'page/idea_file/index.dart';
import 'page/splash_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'state_manange/redux.dart';
import 'package:gaozhongzhihu/resources/resources_index.dart';
import 'package:flustars/flustars.dart';
//TODO:建立Github分支  已ok
//TODO:建立index.dart文件 避免过多import  已ok
//TODO:进行网络功能类的定义和封装
//TODO:定义相关实体，编写和后台数据交流的接口
//TODO:重新规划项目文件结构
//TODO:设置可以切换不同主题的功能
void main() => runApp(
  MyApp()
);

class MyApp extends StatefulWidget{
  @override
  State createState() => MyAppState();
}
class MyAppState extends State<MyApp>{
  final store = Store<IdeaState>(
    appReducer,
    initialState: IdeaState(Colours.app_main)
  );
 @override
  void initState(){
    super.initState();
    _initAsync();
  }

  void _initAsync() async{
    await SpUtil.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider<IdeaState>(
      store: store,
      child: StoreBuilder<IdeaState>(builder: (context,store){
        return MaterialApp(
          title: "gaozhongzhihu",
          home: SplashPage(),
          //initialRoute: '/login',  不采用一进app就要求登录的方式 将SplashPage作为HomePage 然后进行代替
          routes: {
            '/login':(context)=>LoginPage(),
            'homepage':(context)=>HomePage(),
            '/my_favorite':(context)=>MyFavoritePage(),
            '/my_concern':(context)=>MyConcernPage(),
            '/my_create':(context)=>MyCreatePage(),
            '/settings':(context)=>SettingsPage(),
            '/ask':(context)=>AskPage(),
            '/search':(context)=>SearchPage(),
            '/message':(context)=>MessagePage(),
            '/notification_settings':(context)=>NotificationSettingsPage(),
            '/idea_edit':(context)=>IdeaEditPage(),
          },
          theme: _buildZhiHuTheme(store),
        );
      }),
    );
  }
}
ThemeData _buildZhiHuTheme(Store<IdeaState> store){
  ThemeData base = ThemeData.light();
  return base.copyWith(
    //紫色 高贵色 力量感 象征知识就是就是力量 知识是高贵的
    primaryColor:store.state.themeColor ,
    accentColor: store.state.themeColor,//控制FloatingActionButton的颜色
    scaffoldBackgroundColor: Colors.grey.shade100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: Colors.lightGreen,
      textTheme:ButtonTextTheme.normal,
    ),
/*    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder()
    ),*/
  );
}

class HomePage extends StatefulWidget{
  @override
  State createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  int currentIndex = 0;
  List<String> titleList = ["首页","想法","大学","通知","我的"];
  @override
  Widget build(BuildContext context) {
    var bottomList = [
      BottomNavigationBarItem(icon: Icon(Icons.description),title:Text("首页"),),
      BottomNavigationBarItem(icon: Icon(Icons.lightbulb_outline),title:Text("想法")),
      BottomNavigationBarItem(icon: Icon(Icons.school),title: Text("大学")),
      BottomNavigationBarItem(icon: Icon(Icons.notifications_none),title:Text("通知")),
      BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("我的"))
    ];
    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(),
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        items:bottomList,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor:Colors.deepPurple,
         onTap: _onItemTapped,
      ),
    );
  }


//底部导航栏的响应动作
  void _onItemTapped(int index){
    setState(() {
      currentIndex = index;
    });
  }
  //获得Scaffold body部分的函数
  Widget _getBody(){
    switch(currentIndex){
      case 0:
        return ShouYePage();
      case 1:
        return IdeaPage();
      case 2:
        return UniversityPage();
      case 3:
        return InformPage();
      case 4:
        return MyPage();
      default:
        break;
    }
  }

  AppBar _buildAppBar(){
    switch(currentIndex){
      case 0 :
          return AppBar(
            leading: IconButton(icon: Icon(Icons.search),
                onPressed:() {
                  Navigator.pushNamed(context, '/search');
                }),
            title: Text(titleList[currentIndex]),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: (){
                  Navigator.pushNamed(context, '/ask');
                },)
            ],
          ) ;
      case 1:
          return AppBar(
            /*leading: IconButton(icon: Icon(Icons.search),
                onPressed:() {
                  Navigator.pushNamed(context, '/search');
                }),*/
            title: Text(titleList[currentIndex]),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.email),
                onPressed: (){
                  Navigator.pushNamed(context, '/message');
                },)
            ],
          );
      case 2:
        return AppBar(
          leading: IconButton(icon: Icon(Icons.search),
              onPressed:() {
                Navigator.pushNamed(context, '/search');
              }),
          title: Text(titleList[currentIndex]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.pushNamed(context, '/ask');
              },)
          ],
        );
      case 3:
        return AppBar(
          title: Text(titleList[currentIndex]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: (){
                Navigator.pushNamed(context, '/notification_settings');
              },)
          ],
        );
      case 4:
        return AppBar(
          leading: IconButton(icon: Icon(Icons.search),
              onPressed:() {
                Navigator.pushNamed(context, '/search');
              }),
          title: Text(titleList[currentIndex]),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.pushNamed(context, '/ask');
              },)
          ],
        );
    }
  }
}