import 'DaoResult.dart';
import '../mode/NewsDetailBean.dart';
import '../mode/NewsHistoryBean.dart';
import '../mode/NewsLatestBean.dart';
import '../net/Address.dart';
import '../net/Api.dart';

class ZhiHuDao {
  static getNewsLatestDao() async {
    String url = Address.getNewLatest();
    var res = await HttpManager.netFetch(url, null, null, null);
    if(res != null && res.result) {
      var data = res.data;
      if(data == null || data.length == 0) {
        return await new DataResult([],true);
      }
      var response = NewsLatestBean.fromJson(data);
      return await new DataResult(response,true);
    }else {
      return await new DataResult(null,false);
    }
  }

  static getNewsHistoryDao(String time) async {
    String url = Address.getNewsHistory(time);
    var res = await HttpManager.netFetch(url, null, null, null);
    if(res != null && res.result) {
      var data = res.data;
      if(data == null || data.length == 0) {
        return await new DataResult([],true);
      }
      var response = NewsHistoryBean.fromJson(data);
      return await new DataResult(response,true);
    }else {
      return await new DataResult(null,false);
    }
  }

  static getNewsDetailDao(String newId) async {
    String url = Address.getNewsDetail(newId);
    var res = await HttpManager.netFetch(url, null, null, null);
    if(res != null && res.result) {
      var data = res.data;
      if(data == null || data.length == 0) {
        return await new DataResult([],true);
      }
      var response = NewsDetailBean.fromJson(data);
      return await new DataResult(response,true);
    }else {
      return await new DataResult(null,false);
    }
  }
}