import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit_foot_touching/google_ml_kit.dart';
import 'package:mobile_final/Games/games_model/01_warm_up/warm_countdown_nextpage.dart';
import 'package:mobile_final/model/user_model.dart';
import 'camera_view.dart';
import 'painters/pose_painter.dart';

class PoseDetectorView_foot_touching extends StatefulWidget {
  final bool useClassifier;
  final bool isActivity;
  // final int scoreSum;
  final int getplaytime;
  final int setStep;
  final String activitygame;

  const PoseDetectorView_foot_touching({
    this.useClassifier = true,
    this.isActivity = true,
    // this.scoreSum = 0,
    this.getplaytime = 0,
    this.setStep = 1,
    this.activitygame = "mild",
  });

  @override
  State<StatefulWidget> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView_foot_touching> {
  PoseDetector poseDetector = GoogleMlKit.vision.poseDetector();
  bool isBusy = false;
  CustomPaint? customPaint;
  String poseName = "";
  double poseAccuracy = 0.0;
  int poseReps = 0;
  bool _running = true;
  int playTime = 0;
  UserModel? userModel; //! ตัวเราเอง
  String? uidMe; //! uid ของเรา
  String? uid; //! uid เรา
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    assAudio();
    movePage();
    autoPlayTime();
  }
  
  

  Future assAudio() async {
    int ci = Random().nextInt(2);
    assetsAudioPlayer.open(
      Audio("assets/audio/NCS_mix_20_0$ci.mp3"),
      loopMode:LoopMode.single,
    );
    assetsAudioPlayer.play();
  }

  

  Future<void> autoPlayTime() async {
    Duration duration = Duration(seconds: 1);
    // ignore: await_only_futures
    await Timer(duration, () {
      setState(() {
        playTime++;
      });
      autoPlayTime();
    });
  }

  Future movePage() async {
    while (_running) {
      await Future<void>.delayed(const Duration(seconds: 1));
      if (playTime >= 90) {
        if (poseReps >= 0) {
          _running = false;
          assetsAudioPlayer.stop();
          // playTime = 5;

          int timeSum = playTime;
          // int _sumScore = widget.scoreSum;
          playTime += widget.getplaytime;

          // // rep * timeset/playtime
          // poseReps *= timeSum;
          // poseReps ~/= 30;
          // _sumScore += poseReps;
          // // becuase non score for warm up
          // _sumScore = 0;

          // print(
          //     "##############sum == $_sumScore  = $timeSum = $_sumScore  == poserep== $poseReps");

          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => warm_countdown_nextpage(
                        // scoreSum: widget.scoreSum,
                        getplaytime: playTime,
                        setstep: widget.setStep,
                        activitygame: widget.activitygame,
                      )),
              (Route<dynamic> route) => false);
        }
      }
    }
  }

  void dispose() async {
    super.dispose();
    await poseDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: Container(
        child: Stack(
          children: [
            CameraView(
              customPaint: customPaint,
              onImage: (inputImage) {
                processImage(
                  inputImage,
                  widget.useClassifier,
                  widget.isActivity,
                );
              },
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.orange[200],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Foot touching",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            // Icon(Icons.class_),
                            Image(
                              image: AssetImage("assets/images/exercise.png"),
                              // color: Colors.black,
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amber[200],
                                ),
                                child: Text(' $poseName',
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              image: AssetImage(
                                  "${poseAccuracy * 100 >= 60 ? 'assets/images/correct.png' : 'assets/images/noncorrect.png'}"),
                              // color: Colors.black,
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amber[200],
                                ),
                                child: Text(' $poseAccuracy',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              image: AssetImage("assets/images/stopwatch.png"),
                              // color: Colors.green,
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.amber[200],
                                ),
                                child: Text('  $playTime s',
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> processImage(
    InputImage inputImage,
    bool useClassifier,
    bool isActivity,
  ) async {
    if (isBusy) return;
    isBusy = true;
    final poses = await poseDetector.processImage(
      inputImage: inputImage,
      useClassifier: widget.useClassifier,
      isActivity: isActivity,
    );

    if (useClassifier) {
      poses.forEach((pose) {
        poseName = pose.name;
        poseAccuracy = pose.accuracy;
        poseReps = pose.reps;
      });
    }

    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = PosePainter(
        poses,
        inputImage.inputImageData!.size,
        inputImage.inputImageData!.imageRotation,
      );
      customPaint = CustomPaint(painter: painter);
    } else {
      customPaint = null;
    }

    isBusy = false;

    if (mounted) {
      setState(() {});
    }
  }
}
