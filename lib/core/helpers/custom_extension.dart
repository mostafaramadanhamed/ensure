
extension StringExtension on String? {
  bool isNullOrEmpty() {
    return this == null || this=='';
  }
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}

extension MapExtension<K,V> on Map<K,V>? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }
}