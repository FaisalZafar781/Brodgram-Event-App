import 'package:brogam/screens/Home/MultiplePersonDetailScreen/multiple_person_detail_screen.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/material.dart';

class MultiplePersonDetailTab extends StatefulWidget {
  bool isPaid;
  MultiplePersonDetailTab(
      {super.key, required this.tabCount, required this.isPaid});

  final int tabCount;

  @override
  State<MultiplePersonDetailTab> createState() =>
      _MultiplePersonDetailTabState();
}

class _MultiplePersonDetailTabState extends State<MultiplePersonDetailTab>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabCount, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            // Close the current screen (pop the route)
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Personal Details',
            style: TextStyle(
              fontFamily: AppFontsFamily.poppins,
              color: AppColors.black,
              fontSize: AppFontSizes.subtitle,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(25), // Adjust height as needed
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent, // Customize indicator color
              ),
              labelPadding: const EdgeInsets.all(2),
              tabs: List<Widget>.generate(
                widget.tabCount,
                (index) => Tab(
                  child: Container(
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _selectedIndex == index
                          ? AppColors.secondaryColor // Selected tab color
                          : Colors.grey, // Unselected tab color
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List<Widget>.generate(
          widget.tabCount,
          (index) => MultiplePersonDetailScreen(
            index: index,
            isPaid: widget.isPaid,
          ),
        ),
      ),
    );
  }
}
