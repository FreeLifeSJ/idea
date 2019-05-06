import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatefulWidget {
  @override
  SwiperWidgetState createState() {
    return SwiperWidgetState();
  }
}

class SwiperWidgetState extends State<SwiperWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 200.0,
        child: Swiper(
          itemBuilder: _swiperBuilder,
          itemCount: 4, //
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          )),
          control: new SwiperControl(),
          scrollDirection: Axis.horizontal,
          autoplay: true,
          onTap: (index) => print('点击了第$index个'),
        ));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    switch (index) {
      case 0:
        return (new Image.asset(
          'assets/university/01.jpg',
          //height: 160.0,
          fit: BoxFit.fill,
        ));
        break;
      case 1:
        return (new Image.asset(
          'assets/university/02.jpg',
          //height: 160.0,
          fit: BoxFit.fill,
        ));
        break;
      case 2:
        return (new Image.asset(
          'assets/university/03.jpg',
          //height: 160.0,
          fit: BoxFit.fill,
        ));
        break;
      default:
        return (new Image.asset(
          'assets/university/04.jpg',
          fit: BoxFit.fill,
        ));
    }
  }
}
