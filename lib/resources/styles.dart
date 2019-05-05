import 'package:flutter/material.dart';
import 'dimens.dart';
import 'colours.dart';

class TextStyles{
  //const可以保证里面内容不被改变吗 还是只能保证引用不变  const和不const有什么区别呢
  //特别注意 如果像以下将TextStyle定义成const 那么fonsSize后的Dimens.font_sp16会被认为是int，类型会不通过，把dimens里面的值变成16.0就通过了
/*  static const TextStyle listTitle = TextStyle(
    fontSize: Dimens.font_sp16,
    fontWeight: FontWeight.bold,
  );*/
  static TextStyle listTitle = TextStyle(
      fontSize: Dimens.font_sp16,
      fontWeight: FontWeight.bold,
      color: Colours.text_dark
  );

  static TextStyle listTitleBigger = TextStyle(
      fontSize: Dimens.font_sp18,
      fontWeight: FontWeight.bold,
      color: Colours.text_dark
  );


  static TextStyle listContent = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.text_dark
  );

  static TextStyle listExtra = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_gray,
  );

  static TextStyle blueBold = TextStyle(
    fontSize: Dimens.font_sp16,
    color: Colors.blueAccent,
    fontWeight: FontWeight.w400
  );
}


class Gaps{
  static SizedBox hGap5 = SizedBox(width: Dimens.gap_dp5,);
  static SizedBox hGap10 = SizedBox(width: Dimens.gap_dp10,);
  static SizedBox hGap15 = SizedBox(width: Dimens.gap_dp15,);
  static SizedBox hGap3 = SizedBox(width: Dimens.gap_dp3);

  static SizedBox vGap5 = SizedBox(height: Dimens.gap_dp5,);
  static SizedBox vGap10 = SizedBox(height: Dimens.gap_dp10,);
  static SizedBox vGap15 = SizedBox(height: Dimens.gap_dp15,);
  static SizedBox vGap16 = SizedBox(height: Dimens.gap_dp16,);
}