import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:x_calcu/global/utils/showcase_helper.dart';

/// مثال بسيط لاستخدام ShowcaseView
class TestShowcaseScreen extends StatelessWidget {
  const TestShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Showcase'),
        actions: [
          IconButton(
            onPressed: () => ShowcaseHelper.startShowcase(context),
            icon: const Icon(Icons.help),
          ),
        ],
      ),
      body: Column(
        children: [
          // مثال 1: البحث
          Showcase(
            key: ShowcaseHelper.getUniqueShowcaseKey('test_home_search'),
            title: 'البحث',
            description: 'يمكنك البحث هنا',
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Text('حقل البحث'),
                ],
              ),
            ),
          ),

          // مثال 2: التصفية
          Showcase(
            key: ShowcaseHelper.getShowcaseKey(ShowcaseKeys.homeFilterToggle),
            title: 'التصفية',
            description: 'اضغط هنا للتصفية',
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.filter_list),
                  SizedBox(width: 8),
                  Text('زر التصفية'),
                ],
              ),
            ),
          ),

          // مثال 3: الترتيب
          Showcase(
            key: ShowcaseHelper.getUniqueShowcaseKey('test_home_sort_button'),
            title: 'الترتيب',
            description: 'اضغط هنا للترتيب',
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.sort),
                  SizedBox(width: 8),
                  Text('زر الترتيب'),
                ],
              ),
            ),
          ),

          const Spacer(),

          // زر بدء البرنامج التعليمي
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () => ShowcaseHelper.startShowcase(context),
              child: const Text('بدء البرنامج التعليمي'),
            ),
          ),
        ],
      ),
    );
  }
}
