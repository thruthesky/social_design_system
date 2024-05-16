import 'package:example/screens/badge/badge.screen.dart';
import 'package:example/screens/buttons/buttons.screen.dart';
import 'package:example/screens/color_scheme/color_scheme.screen.dart';
import 'package:example/screens/comic/comic.screen.demo.dart';
import 'package:example/screens/list_tile/list_tile.screen.dart';
import 'package:example/screens/entry/basic_carousel_entry.screen.dart';
import 'package:example/screens/entry/round_carousel_entry.screen.dart';
import 'package:example/screens/entry/wave_carousel_entry.screen.dart';
import 'package:example/screens/sleep_walker/sleep_walker.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {}, child: const Text("light & dark mode")),
          ElevatedButton(onPressed: () {}, child: const Text("TextField")),
          pushScreen('Buttons', const ButtonsScreen()),
          //
          ElevatedButton(onPressed: () {}, child: const Text("TextFormField")),
          ElevatedButton(
              onPressed: () {}, child: const Text("Floating Action button")),
          ElevatedButton(onPressed: () {}, child: const Text("IconButton")),
          ElevatedButton(
              onPressed: () {}, child: const Text("segmentedbutton")),
          pushScreen('Badge', const BadgeScreen()),
          ElevatedButton(
              onPressed: () {}, child: const Text("LinearProgressIndicator")),
          ElevatedButton(onPressed: () {}, child: const Text("SnackBar")),
          ElevatedButton(onPressed: () {}, child: const Text("AlertDialog")),
          ElevatedButton(onPressed: () {}, child: const Text("BottomSheet")),
          ElevatedButton(onPressed: () {}, child: const Text("Card")),
          ElevatedButton(onPressed: () {}, child: const Text("Divider")),
          pushScreen('ListTile', const ListTileScreen()),
          ElevatedButton(onPressed: () {}, child: const Text("AppBar")),
          ElevatedButton(onPressed: () {}, child: const Text("Bottom App Bar")),
          ElevatedButton(onPressed: () {}, child: const Text("NavigationBar")),
          ElevatedButton(
              onPressed: () {}, child: const Text("NavigationDrawer")),
          ElevatedButton(onPressed: () {}, child: const Text("NavigationRail")),
          ElevatedButton(onPressed: () {}, child: const Text("TabBar")),
          ElevatedButton(onPressed: () {}, child: const Text("Checkbox")),
          ElevatedButton(onPressed: () {}, child: const Text("Chip")),

          pushScreen('Sleep Walker', const SleepWalkerScreen()),
          pushScreen('Basic Carousel Entry', const BasicCarouselEntryScreen()),
          pushScreen('Wave Carousel Entry', const WaveCarouselEntryScreen()),
          pushScreen('Round Carousel Entry', const RoundCarouselEntryScreen()),
          pushScreen('Color scheme', const ColorSchemeScreen()),
          pushScreen('Comic Theme Demo', const ComicScreenDemo())
        ],
      ),
    );
  }

  pushScreen(String title, Widget screen) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => screen),
      ),
      child: Text(title),
    );
  }
}
