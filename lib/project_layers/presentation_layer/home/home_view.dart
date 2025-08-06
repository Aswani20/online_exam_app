import 'package:flutter/material.dart';
import 'package:online_exam_app/core/theme/app_assets.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';
import 'package:online_exam_app/extensions/project_extensions.dart';
import 'package:online_exam_app/project_layers/presentation_layer/home/tabs/explore_tab/explore_view.dart';
import 'package:online_exam_app/project_layers/presentation_layer/home/tabs/profile_tab/profile_view.dart';
import 'package:online_exam_app/project_layers/presentation_layer/home/tabs/result_tab/result_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon:
                selectedIndex == 0
                    ? selectedTab(
                      ImageIcon(AssetImage(AppAssets.homeIcon), size: 35),
                    )
                    : ImageIcon(AssetImage(AppAssets.homeIcon), size: 35),
            label: context.l10n.explore,
          ),
          BottomNavigationBarItem(
            icon:
                selectedIndex == 1
                    ? selectedTab(
                      ImageIcon(AssetImage(AppAssets.resultIcon), size: 35),
                    )
                    : ImageIcon(AssetImage(AppAssets.resultIcon), size: 35),
            label: context.l10n.result,
          ),
          BottomNavigationBarItem(
            icon:
                selectedIndex == 2
                    ? selectedTab(
                      ImageIcon(AssetImage(AppAssets.profileIcon), size: 35),
                    )
                    : ImageIcon(AssetImage(AppAssets.profileIcon), size: 35),
            label: context.l10n.profile,
          ),
        ],
      ),
    );
  }

  List<Widget> tabs = [ExploreView(), ResultView(), ProfileView()];

  Widget selectedTab(Widget child) {
    return Container(
      width: context.width * 0.16,
      height: context.width * 0.09,
      decoration: BoxDecoration(
        color: AppColors.blue[10],
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
