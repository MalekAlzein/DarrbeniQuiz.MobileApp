import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_templete/ui/shared/utils.dart';
import 'package:get/get.dart';

import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

// class LocationService {
//   Location location = new Location();

//   Future<LocationData?> getUserCurrentLocation({bool hideLoader = true}) async {
//     //اجباري يطلع
//     LocationData _locationData;

//     if (!await isLocationEnabeld()) return null;

//     if (!await isPermissionGranted()) return null;
// //? need time
// // i can connectivity if you offline show message no internet
//     customLoader();

//     _locationData = await location.getLocation();

//     if (hideLoader) BotToast.closeAllLoading();

//     return _locationData;
//   }

//   Future<geo.Placemark?> getAddressInfo(LocationData locationData,
//       //send location replay list of location marks
//       //who true reply first replay
//       {bool showLoader = true}) async {
//     if (showLoader) customLoader();

//     List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
//         locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);

//     BotToast.closeAllLoading();

//     if (placemarks.isNotEmpty) {
//       return placemarks[0];
//     } else {
//       return null;
//     }
//   }

//   Future<geo.Placemark?> getCurrentAddressInfo() async {
//     //info current
//     return await getAddressInfo(
//         //always need vpn
//         await getUserCurrentLocation(hideLoader: false) ??
//             LocationData.fromMap({}),
//         showLoader: false);
//   }

//   Future<bool> isLocationEnabeld() async {
//     bool _serviceEnabled;
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         if (AppConfig.isLocationRequired) return false;
//         //!-- Message to show --

//         //! dailog yes no if yes location.requestService();
//         //false out
//       }
//     }
//     return _serviceEnabled;
//   }

//   Future<bool> isPermissionGranted() async {
//     PermissionStatus permissionStatus = await location.hasPermission();
//     if (permissionStatus == PermissionStatus.granted) {
//       return false;
//     } else {
//       permissionStatus = await location.requestPermission();
//       if (permissionStatus != PermissionStatus.granted) {
//         Get.dialog(
//           AlertDialog(
//             title: Text("Attention please"),
//             content: Text("you should allow location"),
//             actions: <Widget>[
//               TextButton(
//                 child: Text("Exit"),
//                 onPressed: () => exit(0),
//               ),
//             ],
//           ),
//         );
//         return false;
//       }
//       return true;
//     }
//   }
// }
// import 'package:bot_toast/bot_toast.dart';
// import 'package:location/location.dart';
// import 'package:geocoding/geocoding.dart' as geo;

// class LocationService {
//   Location location = new Location();

//   Future<LocationData?> getUserCurrentLocation({bool hideLoader = true}) async {
//     LocationData _locationData;

//     if (!await isLocationEnabeld()) return null;

//     if (!await isPermissionGranted()) return null;

//     customLoader();

//     _locationData = await location.getLocation();

//     if (hideLoader) BotToast.closeAllLoading();

//     return _locationData;
//   }

//   Future<geo.Placemark?> getAddressInfo(LocationData locationData,
//       {bool showLoader = true}) async {
//     if (showLoader) customLoader();

//     List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
//         locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);

//     BotToast.closeAllLoading();

//     if (placemarks.isNotEmpty) {
//       return placemarks[0];
//     } else {
//       return null;
//     }
//   }

//   Future<geo.Placemark?> getCurrentAddressInfo() async {
//     return await getAddressInfo(
//         await getUserCurrentLocation(hideLoader: false) ??
//             LocationData.fromMap({}),
//         showLoader: false);
//   }

//   Future<bool> isLocationEnabeld() async {
//     bool _serviceEnabled;
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         //!-- Message to show --
//         return false;
//       }
//     }
//     return _serviceEnabled;
//   }

//   Future<bool> isPermissionGranted() async {
//     PermissionStatus _permissionGranted;

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         //!-- Message to show --
//         return false;
//       }
//     }

//     return _permissionGranted == PermissionStatus.granted;
//   }
// }

import 'package:bot_toast/bot_toast.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

import '../../app/app_config.dart';

class LocationService {
  Location location = Location();

  Future<LocationData?> getUserCurrentLocation({bool hideLoader = true}) async {
    LocationData locationData;

    if (!await isLocationEnabeld()) {
      return null;
    }

    if (!await isPermissionGranted()) {
      return null;
    }

    customLoader();

    locationData = await location.getLocation();

    if (hideLoader) BotToast.closeAllLoading();

    return locationData;
  }

  Future<geo.Placemark?> getAddressInfo(LocationData locationData,
      {bool showLoader = true}) async {
    if (showLoader) customLoader();

    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);

    BotToast.closeAllLoading();

    if (placemarks.isNotEmpty) {
      CustomToast.showMessage(message: placemarks[0].country.toString());

      return placemarks[0];
    } else {
      return null;
    }
  }

  Future<geo.Placemark?> getCurrentAddressInfo() async {
    LocationData loc = await getUserCurrentLocation(hideLoader: false) ??
        LocationData.fromMap({});
    return await getAddressInfo(loc, showLoader: false)
        .then((value) => CustomToast.showMessage(message: ''));
  }

  Future<bool> isLocationEnabeld() async {
    bool serviceEnabled;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        if (AppConfig.isLocationRequired) {
          CustomToast.showMessage(message: 'enable the location');
        }
        return false;
      }
    }

    return serviceEnabled;
  }

  Future<bool> isPermissionGranted() async {
    PermissionStatus permissionGranted;

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        if (AppConfig.isLocationRequired) {
          CustomToast.showMessage(message: 'location is required');
        }

        return false;
      }
    }

    return permissionGranted == PermissionStatus.granted;
  }
}
