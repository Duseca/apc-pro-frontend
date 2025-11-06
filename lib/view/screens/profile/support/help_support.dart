import 'package:apc_pro/consts/app_colors.dart';
import 'package:apc_pro/view/screens/profile/support/contact_support.dart';
import 'package:apc_pro/view/screens/profile/support/faqs.dart';
import 'package:apc_pro/view/screens/profile/support/report_issue.dart';
import 'package:apc_pro/view/widgets/appbar.dart';
import 'package:apc_pro/view/widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({super.key});

  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  final List<String> tabs = [
    "FAQ's",
    'Contact Support',
    'Report an Issue',
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(
        context: context,
        title: 'Support and Help',
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTabbar(
              items: tabs,
              controller: tabController,
              hasborder: false,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: const BouncingScrollPhysics(),
                children: const [Faqs(), ContactSupport(), ReportIssue()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
