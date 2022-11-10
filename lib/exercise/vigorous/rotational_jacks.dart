import 'dart:async';
import 'package:fading_images_slider/fading_images_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_app/exercise/button_widgets.dart';
import 'package:health_app/exercise/save_exercise.dart';

class RotationalJacks extends StatefulWidget {
  const RotationalJacks({Key? key}) : super(key: key);

  @override
  _RotationalJacksState createState() => _RotationalJacksState();
}

class _RotationalJacksState extends State<RotationalJacks> {
  bool isCliked = true;
  static const maxSeconds = 3;
  int seconds = maxSeconds;
  Timer? timerc;
  startCountdown() {
    timerc = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 1) {
        setState(() => seconds--);
      } else {
        setState(() {
          isCliked = true;
          startTimer();
        });
        stopCountdown();
      }
    });
  }

  void stopCountdown() {
    timerc?.cancel();
  }

  String time = '';
  String secs = '';
  String exercise = 'Rotational Jacks';
  String level = 'Vigorous Level Exercise';
  Duration duration = Duration();
  Timer? timer;
  bool isCountdown = true;

  void reset() {
    setState(() => duration = Duration());
  }

  void addTime() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          level,
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Rotational Jacks',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                      Container(
                    height: 300,
                    child: FadingImagesSlider(
                      icon: Icons.circle_rounded,
                     iconSize: 20,autoFade: false,
                      textAlignment: Alignment.center,
                      texts: [
                        Text(
                          '',
                        ),
                        Text(
                          '',
                        )
                      ],
                      images: [Image.asset('assets/images/o/rotational.gif'),
                        Image.asset('assets/images/vigorous/rotational_jacks.gif'),
                        
                      ],
                    ),
                  ),
                  Divider(),
                  buildTimer(),
                  SizedBox(
                    height: 10,
                  ),
                  buildButtons(),
                ],
              ),
            ),
            isCliked
                ? Container()
                : Opacity(
                    opacity: 0.7,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.black,
                      child: Text(
                        '$seconds',
                        style:
                            TextStyle(color: Colors.blue[200], fontSize: 200),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = duration.inSeconds == 0;
    return isRunning || !isCompleted
        ? Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: isRunning ? 'Stop' : 'Resume',
                  onClicked: () {
                    if (isRunning) {
                      stopTimer(resets: false);
                    } else {
                      startTimer(resets: false);
                    }
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                ButtonWidget(
                    text: ' Finish',
                    onClicked: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (_) => SaveExercise(
                                exercise: exercise, time: time, level: level, secs:secs)),
                      );
                      stopTimer(resets: false);
                    }),
              ],
            ),
          )
        : ButtonWidget(
            text: 'Start',
            onClicked: () {
              setState(() {
                isCliked = false;
              });
              startCountdown();
            },
          );
  }

  Widget buildTimer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    time = '$minutes';
    secs = '$seconds';
    return Text(
      '$minutes:$seconds',
      style: TextStyle(fontSize: 80),
    );
  }
}
