import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  //String time = "loading";

  void setupWorldTime() async {
    WorldTime obj = WorldTime(location: "Kolkata/India",flag: "india.jpg", urll: "Asia/Kolkata");
    await obj.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments : {
      'flag' : obj.flag,
      'location' : obj.location,
      'time' : obj.time,
      'daytime' : obj.daytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}