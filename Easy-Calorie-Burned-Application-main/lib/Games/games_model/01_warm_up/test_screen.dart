import 'package:flutter/material.dart';
import 'package:mobile_final/Games/games_model/01_warm_up/01_arm_stretch_and_full/pose_detector_views_arm_strech_and_full.dart';
import 'package:mobile_final/Games/games_model/01_warm_up/02_front_kicking/pose_detector_views_front_kicking.dart';
import 'package:mobile_final/Games/games_model/01_warm_up/03_foot_touching/pose_detector_views_foot_touching.dart';
import 'package:mobile_final/Games/games_model/02_mild/01_lunges/pose_detector_views_lunges.dart';
import 'package:mobile_final/Games/games_model/02_mild/03_arm_circles/pose_detector_views_arm_circles.dart';


class test_screen_W extends StatefulWidget {
  const test_screen_W({Key? key}) : super(key: key);

  @override
  _test_screen_WState createState() => _test_screen_WState();
}

class _test_screen_WState extends State<test_screen_W> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test_screen_W'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ElevatedButton(
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Text('01 arm_strech_and_full'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PoseDetectorView_arm_strech_and_full(
                                      // useClassifier: true,
                                      // isActivity: true,
                                      )));
                    }),
                ElevatedButton(
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Text('02 front_kicking'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PoseDetectorView_front_kicking(
                                      // useClassifier: true,
                                      // isActivity: true,
                                      )));
                    }),
                ElevatedButton(
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Text('03 foot_touching'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PoseDetectorView_foot_touching(
                                      // useClassifier: true,
                                      // isActivity: true,
                                      )));
                    }),
                
                ElevatedButton(
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Text('04 lunges'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PoseDetectorView_lunges_mild(
                                      // useClassifier: true,
                                      // isActivity: true,
                                      )));
                    }),
                // ElevatedButton(
                //     // padding: EdgeInsets.symmetric(horizontal: 16),
                //     child: const Text('05 squat'),
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) =>
                //                   const PoseDetectorView_squat(
                //                       // useClassifier: true,
                //                       // isActivity: true,
                //                       )));
                //     }),
                ElevatedButton(
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    child: const Text('06 arm_circles'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PoseDetectorView_arm_circles(
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
