import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/common_methods.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/reported_accounts_controller.dart';

class ReportedAccountsView extends GetView<ReportedAccountsController> {
  const ReportedAccountsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonWidgets.commonAppBarView(appBarTitle: 'Reported Accounts'),
          Expanded(
            child: ListView(
              padding: EdgeInsetsDirectional.symmetric(horizontal: SizeConstants.bodyHorizontalPadding, vertical: 32.px),
              children: [
                usersListView()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget usersListView() => ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: 10,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(bottom: index != 9 ? 16.px : 0.px,),
        child: userDataCardView(index:index),
      );
    },
  );

  Widget userDataCardView({required int index}) => Container(
    height: 76.px,
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 17.px, vertical: 8.px),
    decoration: BoxDecoration(
      color: Theme.of(Get.context!).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(12.px),
    ),
    child: Row(
      children: [
        userProfileView(index:index),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              userNameTextView(index:index),
              SizedBox(height: 4.px),
              userDetailTextView(text: 'Dallas , US'),
            ],
          ),
        ),
      ],
    ),
  );

  Widget userProfileView({required int index}) => Container(
    height: 61.px,
    width: 61.px,
    margin: EdgeInsets.only(right: 11.px),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      shape: BoxShape.circle,
    ),
    child: CommonMethods.appIconsPng(
      assetName: 'assets/images/profile_dummy.png',
      height: 60.px,
      width: 60.px,
    ),
  );

  Widget userNameTextView({required int index}) => Text(
    'Ryan Yashmak ',
    style: Theme.of(Get.context!).textTheme.labelSmall?.copyWith(height: 1.2,fontSize: 17.px,fontWeight: FontWeight.w500),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  Widget userDetailTextView({required String text}) => Text(
    text,
    style: Theme.of(Get.context!).textTheme.titleMedium
        ?.copyWith(height: 1.2,fontSize: 14.px),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

}
