

import 'DaoResult.dart';
import '../mode/HomeArticalBean.dart';
import '../mode/HomeBannerBean.dart';
import '../net/Address.dart';
import '../net/Api.dart';

class WanAndroidDao{
  static getHomePageArticalDao() async {
    String url = Address.getHomePageArtical();
    var res = await HttpManager.netFetch(url, null, null, null);
    if(res != null && res.result) {
      var data = res.data;
      if(data == null || data.length == 0) {
        return await new DataResult([],true);
      }
      var response = HomeArticalBean.fromJson(data);
      return await new DataResult(response,true);
    }else {
      return await new DataResult(null,false);
    }
  }

  static getHomePageBannerDao() async {
    String url = Address.getHomePageBanner();
    var res = await HttpManager.netFetch(url, null, null, null);
    if(res != null && res.result) {
      var data = res.data;
      if(data == null || data.length == 0) {
        return await new DataResult([],true);
      }
      var response = HomeBannerBean.fromJson(data);
      return await new DataResult(response,true);
    }else {
      return await new DataResult(null,false);
    }
  }
}