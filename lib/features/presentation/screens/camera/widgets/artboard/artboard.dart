import 'package:flutter/material.dart';

class ArtboardScreen extends StatefulWidget {
  const ArtboardScreen({Key? key}) : super(key: key);

  @override
  State<ArtboardScreen> createState() => _ArtboardScreenState();
}

class _ArtboardScreenState extends State<ArtboardScreen> {
  Color canvasColor = Colors.black;
  final colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber,
    Colors.deepPurple,
  ];
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios))),
          backgroundColor: canvasColor,
        ),
        backgroundColor: canvasColor,
        body: Stack(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                  child: TextField(
                controller: _controller,
                style: const TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Create',
                ),
              ))),
          Positioned(right: 20, child: _colorList())
        ]));
  }

  Widget _colorList() {
    return SizedBox(
        width: 50,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: colors.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int idx) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      canvasColor = colors[idx];
                    });
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: colors[idx])));
            }));
  }
}
