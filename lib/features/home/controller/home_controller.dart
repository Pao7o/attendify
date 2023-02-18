import 'package:attendify/features/home/repo/home_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController {
  final HomeRepo repo;

  HomeController(this.repo);

  Future<List<Placemark>> getCurrentLocation() async {
    List<Placemark> placemarks = [];
    await repo.getCurrentLocation().then((value) async {
      placemarks =
          await repo.getNameOfLocation(LatLng(value.latitude, value.longitude));
    });

    return placemarks;
  }
}

final homeControllerProvider = Provider(
  (ref) {
    return HomeController(ref.read(homeRepoProvider));
  },
);
