// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getWeatherHash() => r'427d338a34f5d75ecc1d35493f185031b0ab9915';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getWeather].
@ProviderFor(getWeather)
const getWeatherProvider = GetWeatherFamily();

/// See also [getWeather].
class GetWeatherFamily extends Family<AsyncValue<Weather?>> {
  /// See also [getWeather].
  const GetWeatherFamily();

  /// See also [getWeather].
  GetWeatherProvider call({
    String? lat,
    String? long,
  }) {
    return GetWeatherProvider(
      lat: lat,
      long: long,
    );
  }

  @override
  GetWeatherProvider getProviderOverride(
    covariant GetWeatherProvider provider,
  ) {
    return call(
      lat: provider.lat,
      long: provider.long,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getWeatherProvider';
}

/// See also [getWeather].
class GetWeatherProvider extends AutoDisposeFutureProvider<Weather?> {
  /// See also [getWeather].
  GetWeatherProvider({
    String? lat,
    String? long,
  }) : this._internal(
          (ref) => getWeather(
            ref as GetWeatherRef,
            lat: lat,
            long: long,
          ),
          from: getWeatherProvider,
          name: r'getWeatherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getWeatherHash,
          dependencies: GetWeatherFamily._dependencies,
          allTransitiveDependencies:
              GetWeatherFamily._allTransitiveDependencies,
          lat: lat,
          long: long,
        );

  GetWeatherProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lat,
    required this.long,
  }) : super.internal();

  final String? lat;
  final String? long;

  @override
  Override overrideWith(
    FutureOr<Weather?> Function(GetWeatherRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetWeatherProvider._internal(
        (ref) => create(ref as GetWeatherRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lat: lat,
        long: long,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Weather?> createElement() {
    return _GetWeatherProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetWeatherProvider &&
        other.lat == lat &&
        other.long == long;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lat.hashCode);
    hash = _SystemHash.combine(hash, long.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetWeatherRef on AutoDisposeFutureProviderRef<Weather?> {
  /// The parameter `lat` of this provider.
  String? get lat;

  /// The parameter `long` of this provider.
  String? get long;
}

class _GetWeatherProviderElement
    extends AutoDisposeFutureProviderElement<Weather?> with GetWeatherRef {
  _GetWeatherProviderElement(super.provider);

  @override
  String? get lat => (origin as GetWeatherProvider).lat;
  @override
  String? get long => (origin as GetWeatherProvider).long;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
