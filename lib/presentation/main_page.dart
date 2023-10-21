import 'package:flutter/material.dart';

import '../data/constants/app_colors.dart';
import 'add_task_page/add_task.dart';
import 'calendar_page/calendar_page.dart';
import 'home_page/home_page.dart';
import 'profile_page/profile_page.dart';
import 'tasks_page/task_page.dart';
import 'widgets/custom_bottom_app_bar.dart';

class PagesController extends StatefulWidget {
  const PagesController({super.key});

  @override
  State<PagesController> createState() => _PagesControllerState();
}

class _PagesControllerState extends State<PagesController> {
  late final PageController pageController;

  @override
  void initState() {
    
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int value) {
    pageController.animateToPage(
      value,
      duration: const Duration(microseconds: 200),
      curve: Curves.linear,
    );
  }

  void openTaskAddPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TaskAddPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        onPressed: openTaskAddPage,
        child: const Center(
          child: Icon(
            Icons.add,
            size: 30,
            color: AppColors.whiteColor,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onPressed: onPageChanged,
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomePage(),
            TasksPage(),
            SizedBox(),
            CalendarPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
