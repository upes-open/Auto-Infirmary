import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
import 'package:flutter/material.dart';



Map plotMap(MapController controller){

  return  Map(
    controller: controller,
    provider: const CachedGoogleMapProvider(), // This trailing comma makes auto-formatting nicer for build methods.
  );
}

class CachedGoogleMapProvider extends MapProvider {
  const CachedGoogleMapProvider();

  @override
  ImageProvider getTile(int x, int y, int z) {
    //Can also use CachedNetworkImageProvider.
    return NetworkImage(
        'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425');
  }
}