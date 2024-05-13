import 'package:flutter/material.dart';
import 'package:social_design_system/social_design_system.dart';

class ButtonsScreen extends StatefulWidget {
  static const String routeName = '/Buttons';
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text("Elevated Buttons"),
            Wrap(
              spacing: 8,
              children: [
                Theme(
                  data: ComicThemeData.of(context),
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('ElevatedButton pressed');
                    },
                    child: const Text('ElevatedButton'),
                  ),
                ),
                SleekTheme(
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('ElevatedButton pressed');
                    },
                    child: const Text('ElevatedButton'),
                  ),
                ),
              ],
            ),
            const Text("Text Buttons"),
            Wrap(
              spacing: 8,
              children: [
                Theme(
                  data: ComicThemeData.of(context),
                  child: TextButton(
                    onPressed: () {
                      debugPrint('ElevatedButton pressed');
                    },
                    child: const Text('ElevatedButton'),
                  ),
                ),
                SleekTheme(
                  child: TextButton(
                    onPressed: () {
                      debugPrint('ElevatedButton pressed');
                    },
                    child: const Text('ElevatedButton'),
                  ),
                ),
              ],
            ),
            const Text("Icon Buttons"),
            Wrap(
              spacing: 8,
              children: [
                Theme(
                  data: ComicThemeData.of(context),
                  child: IconButton(
                    onPressed: () {
                      debugPrint('ElevatedButton pressed');
                    },
                    icon: const Text('ElevatedButton'),
                  ),
                ),
                SleekTheme(
                  child: IconButton(
                    onPressed: () {
                      debugPrint('ElevatedButton pressed');
                    },
                    icon: const Text('ElevatedButton'),
                  ),
                ),
              ],
            ),
            const Text("Text Buttons with Icon"),
            Wrap(
              spacing: 8,
              children: [
                Theme(
                  data: ComicThemeData.of(context),
                  child: TextButton.icon(
                    onPressed: () {
                      debugPrint('ElevatedButton pressed');
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('This is Lebel'),
                  ),
                ),
                SleekTheme(
                  child: TextButton.icon(
                    onPressed: () {
                      debugPrint('ElevatedButton pressed');
                    },
                    icon: const Text('This is Lebel'),
                    label: const Icon(Icons.add),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
