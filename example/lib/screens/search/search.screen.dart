import 'package:example/screens/app_bar/app_bar.screen.dart';
import 'package:example/screens/badge/badge.screen.dart';
import 'package:example/screens/bottom_app_bar/bottom_app_bar.screen.dart';
import 'package:example/screens/bottom_sheet/bottom_sheet.screen.dart';
import 'package:example/screens/buttons/buttons.screen.dart';
import 'package:example/screens/card/card.screen.dart';
import 'package:example/screens/checkbox/checkbox.screen.dart';
import 'package:example/screens/checkbox_list_tile/checkbox_list_tile.screen.dart';
import 'package:example/screens/chip/chip.screen.dart';
import 'package:example/screens/color_scheme/color_scheme.screen.dart';
import 'package:example/screens/dialog/dialog.screen.dart';
import 'package:example/screens/divider/divider.screen.dart';
import 'package:example/screens/entry/basic_carousel_entry.screen.dart';
import 'package:example/screens/entry/round_carousel_entry.screen.dart';
import 'package:example/screens/entry/wave_carousel_entry.screen.dart';
import 'package:example/screens/floating_action_button/floating_action_button.screen.dart';
import 'package:example/screens/icon_buttons/icon_buttons.screen.dart';
import 'package:example/screens/list_tile/list_tile.screen.dart';
import 'package:example/screens/navigation_bar/navigation_bar.screen.dart';
import 'package:example/screens/navigation_drawer/navigation_drawer.screen.dart';
import 'package:example/screens/navigation_rail.dart/navigation_rail.screen.dart';
import 'package:example/screens/progress_indicator/progress_indicator.screen.dart';
import 'package:example/screens/segmented_button/segmented_button.dart';
import 'package:example/screens/sleep_walker/sleep_walker.screen.dart';
import 'package:example/screens/snackbar/snackbars.screen.dart';
import 'package:example/screens/tab_bar/tab_bar.screen.dart';
import 'package:example/screens/text_form_field/text_form_field.screen.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search_screen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<SearchItem> _items = [
    const SearchItem(name: "AppBar", screen: AppBarScreen()),
    const SearchItem(name: 'Badge', screen: BadgeScreen()),
    const SearchItem(name: 'BottomAppBar', screen: BottomAppBarScreen()),
    const SearchItem(name: 'BottomSheet', screen: BottomSheetScreen()),
    const SearchItem(name: 'Buttons', screen: ButtonsScreen()),
    const SearchItem(name: 'Card', screen: CardScreen()),
    const SearchItem(name: 'Checkbox', screen: CheckboxScreen()),
    const SearchItem(
        name: 'CheckboxListTile', screen: CheckboxListTileScreen()),
    const SearchItem(name: 'Chip', screen: ChipScreen()),
    const SearchItem(name: 'Dialog', screen: DialogScreen()),
    const SearchItem(name: 'Divider', screen: DividerScreen()),
    const SearchItem(
        name: 'Floating Action Button', screen: FloatingActionButtonScreen()),
    const SearchItem(name: 'IconButton', screen: IconButtonScreen()),
    const SearchItem(name: 'ListTile', screen: ListTileScreen()),
    const SearchItem(name: 'NavigationBar', screen: NavigationBarScreen()),
    const SearchItem(
        name: "NavigationDrawer", screen: NavigationDrawerScreen()),
    const SearchItem(name: 'NavigationRail', screen: NavigationRailScreen()),
    const SearchItem(
        name: 'Progress Indicator', screen: ProgressIndicatorScreen()),
    const SearchItem(name: 'Segmented Button', screen: SegmentedButtonScreen()),
    const SearchItem(name: 'SnackBar', screen: SnackBarScreen()),
    const SearchItem(name: 'TabBar', screen: TabBarScreen()),
    const SearchItem(name: 'TextFormField', screen: TextFormFieldScreen()),
    const SearchItem(
        name: 'Basic Carousel Entry', screen: BasicCarouselEntryScreen()),
    const SearchItem(
        name: 'Wave Carousel Entry', screen: WaveCarouselEntryScreen()),
    const SearchItem(
        name: 'Round Carousel Entry', screen: RoundCarouselEntryScreen()),
    const SearchItem(name: 'Sleep Walker', screen: SleepWalkerScreen()),
    const SearchItem(name: 'Color scheme', screen: ColorSchemeScreen()),
  ];

  List<SearchItem> _result = [];
  final TextEditingController _searchController = TextEditingController();

  void _searchWidgets(String query) {
    final results = _items.where((widget) {
      final widgetName = widget.name.toLowerCase().trim().replaceAll(' ', '');
      final input = query.toLowerCase().trim().replaceAll(' ', '');
      return widgetName.contains(input);
    }).toList();

    setState(() {
      _result = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search widgets...',
              border: OutlineInputBorder(),
            ),
            onChanged: _searchWidgets,
          ),
          if (_searchController.text.isEmpty) ...{
            const Expanded(
                child: Center(
              child: Text('Search for widgets'),
            ))
          },
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _result.length,
                  itemBuilder: (context, index) {
                    final widget = _result[index];
                    return ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => widget.screen),
                      ),
                      child: Text(widget.name),
                    );
                  })),
        ],
      ),
    );
  }
}

class SearchItem {
  final String name;
  final Widget screen;
  // final String description;
  const SearchItem({
    required this.name,
    required this.screen,
    // required this.description,
  });
}