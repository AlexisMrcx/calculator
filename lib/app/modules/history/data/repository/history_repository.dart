import 'package:calculator/app/modules/history/data/provider/history_cache_provider.dart';

class HistoryRepository {
  final HistoryCacheProvider _historyCache = HistoryCacheProvider();

  saveResult(double result) async {
    await _historyCache.saveToCache(result);
  }

  Future<String> retrieve() async {
    return await _historyCache.retrieveFromCache();
  }
}