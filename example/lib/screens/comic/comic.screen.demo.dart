import 'package:flutter/material.dart';
import 'package:social_design_system/social_design_system.dart';

class ComicScreenDemo extends StatefulWidget {
  const ComicScreenDemo({super.key});

  @override
  State<ComicScreenDemo> createState() => _ComicScreenDemoState();
}

class _ComicScreenDemoState extends State<ComicScreenDemo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int index = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ComicTheme.of(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Comic Screen Demo'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'First'),
              Tab(text: 'Second'),
              Tab(text: 'Third'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('First'),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => Theme(
                        data: ComicTheme.of(context),
                        child: BottomSheet(
                          onClosing: () {},
                          builder: (context) => const SizedBox(
                            height: 200,
                            child: Center(
                              child: Text('Comic'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    child: const Text('Display Comic Bottomsheet'),
                  ),
                ],
              ),
            ),
            const Center(child: Text('Second')),
            const Center(child: Text('Third')),
          ],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: ComicTheme.of(context).navigationBarTheme,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                  width: 1.6,
                ),
              ),
            ),
            child: NavigationBar(
              selectedIndex: index,
              onDestinationSelected: (v) {
                setState(() {
                  index = v;
                });
              },
              destinations: [
                const NavigationDestination(
                  icon: Icon(Icons.car_rental),
                  label: 'Car',
                ),
                const NavigationDestination(
                  icon: Icon(Icons.person),
                  label: 'You',
                ),
                NavigationDestination(
                  icon: SizedBox(
                    width: 48,
                    height: 32,
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.chat_bubble_outline),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 12),
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Colors.orange.shade900,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  '5',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  label: 'Chat',
                ),
                const NavigationDestination(
                  icon: Icon(Icons.post_add),
                  label: 'Record',
                ),
                const NavigationDestination(
                  icon: Icon(Icons.menu),
                  label: 'Menu',
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}