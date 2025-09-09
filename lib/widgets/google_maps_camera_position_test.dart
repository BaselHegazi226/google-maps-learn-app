import 'package:flutter/material.dart';
import 'package:google_map_learn_app/models/place_model.dart';
import 'package:google_map_learn_app/widgets/change_sytle_drop_down_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'map_styles.dart';

class GoogleMapsCameraPositionTest extends StatefulWidget {
  const GoogleMapsCameraPositionTest({super.key});

  @override
  State<GoogleMapsCameraPositionTest> createState() =>
      _GoogleMapsCameraPositionTestState();
}

class _GoogleMapsCameraPositionTestState
    extends State<GoogleMapsCameraPositionTest> {
  late CameraPosition initialCameraPosition;
  late CameraTargetBounds cameraTargetBounds;
  late GoogleMapController googleMapController;
  late String? dropdownValue = 'standard';
  Set<Marker> markers = {};
  @override
  void initState() {
    //المكان اللي انا عايزه يظهر معايا
    initialCameraPosition = CameraPosition(
      target: LatLng(31.027352656209004, 31.40487374482365),
      zoom: 17,
    );
    //الحدود اللي انا مش هخرج منها
    cameraTargetBounds = CameraTargetBounds(
      LatLngBounds(
        southwest: LatLng(30.972166704509146, 31.325876402048195),
        northeast: LatLng(31.11802345319878, 31.425576215376136),
      ),
    );
    createMarker();
    super.initState();
  }

  Future<String> customizeMapStyle({required String mapStyle}) async {
    var style = await DefaultAssetBundle.of(context).loadString(mapStyle);
    return style;
  }

  void createMarker() {
    var myPlaceModels = places.map((placeModel) {
      return Marker(
        infoWindow: InfoWindow(
          title: placeModel.name,
          snippet: placeModel.description,
        ),
        markerId: MarkerId(placeModel.id),
        position: placeModel.latLng,
      );
    }).toSet();
    markers.addAll(myPlaceModels);
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          markers: markers,
          initialCameraPosition: initialCameraPosition,
          //cameraTargetBounds: cameraTargetBounds,
          onMapCreated: (controller) {
            googleMapController = controller;
          },
        ),

        Positioned(
          top: 16,
          right: 16,
          child: SizedBox(
            width: 150,
            child: ChangeStyleDropdownButton(
              items: [
                'standard',
                'night',
                'sliver',
                'retro',
                'dark',
                'aubergine',
              ],
              dropdownValue: dropdownValue!,
              onChanged: (String? value) async {
                setState(() {
                  dropdownValue = value!;
                });
                var styleChosen = backMapStyle(mapStyle: dropdownValue);
                var customStyle = await customizeMapStyle(
                  mapStyle: styleChosen,
                );
                googleMapController.setMapStyle(customStyle);
              },
            ),
          ),
        ),
        // Positioned(
        //   left: 16,
        //   right: 16,
        //   bottom: 16,
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        //     onPressed: () {
        //       CameraPosition newLocation = CameraPosition(
        //         target: LatLng(31.04083806478717, 31.374506959127068),
        //         zoom: 12,
        //       );
        //       googleMapController.animateCamera(
        //         CameraUpdate.newCameraPosition(newLocation),
        //       );
        //     },
        //     child: Text(
        //       'change location',
        //       style: TextStyle(color: Colors.white, fontSize: 20),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  String backMapStyle({required String? mapStyle}) {
    switch (mapStyle) {
      case 'standard':
        return MapStyles.standardStyle;
      case 'retro':
        return MapStyles.retroStyle;
      case 'night':
        return MapStyles.nightStyle;
      case 'aubergine':
        return MapStyles.aubergineStyle;
      case 'dark':
        return MapStyles.darkStyle;
      case 'sliver':
        return MapStyles.sliverStyle;
      default:
        return MapStyles.standardStyle;
    }
  }
}

//zoom level for view
// world view 0-3
// country view 4-6
// city view 10-12
// street view 13-17
// building view 18-20
