import 'package:flutter/material.dart';
import 'package:social_design_system/social_design_system.dart';

class IconButtonScreen extends StatelessWidget {
  const IconButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icon Buttons'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Table(
          children: [
            const TableRow(
              children: [
                Text('Comic Theme'),
                Text('Sleek Theme'),
              ],
            ),
            TableRow(
              children: [
                Theme(
                  data: ComicIconButtonThemeData.of(context),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                Theme(
                  data: ComicIconButtonThemeData.of(context),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
