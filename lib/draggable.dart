import 'package:flutter/material.dart';

class DraggablePage extends StatefulWidget {
  const DraggablePage({super.key});

  @override
  State<DraggablePage> createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  String? _firstImageUrl;
  String? _secondImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Draggable<String>(
              data:
                  "https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg",
              feedback: Opacity(
                opacity: 0.4,
                child: Container(
                  color: Colors.purple,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Image.network(
                    'https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              childWhenDragging: Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                color: Colors.pinkAccent,
                child: const Center(
                  child: Text('child when dragging'),
                ),
              ),
              child: DragTarget<String>(
                onAccept: (data) {
                  setState(() {
                    _firstImageUrl = data;
                    _secondImageUrl = null;
                  });
                },
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.lightGreenAccent,
                    child: Center(
                      child: _firstImageUrl != null
                          ? Image.network(_firstImageUrl!)
                          : Container(),
                    ),
                  );
                },
              ),
            ),
            Draggable<String>(
              data:
                  "https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg",
              feedback: Opacity(
                opacity: 0.4,
                child: Container(
                  color: Colors.purple,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Image.network(
                    'https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              childWhenDragging: Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                color: Colors.pinkAccent,
                child: const Center(
                  child: Text('child when dragging'),
                ),
              ),
              child: DragTarget<String>(
                onAccept: (data) {
                  setState(() {
                    _firstImageUrl = null;
                    _secondImageUrl = data;
                  });
                },
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.lightGreenAccent,
                    child: Center(
                      child: _secondImageUrl != null
                          ? Image.network(_secondImageUrl!)
                          : Container(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
