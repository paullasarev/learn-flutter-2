// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beers_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      (json['average'] as num?)?.toDouble(),
      json['reviews'] as int?,
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'average': instance.average,
      'reviews': instance.reviews,
    };

Beer _$BeerFromJson(Map<String, dynamic> json) => Beer(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      image: json['image'] as String?,
    )..rating = json['rating'] == null
        ? null
        : Rating.fromJson(json['rating'] as Map<String, dynamic>);

Map<String, dynamic> _$BeerToJson(Beer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
      'rating': instance.rating,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _BeersClient implements BeersClient {
  _BeersClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.sampleapis.com/beers/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Beer>> getAles() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Beer>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/ale',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Beer.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
