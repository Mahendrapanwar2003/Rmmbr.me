import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/terms_of_use_controller.dart';

class TermsOfUseView extends GetView<TermsOfUseController> {
  const TermsOfUseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonWidgets.commonAppBarView(appBarTitle: 'Terms of Use'),
          Expanded(
            child: ListView(
              padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
              children: [
                Text(
                  'Terms & Conditions',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 20.px,
                    color: Theme.of(context).colorScheme.primary
                  ),
                ),
                SizedBox(height: 24.px),
                Text(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum''',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: 24.px),
                Text(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum''',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
