import 'package:calculator/app/modules/picture/data/provider/picture_cache_provider.dart';
import 'package:camera/camera.dart';

class PictureRepository {
  final PictureCacheProvider _pictureCache = PictureCacheProvider();

  saveResult(XFile image) async {
    await _pictureCache.saveToCache(image);
  }

  Future<String> retrieve() async {
    return await _pictureCache.retrieveFromCache();
  }
}