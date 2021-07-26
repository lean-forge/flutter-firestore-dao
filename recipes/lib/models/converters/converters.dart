import 'package:recipes/models/converters/index.dart';

/// Converter facade to provide a uniform interface for accessing converters.
class Converters {
  /// Utility method to access the [MapConverter] associated with the type [T].
  ///
  /// Supported types must be registered in [MapConverters._mapConverterMap]
  static MapConverter<T> mapConverter<T>() {
    return MapConverters.mapConverter<T>();
  }
}
