import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'beers_api.g.dart';

@RestApi(baseUrl: "https://api.sampleapis.com/beers/")
abstract class BeersClient {
  factory BeersClient(Dio dio, {String baseUrl}) = _BeersClient;

  @GET("/ale")
  Future<List<Beer>> getAles();
}

@JsonSerializable()
class Rating {
  double? average;
  int? reviews;

  Rating(this.average, this.reviews);

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class Beer {
  int? id;
  String? name;
  String? price;
  String? image;
  Rating? rating;

  Beer({this.id, this.name, this.price, this.image});

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);
  Map<String, dynamic> toJson() => _$BeerToJson(this);
}
