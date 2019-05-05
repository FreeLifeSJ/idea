import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../widgets/swiper_bai.dart';

class UniversityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageContent(),
    );
  }
}

// 页内容
class PageContent extends StatefulWidget {
  @override
  createState() => new PageContentState();
}

// 添加 ListView 有序显示卡片内容
// 布局
//  1. 电子书推广广告图片
//  2. 按钮部分（Live、书店、付费咨询）
//     每行3个 child
//        每列2个 child
//  3. 已购内容 按此模板 复制出 学习记录
//  4. 今日优惠
//  5. Live 猜你喜欢
class PageContentState extends State<PageContent> {
  @override
  Widget build(BuildContext context) {
    // 封装 查看更多
    Row seeMore() {
      return new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Text(
            '查看更多',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Colors.blue.shade800,
            ),
          ),
          new Icon(Icons.keyboard_arrow_right, color: Colors.blue.shade800),
        ],
      );
    }

    // 实现 2. part one
    // 创建一个颜色自选，包含一个Icon、icon'sText 和 Text 的 Widget 列
    GestureDetector buildButtonPress(IconData icon, String iconText,
        String label, Color color, String routePath) {
      // Color color = Theme.of(context).primaryColor;
      return new GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routePath);
        },
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Icon(icon, color: color),
                // margin: const EdgeInsets.only(top: 8.0),
                SizedBox(
                  width: 5,
                ),
                new Text(
                  iconText,
                  style: new TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Text(
                label,
                style: new TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      );
    }

    // 实现 2 part two
    // 构建函数将图标直接添加到列（Column）中
    // 将文本放入容器以在文本上方添加填充，将其与图标分开。
    // 通过调用函数并传递icon和文本来构建这些列。
    // 然后在行的主轴方向通过 MainAxisAlignment.spaceEvenly
    // 平均的分配每个列占据的行空间。
    Widget buttonSection = new Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 三个按钮块，两个分割线
          buildButtonPress(
              Icons.offline_bolt, 'Live', '互动分享会', Colors.blue, '/wanandorid'),
          SizedBox(
            height: 50,
            width: 2,
            child: Container(
              color: Colors.grey.shade200,
            ),
          ),
          buildButtonPress(Icons.collections_bookmark, '书店', '精品电子书',
              Colors.green, '/bookstore'),
          SizedBox(
            height: 50,
            width: 2,
            child: Container(
              color: Colors.grey.shade200,
            ),
          ),
          buildButtonPress(Icons.monetization_on, '付费咨询', '精品电子书',
              Colors.deepPurpleAccent, '/bookstore'),
        ],
      ),
    );
    // 实现 3
    // 两行内容
    // 第一行用行容器包含两个列容器（这样可以使用左对齐和右对齐）
    Widget alreadyBoughtSection = new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 20,
          ), // 白色填充
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // part one
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ), // Row 内白色填充
                  new Icon(Icons.shopping_basket, color: Colors.blue.shade300),
                  SizedBox(
                    width: 20,
                  ), // Row 内白色填充
                  new Text(
                    '已购内容',
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              // part two
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //SizedBox(width: 20,), // Row 内白色填充
                  new Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                  SizedBox(
                    width: 20,
                  ), // Row 内白色填充
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ), // 白色填充
          // 分隔
          SizedBox(
            height: 3,
            child: Container(
              color: Colors.grey.shade200,
            ),
          ),
          SizedBox(
            height: 20,
          ), // 白色填充
          new Text(
            '展示一个已购内容',
            style: new TextStyle(
              color: Colors.grey[500],
            ),
          ),
          SizedBox(
            height: 20,
          ), // 白色填充
        ],
      ),
    );
    // 学习记录
    Widget alreadyLearnSection = new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 20,
          ), // 白色填充
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // part one
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ), // Row 内白色填充
                  new Icon(Icons.book, color: Colors.blue.shade300),
                  SizedBox(
                    width: 20,
                  ), // Row 内白色填充
                  new Text(
                    '学习记录',
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              // part two
              new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //SizedBox(width: 20,), // Row 内白色填充
                  new Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                  SizedBox(
                    width: 20,
                  ), // Row 内白色填充
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ), // 白色填充
          // 分隔
          SizedBox(
            height: 3,
            child: Container(
              color: Colors.grey.shade200,
            ),
          ),
          SizedBox(
            height: 20,
          ), // 白色填充
          new Text(
            '展示一条学习记录',
            style: new TextStyle(
              color: Colors.grey[500],
            ),
          ),
          SizedBox(
            height: 20,
          ), // 白色填充
        ],
      ),
    );
    // 实现 4
    Widget todaySpecial = new Container(
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // 第一行内容，分为两列
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 左上角标题
              new Column(
                children: [
                  SizedBox(
                    height: 10,
                  ), // 白色填充
                  new Text(
                    '今日优惠     ', // 使用空格进行填充对齐，可能会出问题
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  new Text(
                    '       精选内容  限时特价  ', // 使用空格进行填充对齐，可能会出问题
                    style: new TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              // 右上角倒计时
              SizedBox(
                // 代开发填充
                height: 50,
                width: 200,
                child: Container(
                  color: Colors.green,
                ),
              ),
            ],
          ),
          // 分隔
          SizedBox(
            height: 3,
            child: Container(
              color: Colors.grey.shade200,
            ),
          ),
          // 第二行内容，ListView 构建10个优惠内容
        ],
      ),
    );
    // 实现 5
    // 标题：图标 文字
    // 内容：四个结构一样的 “卡片”
    Widget dispalyLive = new Container(
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ), // Row 内白色填充
              buildButtonPress(
                  Icons.offline_bolt, 'Live 猜你喜欢', ' ', Colors.blue, '/wanandorid'),
            ],
          ),
          // 显示内容
          SizedBox(
            // 代开发填充
            height: 450,
            width: 400,
            child: Container(
              color: Colors.deepPurpleAccent,
            ),
          ),
          SizedBox(
            height: 20,
          ), // Row 内白色填充
          seeMore(),
          SizedBox(
            height: 20,
          ), // Row 内白色填充
        ],
      ),
    );
    // 整合
    return new ListView(
      children: [
        // 1.
        /*
          new Image.asset(
            'assets/live.png',
            height: 160.0,
            fit: BoxFit.fitWidth,
          ),*/
        new SwiperWidget(),
        buttonSection, // 2.
        // 分隔
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.grey.shade200,
          ),
        ),
        new GestureDetector(
          child: alreadyLearnSection, // 3.5
          onTap: () {
            Navigator.pushNamed(context, '/learning');
          },
        ),
        // 分隔
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.grey.shade200,
          ),
        ),
        new GestureDetector(
          child: alreadyBoughtSection, // 3.,
          onTap: () {
            Navigator.pushNamed(context, '/alreadybought');
          },
        ),
        // 分隔
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.grey.shade200,
          ),
        ),
        todaySpecial, // 4.
        // 分隔
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.grey.shade200,
          ),
        ),
        dispalyLive,
        //
        //
      ],
    );
  }
}
