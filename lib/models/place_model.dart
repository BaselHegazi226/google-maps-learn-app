import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  final String id;
  final String name;
  final String description;
  final LatLng latLng;

  const PlaceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.latLng,
  });
}

const List<PlaceModel> places = [
  PlaceModel(
    id: '1',
    name: 'قرية مجر',
    description: 'قريه من القرى المحرومه',
    latLng: LatLng(31.027352656209004, 31.40487374482365),
  ),
  PlaceModel(
    id: '2',
    name: 'ميت الخولي مؤمن',
    description: 'قريه غريبه اولى مره اعرفها',
    latLng: LatLng(31.11787646756301, 31.659464781597002),
  ),
  PlaceModel(
    id: '3',
    name: 'بهيت الحجارة',
    description: 'قريه كلها حجاره',
    latLng: LatLng(31.030836110573638, 31.29554268664564),
  ),
];
