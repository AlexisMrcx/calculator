import 'package:calculator/core/cache/cache_helper.dart';

class HistoryCacheProvider{
  final CacheHelper _helper = CacheHelper();

  saveToCache(double result) async {
    await _helper.save('last_result', result.toString());
  }

  retrieveFromCache() async {
    try {
      final String result = await _helper.read('last_result');
      return result;
      
    } catch(e) {
      print(e);
    }
    
  }
}