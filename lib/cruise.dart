import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/dropdown_title_bar.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class CruisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DropDownTitleBar(title: "ROBOT-845",),
      ),
      body: ChangeNotifierProvider(
        create: (context1) => RobotPosition(),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                  "http://180.108.46.7:10812/web/mapFiles/20201106/202011063a72f6bf6f8842f9.jpg",
                  fit: BoxFit.fill),
            ),
            MarkersWidget(),
            _ButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatefulWidget {
  @override
  __ButtonWidgetState createState() => __ButtonWidgetState();
}

class __ButtonWidgetState extends State<_ButtonWidget> {
  bool running = false;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Align(
        child: Stack(
          children: [
            Align(
              child: Container(
                child: GestureDetector(
                  child: Image.asset(
                      "images/icon_btn_fragment_cruise_navigation.png"),
                  onTap: () {
                    var position =
                        Provider.of<RobotPosition>(context, listen: false);
                    if (!running) {
                      timer = Timer.periodic(Duration(microseconds: 500), (timer) {
                        position.move();
                        if (position.offset.dx >= 300) {
                          running = false;
                          position.positive = false;
                        } else if(position.offset.dx <= 100){
                          running = false;
                          position.positive = true;
                        }
                      });
                    } else {
                      running = false;
                      timer?.cancel();
                    }
                  },
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5)),
                width: 75,
                height: 75,
              ),
              alignment: Alignment.bottomCenter,
            ),
            Align(
              child: Image.asset("images/src_cruise_stop_normal.png"),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}

class MarkersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(double.maxFinite, double.maxFinite),
          painter: FixMarkerPainter(),
        ),
        Consumer<RobotPosition>(
          builder: (context, position, child) => CustomPaint(
            size: Size(double.maxFinite, double.maxFinite),
            painter: MoveMarkerPainter(offset: position.offset),
          ),
        ),
      ],
    );
  }
}

class FixMarkerPainter extends CustomPainter {
  final WordPair random = WordPair.random();
  var coordinator = [
    [300.8034, 1273.2452],
    [317.78842, 1363.1025],
    [417.38663, 1418.461],
    [359.497, 1359.8933],
    [479.29633, 1561.2699],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint()
    //   ..color = Colors.green
    //   ..style = PaintingStyle.fill
    //   ..isAntiAlias = true;
    //
    // canvas.drawCircle(Offset(200, 200), 10, paint);

    final icon = Icons.location_city;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(color: Colors.black54, fontFamily: icon.fontFamily));
    textPainter.layout();
    coordinator.forEach((element) {
      print(element);
      textPainter.paint(canvas, Offset(element[0] / 3, element[1] / 3));
      // canvas.drawCircle(Offset(element[0]/3, element[1]/3), 10, paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MoveMarkerPainter extends CustomPainter {
  final Offset? offset;

  MoveMarkerPainter({@required this.offset}) : super();

  @override
  void paint(Canvas canvas, Size size) {
    final icon = Icons.my_location_outlined;
    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
            color: Colors.red, fontSize: 25, fontFamily: icon.fontFamily));
    textPainter.layout();
    print(offset);
    textPainter.paint(canvas, offset!);
    // canvas.drawCircle(Offset(element[0]/3, element[1]/3), 10, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class RobotPosition with ChangeNotifier {
  var offset = Offset(300.8034 / 3, 1273.2452 / 3);
  bool positive = true;
  final stepOffSet = Offset(1, 1);

  void move() {
    if (positive) {
      offset = offset + stepOffSet;
    } else {
      offset = offset - stepOffSet;
    }
    print("move offset $offset");
    notifyListeners();
  }
}
