class CacheConfig {
  /// キャッシュの有効期限（分）
  static const int cacheDurationMinutes = 30;

  /// キャッシュが有効かどうかを判定
  static bool isValidCache(DateTime? lastCacheTime) {
    if (lastCacheTime == null) return false;

    final now = DateTime.now();
    final difference = now.difference(lastCacheTime);
    return difference.inMinutes < cacheDurationMinutes;
  }
}
