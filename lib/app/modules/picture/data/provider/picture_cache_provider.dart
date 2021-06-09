import 'package:calculator/core/cache/cache_helper.dart';
import 'package:camera/camera.dart';

class PictureCacheProvider {
  final CacheHelper _helper = CacheHelper();

  saveToCache(XFile image) async {
    await _helper.save('last_picture', image.path);
  }

  retrieveFromCache() async {
    try {
      final String result = await _helper.read('last_picture');
      return result;
      
    } catch(e) {
      print(e);
    }
    
  }
}