import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class locationServices extends StatefulWidget {
  const locationServices({super.key});

  @override
  State<locationServices> createState() => _locationServicesState();
}

class _locationServicesState extends State<locationServices> {
  getCurrentLocation()async{
    LocationPermission permission=await Geolocator.checkPermission();
    if(permission==LocationPermission.denied || permission==LocationPermission.deniedForever) {
      log("Location Denied");
      LocationPermission ask = await Geolocator.requestPermission();
    }
    else{
      Position currentposition=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      log("latitute=${currentposition.latitude.toString()}");
      log("longitude=${currentposition.longitude.toString()}");


    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Geolocator"),
        centerTitle:true,
      ),
      body: Center(child: ElevatedButton(onPressed: (){
        getCurrentLocation();
      }, child: Text("Grab Location")))
    );
  }
}
