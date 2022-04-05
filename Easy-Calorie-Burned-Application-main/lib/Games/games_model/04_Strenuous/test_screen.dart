import 'package:flutter/material.dart';
import 'package:mobile_final/Games/games_model/04_Strenuous/03_standing_twist/pose_detector_views_standing_twist.dart';
import 'package:mobile_final/Games/games_model/04_Strenuous/04_elbow_plank/pose_detector_views_elbow_plank.dart';
import 'package:mobile_final/Games/games_model/04_Strenuous/05_bend_side/pose_detector_views_bend_side.dart';

class test_screen_S extends StatefulWidget {
  const test_screen_S({Key? key}) : super(key: key);

  @override
  _test_screen_SState createState() => _test_screen_SState();
}

class _test_screen_SState extends State<test_screen_S> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test_screen_S'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Text('01 standing_twist'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PoseDetectorView_standing_twist(
                                      // useClassifier: true,
                                      // isActivity: true,
                                      )));
                    }),
                ElevatedButton(
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Text('02 elbow_plank'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PoseDetectorView_elbow_plank(
                                      // useClassifier: true,
                                      // isActivity: true,
                                      )));
                    }),
                ElevatedButton(
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Text('03 bend_side'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PoseDetectorView_bend_side(
                                      // useClassifier: true,
                                      // isActivity: true,
                                      )));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
