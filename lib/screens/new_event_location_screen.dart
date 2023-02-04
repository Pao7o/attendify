import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/places.dart';

import '../features/common/app_colors.dart';
import '../features/common/constants.dart';
import '../responsive/responsive_flutter.dart';

class NewEventLocation extends StatefulWidget {
  const NewEventLocation({Key? key}) : super(key: key);

  @override
  State<NewEventLocation> createState() => _NewEventLocationState();
}

class _NewEventLocationState extends State<NewEventLocation> {
  AppColors appColors = AppColors();
  bool isExpanded = false;

  bool _fullscreen = false;
  String googleApikey = "AIzaSyD5MSB1CS_v2naDJIcRIKGg9fXWXcKmRyQ";
  GoogleMapController? mapController; //controller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(48.866667, 2.333333);
  static String location = "Search location";
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    if (Constants.darkTheme) {
      rootBundle.loadString('assets/map_styles/map_styles.txt').then((string) {
        _mapStyle = string;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF2F2644),
                    Color(0xFF4B4E69),
                    Color(0xFF8B81A4),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Test",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/images/new_event_location.png'),
                      InkWell(
                          onTap: () async {
                            var place = await PlacesAutocomplete.show(
                                context: context,
                                apiKey: googleApikey,
                                mode: Mode.overlay,
                                types: [],
                                strictbounds: false,
                                components: [Component(Component.country, 'fr')],
                                //google_map_webservice package
                                onError: (err) {
                                  print(err);
                                });

                            if (place != null) {
                              setState(() {
                                location = place.description.toString();
                              });
                              //form google_maps_webservice package
                              final plist = GoogleMapsPlaces(
                                apiKey: googleApikey,
                                apiHeaders: await GoogleApiHeaders().getHeaders(),
                                //from google_api_headers package
                              );
                              String placeid = place.placeId ?? "0";
                              final detail = await plist.getDetailsByPlaceId(placeid);
                              final geometry = detail.result.geometry!;
                              final lat = geometry.location.lat;
                              final lang = geometry.location.lng;
                              var newlatlang = LatLng(lat, lang);

                              //move map camera to selected place with animation
                              mapController?.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                      CameraPosition(target: newlatlang, zoom: 17)));
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.all(
                                ResponsiveFlutter.of(context).moderateScale(15)),
                            child: Card(
                              child: Container(
                                  padding: EdgeInsets.all(
                                      ResponsiveFlutter.of(context).moderateScale(4)),
                                  width: MediaQuery.of(context).size.width - 40,
                                  child: ListTile(
                                    leading: Image.asset(
                                      "assets/images/ic_map_picker.png",
                                      width: ResponsiveFlutter.of(context)
                                          .moderateScale(25),
                                    ),
                                    title: Text(
                                      location,
                                      style: TextStyle(
                                          fontSize: ResponsiveFlutter.of(context)
                                              .moderateScale(18)),
                                    ),
                                    trailing: Icon(Icons.search),
                                    dense: true,
                                  )),
                            ),
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          height: 280,
                          width: 370,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                                GoogleMap(
                                zoomControlsEnabled: false,
                                zoomGesturesEnabled: true,
                                //enable Zoom in, out on map
                                initialCameraPosition: CameraPosition(
                                  //inital position in map
                                  target: startLocation, //initial position
                                  zoom: 12.0, //initial zoom level
                                ),
                                mapType: MapType.normal,
                                //map type
                                onMapCreated: (controller) {
                                  //method called when map is created
                                  setState(() {
                                    mapController = controller;
                                    mapController?.setMapStyle(_mapStyle);
                                  });
                                },
                                onCameraMove: (CameraPosition cameraPositiona) {
                                  cameraPosition = cameraPositiona;
                                },
                                onCameraIdle: () async {
                                  List<Placemark> placemarks =
                                      await placemarkFromCoordinates(
                                          cameraPosition!.target.latitude,
                                          cameraPosition!.target.longitude);
                                  setState(() {
                                    location = placemarks
                                            .first.administrativeArea
                                            .toString() +
                                        ", " +
                                        placemarks.first.street.toString();
                                  });
                                },
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _fullscreen = !_fullscreen;
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return StatefulBuilder(
                                          builder:
                                              (BuildContext context, setState) {
                                            return Dialog(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Container(
                                                  color: Colors.transparent,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Stack(
                                                    children: [
                                                      GoogleMap(
                                                        zoomControlsEnabled:
                                                            false,
                                                        zoomGesturesEnabled:
                                                            true,
                                                        initialCameraPosition:
                                                            CameraPosition(
                                                          target: startLocation,
                                                          zoom: 12.0,
                                                        ),
                                                        mapType: MapType.normal,
                                                        onMapCreated:
                                                            (controller) {
                                                          setState(() {
                                                            mapController =
                                                                controller;
                                                            mapController
                                                                ?.setMapStyle(
                                                                    _mapStyle);
                                                          });
                                                        },
                                                        onCameraMove:
                                                            (CameraPosition
                                                                cameraPositiona) {
                                                          cameraPosition =
                                                              cameraPositiona;
                                                        },
                                                        onCameraIdle: () async {
                                                          List<Placemark>
                                                              placemarks =
                                                              await placemarkFromCoordinates(
                                                                  cameraPosition!
                                                                      .target
                                                                      .latitude,
                                                                  cameraPosition!
                                                                      .target
                                                                      .longitude);
                                                          setState(() {
                                                            location = placemarks
                                                                    .first
                                                                    .administrativeArea
                                                                    .toString() +
                                                                ", " +
                                                                placemarks.first
                                                                    .street
                                                                    .toString();
                                                          });
                                                        },
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: IconButton(
                                                          icon: Icon(
                                                            Icons.arrow_back,
                                                            color: Colors.white,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors
                                                                .transparent,
                                                          ),
                                                          child: Icon(
                                                            Icons.pin_drop,
                                                            size: 40,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment.bottomCenter,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Colors.green,
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: IconButton(
                                                              icon: Icon(Icons.check),
                                                              color: Colors.white,
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white10,
                                    ),
                                    child: Icon(
                                      Icons.fullscreen,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
