import 'package:flutter/material.dart';

class SampleDragAndDrop extends StatefulWidget {
  const SampleDragAndDrop({Key? key}) : super(key: key);

  @override
  _SampleDragAndDropState createState() => _SampleDragAndDropState();
}

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class _SampleDragAndDropState extends State<SampleDragAndDrop> {
  bool _isDropped = false;
  String yellow = 'yellow';
  String blue = 'blue';
  String red = 'red';
  var addedItems = <String>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.reset_tv,
                  color: Colors.white,
                ),
                onPressed: () {
                  resetAll();
                },
              )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !addedItems.contains(blue),
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: 'blue',
                        child: SizedBox(
                          height: 120.0,
                          width: 120.0,
                          child: Center(
                            child: Image.asset('assets/images/blue.png'),
                          ),
                        ),
                        feedback: SizedBox(
                          height: 120.0,
                          width: 120.0,
                          child: Center(
                            child: Image.asset('assets/images/blue.png'),
                          ),
                        ),
                        childWhenDragging: const SizedBox(
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !addedItems.contains(red),
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: 'red',
                        child: SizedBox(
                          height: 120.0,
                          width: 120.0,
                          child: Center(
                            child: Image.asset('assets/images/red.png'),
                          ),
                        ),
                        feedback: SizedBox(
                          height: 120.0,
                          width: 120.0,
                          child: Center(
                            child: Image.asset('assets/images/red.png'),
                          ),
                        ),
                        childWhenDragging: const SizedBox(
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !addedItems.contains(yellow),
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: 'yellow',
                        child: SizedBox(
                          height: 120.0,
                          width: 120.0,
                          child: Center(
                            child: Image.asset('assets/images/yellow.png'),
                          ),
                        ),
                        feedback: SizedBox(
                          height: 120.0,
                          width: 120.0,
                          child: Center(
                            child: Image.asset('assets/images/yellow.png'),
                          ),
                        ),
                        childWhenDragging: const SizedBox(
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                DragTarget<String>(
                  builder: (
                    BuildContext context,
                    List<dynamic> accepted,
                    List<dynamic> rejected,
                  ) {
                    return SizedBox(
                      height: 320,
                      width: 320,
                      child: Center(
                        child: getBow(addedItems),
                      ),
                    );
                  },
                  onWillAccept: (data) {
                    if (data == 'blue' || data == 'yellow' || data == 'red') {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  onAccept: (data) {
                    setState(() {
                      if (!addedItems.contains(data)) {
                        addedItems.add(data);
                      }
                      _isDropped = true;
                    });
                  },
                  onLeave: (data) {},
                ),
              ],
            ),
          )),
    );
  }

  void resetAll() {
    setState(() {
      addedItems.clear();
    });
  }

  Image getBow(List<String> selectedData) {
    if (selectedData.contains(yellow) &&
        selectedData.contains(blue) &&
        selectedData.contains(red)) {
      return Image.asset('assets/images/full_bowl.png');
    } else if (selectedData.contains(yellow) && selectedData.contains(blue)) {
      return Image.asset('assets/images/without_red.png');
    } else if (selectedData.contains(yellow) && selectedData.contains(red)) {
      return Image.asset('assets/images/without_blue.png');
    } else if (selectedData.contains(red) && selectedData.contains(blue)) {
      return Image.asset('assets/images/without_yellow.png');
    } else if (selectedData.contains(red)) {
      return Image.asset('assets/images/red_bowl.png');
    } else if (selectedData.contains(yellow)) {
      return Image.asset('assets/images/yellow_bowl.png');
    } else if (selectedData.contains(blue)) {
      return Image.asset('assets/images/blue_bowl.png');
    } else {
      return Image.asset('assets/images/empty_bowl.png');
    }
  }
}
