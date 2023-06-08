import 'package:flutter/material.dart';

class TopNavScreen extends StatelessWidget {
  const TopNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Left",
              ),
              Tab(
                text: "Middle",
              ),
              Tab(
                text: "Right",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                "Left tab",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                ),
              ),
            ),
            Center(
              child: Text(
                "Middle tab",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                ),
              ),
            ),
            Center(
              child: Text(
                "Right tab",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
