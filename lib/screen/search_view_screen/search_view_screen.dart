import 'package:flutter/material.dart';
import 'package:open_fashion/widget/appbar.dart';

class SearchViewScreen extends StatefulWidget {
  const SearchViewScreen({super.key});

  @override
  State<SearchViewScreen> createState() => _SearchViewScreenState();
}

class _SearchViewScreenState extends State<SearchViewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(),
      // drawer: MenuNavbar(tabController: _tabController),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
