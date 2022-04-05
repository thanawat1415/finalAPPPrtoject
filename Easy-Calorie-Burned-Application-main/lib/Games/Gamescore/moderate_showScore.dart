// ignore_for_file: avoid_print, unnecessary_string_interpolations, prefer_const_constructors, unnecessary_brace_in_string_interps, await_only_futures, annotate_overrides, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:mobile_final/main_screen.dart';
import 'package:mobile_final/model/score_model.dart';
import 'package:mobile_final/model/user_model.dart';

class moderate_showScore extends StatefulWidget {
  const moderate_showScore({Key? key}) : super(key: key);

  @override
  _moderate_showScoreState createState() => _moderate_showScoreState();
}

class _moderate_showScoreState extends State<moderate_showScore> {
  String? uidMe, uid;
  UserModel? userModel;
  List<ScoreModel> scoreModel = [];
  int sumScore = 0, playTime = 0, scoreRank = 0;

  Future findUid() async {
    FirebaseAuth.instance.authStateChanges().listen((event) async {
      uidMe = event!.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uidMe)
          .get()
          .then((value) {
        setState(() {
          userModel = UserModel.fromMap(value.data()!);
        });
      });
    });
  }

  Future findScore() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) async {
      uid = event!.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('moderateScore')
          .orderBy('playDate', descending: true)
          .get()
          .then((value) {
        for (var item in value.docs) {
          ScoreModel model = ScoreModel.fromMap(item.data());
          setState(() {
            scoreModel.add(model);
            sumScore = scoreModel[0].sumScore;
            playTime = scoreModel[0].playTime;
          });
        }
        for (var i in scoreModel) {
          scoreRank += i.sumScore;
        }
        FirebaseFirestore.instance
            .collection('moderrateranking')
            .doc(uidMe)
            .set({
          'uidUser': userModel!.uid,
          'sumScoreRank': scoreRank,
          'userRank': userModel!.username,
          'imagePro': userModel!.imageUrl,
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    findUid();
    findScore();
  }

  
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: scoreModel == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "คะแนนการออกกำลังกาย",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 0),
                      Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/score2.png'),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${sumScore}",
                              style: TextStyle(
                                  fontSize: 140,
                                  color: Colors.brown[900],
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "เวลาที่ใช้ในการออกกำลังกาย",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image:
                                        AssetImage('assets/images/clock.png'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              "${playTime}",
                              style: TextStyle(
                                  color: Colors.brown[900],
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              flex: 6,
                              child: Text(
                                "วินาที",
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            minimumSize: Size(300, 50),
                            primary: Colors.orange.shade200),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()),(Route<dynamic> route) => false);
                        },
                        child: Text(
                          "กลับสู่หน้าหลัก",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
