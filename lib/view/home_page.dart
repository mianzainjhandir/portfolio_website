import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_project/responsive/responsive.dart';

import 'components/drawer.dart';
import 'home_view.dart';
import 'about_view.dart';
import 'skills_view.dart';

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
  final GlobalKey _skillsKey = GlobalKey();

  int _activeSectionIndex = 0;

  @override
  void initState() {
    super.initState();
    widget._scrollController.addListener(_updateActiveSection);
  }

  @override
  void dispose() {
    widget._scrollController.removeListener(_updateActiveSection);
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    _updateActiveSection();
    return false;
  }

  void _updateActiveSection() {
    if (!widget._scrollController.hasClients) return;
    final double offset = widget._scrollController.offset;

    double aboutOffset = MediaQuery.of(context).size.height * 0.4;
    double skillsOffset = MediaQuery.of(context).size.height * 1.5;

    final RenderBox? aboutBox =
        _aboutKey.currentContext?.findRenderObject() as RenderBox?;
    if (aboutBox != null) {
      final pos = aboutBox.localToGlobal(Offset.zero);
      aboutOffset = widget._scrollController.offset + pos.dy - 200;
    }

    final RenderBox? skillsBox =
        _skillsKey.currentContext?.findRenderObject() as RenderBox?;
    if (skillsBox != null) {
      final pos = skillsBox.localToGlobal(Offset.zero);
      skillsOffset = widget._scrollController.offset + pos.dy - 200;
    }

    int newIndex = 0;
    if (offset >= skillsOffset) {
      newIndex = 2; // Skills
    } else if (offset >= aboutOffset) {
      newIndex = 1; // About
    } else {
      newIndex = 0; // Home
    }

    if (newIndex != _activeSectionIndex) {
      setState(() {
        _activeSectionIndex = newIndex;
      });
    }
  }

  void _scrollToSection(int index) {
    setState(() {
      _activeSectionIndex = index;
    });

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
    } else if (index == 2) {
      final RenderBox? renderBox =
          _skillsKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final position = renderBox.localToGlobal(Offset.zero);
        targetOffset = widget._scrollController.offset + position.dy;
      } else {
        targetOffset = MediaQuery.of(context).size.height * 1.8;
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
    final bool showLeftBar = !isMobile && _activeSectionIndex > 0;

    return Scaffold(
      key: widget._globalKey,
      backgroundColor: Colors.white,
      endDrawer: isMobile
          ? MyDrawer(scrollController: widget._scrollController)
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            // Scrollable Content Area with Dynamic Padding when Left Sidebar is Active
            AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              padding: EdgeInsets.only(
                left: showLeftBar ? 240.0 : 0.0,
                right: isMobile ? 0.0 : 60.0,
              ),
              child: NotificationListener<ScrollNotification>(
                onNotification: _handleScrollNotification,
                child: SingleChildScrollView(
                  controller: widget._scrollController,
                  child: Column(
                    children: [
                      HomeView(key: _homeKey),
                      AboutView(key: _aboutKey),
                      SkillsView(key: _skillsKey),
                    ],
                  ),
                ),
              ),
            ),

            // Left Navigation Drawer Panel (Appears when scrolled down from Home)
            _buildLeftDrawer(isMobile),

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

  Widget _buildLeftDrawer(bool isMobile) {
    final navItems = [
      {"icon": Icons.home_rounded, "index": 0, "label": "HOME"},
      {"icon": Icons.person_rounded, "index": 1, "label": "ABOUT ME"},
      {"icon": Icons.code_rounded, "index": 2, "label": "SKILLS & EXPERIENCE"},
      {"icon": Icons.folder_outlined, "index": 3, "label": "PROJECTS"},
      {"icon": Icons.email_outlined, "index": 4, "label": "CONTACT"},
    ];

    final bool showLeftBar = !isMobile && _activeSectionIndex > 0;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      left: showLeftBar ? 0 : -280,
      top: 0,
      bottom: 0,
      child: Container(
        width: 240,
        color: const Color(0xFFF4F5F7),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Top Profile Avatar
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFFFAE34),
                  width: 3.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile_pic.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Nav Menu Items
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: navItems.map((item) {
                  final int idx = item["index"] as int;
                  final bool isSelected = _activeSectionIndex == idx;
                  final IconData icon = item["icon"] as IconData;
                  final String label = item["label"] as String;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: InkWell(
                      onTap: () => _scrollToSection(idx),
                      borderRadius: BorderRadius.circular(14),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFFFAE34)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFFFFAE34)
                                        .withValues(alpha: 0.4),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : [],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              icon,
                              size: 20,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF222222),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                label,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF222222),
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // Bottom Moon Icon
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                child: Icon(
                  Icons.nights_stay_rounded,
                  color: const Color(0xFF181818),
                  size: 24,
                ),
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

    final double btnSize = isMobile ? 46.0 : 54.0;
    final double iconSize = isMobile ? 22.0 : 26.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...navItems.map((item) {
          final int idx = item["index"] as int;
          final bool isSelected = _activeSectionIndex == idx;
          final IconData icon = item["icon"] as IconData;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      width: isSelected ? 2.5 : 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected
                            ? const Color(0xFFFFAE34).withValues(alpha: 0.55)
                            : Colors.black.withValues(alpha: 0.3),
                        blurRadius: isSelected ? 14 : 6,
                        spreadRadius: isSelected ? 3 : 0,
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
        const SizedBox(height: 16),
        // Theme Toggle Icon
        Icon(
          Icons.nights_stay_rounded,
          color: Colors.grey.shade400,
          size: isMobile ? 22 : 26,
        ),
      ],
    );
  }
}
