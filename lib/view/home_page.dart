import 'package:flutter/material.dart';
import 'package:portfolio_project/responsive/responsive.dart';

import 'components/drawer.dart';
import 'home_view.dart';
import 'about_view.dart';

class DeveloperPortfolio extends StatefulWidget {
  DeveloperPortfolio({super.key});

  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  State<DeveloperPortfolio> createState() => _DeveloperPortfolioState();
}

class _DeveloperPortfolioState extends State<DeveloperPortfolio> {
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();

  int _activeSectionIndex = 0;

  @override
  void initState() {
    super.initState();
    widget._scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget._scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!widget._scrollController.hasClients) return;
    final double offset = widget._scrollController.offset;
    final double screenHeight = MediaQuery.of(context).size.height;

    int newIndex = 0;
    if (offset >= screenHeight * 0.5) {
      newIndex = 1; // About section
    } else {
      newIndex = 0; // Home section
    }

    if (newIndex != _activeSectionIndex) {
      setState(() {
        _activeSectionIndex = newIndex;
      });
    }
  }

  void _scrollToSection(int index) {
    double targetOffset = 0;
    if (index == 0) {
      targetOffset = 0;
    } else if (index == 1) {
      final RenderBox? renderBox =
          _aboutKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero);
        targetOffset = widget._scrollController.offset + position.dy;
      } else {
        targetOffset = MediaQuery.of(context).size.height;
      }
    }

    widget._scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      key: widget._globalKey,
      backgroundColor: Colors.white,
      endDrawer: isMobile
          ? MyDrawer(scrollController: widget._scrollController)
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: widget._scrollController,
              child: Column(
                children: [
                  HomeView(key: _homeKey),
                  AboutView(key: _aboutKey),
                ],
              ),
            ),

            // Vertical Floating Side Navigation Bar
            Positioned(
              right: isMobile ? 12 : 24,
              top: 0,
              bottom: 0,
              child: Center(
                child: _buildSideNavBar(isMobile),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideNavBar(bool isMobile) {
    final navItems = [
      {"icon": Icons.home_rounded, "index": 0, "tooltip": "Home"},
      {"icon": Icons.person_rounded, "index": 1, "tooltip": "About"},
      {"icon": Icons.code_rounded, "index": 2, "tooltip": "Skills"},
      {"icon": Icons.folder_outlined, "index": 3, "tooltip": "Projects"},
      {"icon": Icons.email_outlined, "index": 4, "tooltip": "Contact"},
    ];

    final double btnSize = isMobile ? 38.0 : 44.0;
    final double iconSize = isMobile ? 18.0 : 22.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...navItems.map((item) {
          final int idx = item["index"] as int;
          final bool isSelected = _activeSectionIndex == idx;
          final IconData icon = item["icon"] as IconData;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Tooltip(
              message: item["tooltip"] as String,
              child: InkWell(
                onTap: () => _scrollToSection(idx),
                borderRadius: BorderRadius.circular(30),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: btnSize,
                  height: btnSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? const Color(0xFFFFAE34)
                        : const Color(0xFF0D0D0D),
                    border: Border.all(
                      color: Colors.white,
                      width: isSelected ? 2.0 : 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected
                            ? const Color(0xFFFFAE34).withValues(alpha: 0.5)
                            : Colors.black.withValues(alpha: 0.25),
                        blurRadius: isSelected ? 12 : 6,
                        spreadRadius: isSelected ? 2 : 0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
              ),
            ),
          );
        }),
        const SizedBox(height: 12),
        // Theme Toggle Icon
        Icon(
          Icons.nights_stay_rounded,
          color: Colors.grey.shade400,
          size: isMobile ? 20 : 24,
        ),
      ],
    );
  }
}
