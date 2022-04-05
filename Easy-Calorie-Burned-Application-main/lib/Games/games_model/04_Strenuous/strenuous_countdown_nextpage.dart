import 'dart:async';
// import 'dart:math';

// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mobile_final/Games/games_model/04_Strenuous/01_lunges/pose_detector_views_lunges.dart';
import 'package:mobile_final/Games/games_model/04_Strenuous/02_squat/pose_detector_views_squat.dart';
import 'package:mobile_final/Games/games_model/04_Strenuous/03_standing_twist/pose_detector_views_standing_twist.dart';
import 'package:mobile_final/Games/games_model/04_Strenuous/04_elbow_plank/pose_detector_views_elbow_plank.dart';
import 'package:mobile_final/Games/games_model/04_Strenuous/05_bend_side/pose_detector_views_bend_side.dart';

class strenuous_countdown_nextpage extends StatefulWidget {
  final int scoreSum;
  final int getplaytime;
  final int setstep;

  const strenuous_countdown_nextpage({
    this.scoreSum = 0,
    this.getplaytime = 0,
    this.setstep = 0,
  });

  @override
  _strenuous_countdown_nextpageState createState() =>
      _strenuous_countdown_nextpageState();
}

class _strenuous_countdown_nextpageState
    extends State<strenuous_countdown_nextpage> {
  // int count = 5;
  int count = 21;
  String goTo = '';
  // final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    audioTokc();
    autoCount();
  }

  // Future playAudioBG() async {
    
  //   assetsAudioPlayer.open(
  //     Audio("assets/audio/NCS_mix_20_04.mp3"),
  //   );
  //   assetsAudioPlayer.play();

  //   // FlameAudio.bgm.play('NCS_mix_20_02.mp3');
  // }

  Future audioTokc() async {
    // FlameAudio.bgm.pause();
    // assetsAudioPlayer.stop();
    FlameAudio.play('tok_c.mp3');
  }

  Future audioToke() async {
    // FlameAudio.bgm.pause();
    // assetsAudioPlayer.stop();
    FlameAudio.play('tok_e.mp3');
  }

  Future<void> pushpageimage() async {
    // playAudioBG();
    if (widget.setstep == 1) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  PoseDetectorView_lunges_strenuous(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 2,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 2) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  PoseDetectorView_lunges_strenuous(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 3,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 3) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PoseDetectorView_squat(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 4,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 4) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PoseDetectorView_squat(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 5,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 5) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PoseDetectorView_squat(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 6,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 6) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  PoseDetectorView_standing_twist(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 7,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 7) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  PoseDetectorView_standing_twist(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 8,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 8) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  PoseDetectorView_standing_twist(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 9,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 9) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PoseDetectorView_elbow_plank(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 10,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 10) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PoseDetectorView_elbow_plank(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 11,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 11) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PoseDetectorView_elbow_plank(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 12,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 12) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PoseDetectorView_bend_side(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 13,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 13) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PoseDetectorView_bend_side(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 14,
                  )),
          (Route<dynamic> route) => false);
    } else if (widget.setstep == 14) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PoseDetectorView_bend_side(
                    scoreSum: widget.scoreSum,
                    getplaytime: widget.getplaytime,
                    setStep: 15,
                  )),
          (Route<dynamic> route) => false);
    }
  }

  Future<void> autoCount() async {
    Duration duration = Duration(seconds: 1);
    // ignore: await_only_futures
    await Timer(duration, () {
      if (count == 3) {
        audioTokc();
        if (widget.setstep == 1) {
          setState(() {
            goTo = 'Lunges set 1';
            count--;
          });
        } else if (widget.setstep == 2) {
          setState(() {
            goTo = 'Lunges set 2';
            count--;
          });
        } else if (widget.setstep == 3) {
          setState(() {
            goTo = 'Squat set 1';
            count--;
          });
        } else if (widget.setstep == 4) {
          setState(() {
            goTo = 'Squat set 2';
            count--;
          });
        } else if (widget.setstep == 5) {
          setState(() {
            goTo = 'Squat set 3';
            count--;
          });
        } else if (widget.setstep == 6) {
          setState(() {
            goTo = 'Standing twist set 1';
            count--;
          });
        } else if (widget.setstep == 7) {
          setState(() {
            goTo = 'Standing twist set 2';
            count--;
          });
        } else if (widget.setstep == 8) {
          setState(() {
            goTo = 'Standing twist set 3';
            count--;
          });
        } else if (widget.setstep == 9) {
          setState(() {
            goTo = 'Elbow plank set 1';
            count--;
          });
        } else if (widget.setstep == 10) {
          setState(() {
            goTo = 'Elbow plank set 2';
            count--;
          });
        } else if (widget.setstep == 11) {
          setState(() {
            goTo = 'Elbow plank set 3';
            count--;
          });
        } else if (widget.setstep == 12) {
          setState(() {
            goTo = 'Bend side set 1';
            count--;
          });
        } else if (widget.setstep == 13) {
          setState(() {
            goTo = 'Bend side set 2';
            count--;
          });
        } else if (widget.setstep == 14) {
          setState(() {
            goTo = 'Bend side set 3';
            count--;
          });
        }
        autoCount();
      } else if (count == 2) {
        audioTokc();
        setState(() {
          goTo = 'READY';
          count--;
        });
        autoCount();
      } else if (count == 1) {
        audioToke();
        setState(() {
          goTo = 'GO!';
          count--;
        });
        autoCount();
      } else if (count == 0) {
        pushpageimage();
      } else {
        audioTokc();
        setState(() {
          count--;
        });
        autoCount();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: goTo == ''
          ? Center(
              child: Text(
              '${(count - 1).toString()}',
              style: TextStyle(
                color: Colors.red[300],
                fontSize: 90,
                fontWeight: FontWeight.bold,
              ),
            ))
          : Center(
              child: Text(
              '${goTo}',
              style: TextStyle(
                color: Colors.red[300],
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            )),
    );
  }
}
