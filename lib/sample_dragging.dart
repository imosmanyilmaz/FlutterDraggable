import 'package:flutter/material.dart';

class SampleDragging extends StatefulWidget {
  const SampleDragging({Key? key}) : super(key: key);

  @override
  _SampleDraggingState createState() => _SampleDraggingState();
}

class _SampleDraggingState extends State<SampleDragging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Draggable<String>(
        onDragStarted: () {
          debugPrint('onDragStarted');
        },
        onDragCompleted: (){
          debugPrint('onDragCompleted');
        },
        onDraggableCanceled: (velocity, offset){
          debugPrint('onDraggableCanceled ${offset.distanceSquared}');
        },
        onDragEnd: (DraggableDetails event){
          debugPrint('onDragEnd offset ,${event.offset.dx}');
          debugPrint('onDragEnd wasAccepted,${event.wasAccepted}');
          debugPrint('onDragEnd velocity,${event.velocity}');
        },
        data: 'ball',
        child: SizedBox(
          height: 120.0,
          width: 120.0,
          child: Center(
            child: Image.asset('assets/images/ball.png'),
          ),
        ),
        feedback: SizedBox(
          height: 120.0,
          width: 120.0,
          child: Center(
            child: Image.asset('assets/images/ball.png'),
          ),
        ),
        /*childWhenDragging: const SizedBox(),*/
        childWhenDragging: SizedBox(
          height: 120.0,
          width: 120.0,
          child: Center(
            child: Image.asset('assets/images/ball_gray.png'),
          ),
        ),
      ),
    ));
  }
}
