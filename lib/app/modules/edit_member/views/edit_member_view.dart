import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:new_pro/constants/string_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_methods.dart';
import '../../../../constants/icons_constant.dart';
import '../../sign_up/controllers/sign_up_controller.dart';
import '../controllers/edit_member_controller.dart';

class EditMemberView extends GetView<EditMemberController> {
  const EditMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.increment();
        return Scaffold(
          body: Column(
            children: [
              CommonWidgets.commonAppBarView(
                  isBackButtonVisible: false,
                  appBarTitle: StringConstants.editMember),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: SizeConstants.bodyHorizontalPadding,
                      vertical: 32.px),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 32.px),
                          Center(
                            child: CommonMethods.appIconsPng(
                                assetName: IconConstantsPng.icAddProfileImage,
                                height: 64.px,
                                width: 64.px),
                          ),
                          SizedBox(height: 16.px),
                          Center(
                            child: Text(
                              StringConstants.addProfileImage,
                              style:
                                  Theme.of(Get.context!).textTheme.labelMedium,
                            ),
                          ),
                          SizedBox(height: 24.px),
                          CommonWidgets.commonDropDownForLoginSignUP(
                            title: StringConstants.relation,
                            hintText: StringConstants.enterHere,
                            controller: controller.relationController,
                          ),
                          SizedBox(height: 16.px),
                          CommonWidgets.commonTextFieldForLoginSignUP(
                            title: StringConstants.fullName,
                            hintText: StringConstants.enterHere,
                            controller: controller.fullNameController,
                          ),
                          SizedBox(height: 16.px),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child:
                                    CommonWidgets.commonTextFieldForLoginSignUP(
                                  title: StringConstants.mobilePhoneNumber,
                                  hintText: StringConstants.enterHere,
                                  controller:
                                      controller.mobilePhoneNumberController,
                                ),
                              ),
                              SizedBox(width: 6.px),
                              InkWell(
                                onTap: () => controller.clickOnCountryField(),
                                borderRadius: BorderRadius.circular(14.px),
                                child: Container(
                                  height: 54.px,
                                  width: 54.px,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF3F3F3),
                                    borderRadius: BorderRadius.circular(6.px),
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.countryCodeShow.value,
                                      style: Theme.of(Get.context!)
                                          .textTheme
                                          .headlineMedium
                                          ?.copyWith(fontSize: 14.px),
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.px),
                          CommonWidgets.commonTextFieldForLoginSignUP(
                            title: StringConstants.email,
                            hintText: StringConstants.enterHere,
                            controller: controller.emailController,
                          ),
                          SizedBox(height: 16.px),
                          CommonWidgets.commonTextFieldForLoginSignUP(
                            title: StringConstants.dob,
                            hintText: StringConstants.dobHint,
                            controller: controller.dobController,
                          ),
                          SizedBox(height: 16.px),
                          Text(
                            StringConstants.gender,
                            style: Theme.of(Get.context!).textTheme.labelMedium,
                          ),
                          SizedBox(height: 16.px),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              gender(
                                title: StringConstants.male,
                                value: Gender.male,
                                onChanged: (index) {
                                  controller.gender = Gender.male;
                                  controller.count;
                                },
                              ),
                              gender(
                                title: StringConstants.female,
                                value: Gender.female,
                                onChanged: (index) {
                                  controller.gender = Gender.female;
                                  controller.count;
                                },
                              ),
                              gender(
                                title: StringConstants.nonBinary,
                                value: Gender.nonBinary,
                                onChanged: (index) {
                                  controller.gender = Gender.nonBinary;
                                  controller.count;
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16.px),
                          CommonWidgets.commonDropDownForLoginSignUP(
                            title: StringConstants.country,
                            hintText: StringConstants.enterHere,
                            controller: controller.countryController,
                          ),
                          SizedBox(height: 16.px),
                          CommonWidgets.commonDropDownForLoginSignUP(
                            title: StringConstants.city,
                            hintText: StringConstants.enterHere,
                            controller: controller.cityController,
                          ),
                          SizedBox(height: 40.px),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () =>
                                controller.clickOnSaveChangesButton(),
                            child: const Text(StringConstants.saveChanges),
                          ),
                          SizedBox(height: 20.px),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget gender({
    required String title,
    required Gender value,
    required ValueChanged? onChanged,
  }) {
    return Row(
      children: [
        Theme(
          data: ThemeData(
            disabledColor: Theme.of(Get.context!).colorScheme.surface,
          ),
          child: Radio(
            value: value,
            groupValue: controller.gender,
            onChanged: onChanged,
            activeColor: Theme.of(Get.context!).primaryColor,
          ),
        ),
        Text(
          title,
          style: Theme.of(Get.context!).textTheme.headlineSmall,
        )
      ],
    );
  }
}
