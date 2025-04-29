import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/common/common_widgets.dart';
import 'package:new_pro/common/progress_bar.dart';
import 'package:new_pro/constants/size_constants.dart';
import 'package:new_pro/constants/string_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_methods.dart';
import '../../../../constants/icons_constant.dart';
import '../../sign_up/controllers/sign_up_controller.dart';
import '../controllers/add_member_controller.dart';

class AddMemberView extends GetView<AddMemberController> {
  const AddMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return Scaffold(
          body: Column(
            children: [
              CommonWidgets.commonAppBarView(
                  appBarTitle: StringConstants.editMember),
              Expanded(
                child: ProgressBar(
                  inAsyncCall: controller.inAsyncCall.value,
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
                            SizedBox(height: 22.px),
                            GestureDetector(
                              onTap: () => controller.clickOnProfile(),
                              child: controller.imageValue.value != null
                                  ? Center(
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(32.px),
                                        child: Image.file(
                                          controller.imageValue.value!,
                                          height: 64.px,
                                          width: 64.px,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Column(
                                      children: [
                                        Center(
                                          child: CommonMethods.appIconsPng(
                                              assetName: IconConstantsPng
                                                  .icAddProfileImage,
                                              height: 64.px,
                                              width: 64.px),
                                        ),
                                        SizedBox(height: 16.px),
                                        Center(
                                          child: Text(
                                            StringConstants.addProfileImage,
                                            style: Theme.of(Get.context!)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                            SizedBox(height: 24.px),
                            CommonWidgets.commonDropDownForLoginSignUP(
                              title: StringConstants.relation,
                              hintText: StringConstants.enterHere,
                              value:
                                  controller.relationController.text.isNotEmpty
                                      ? controller.relationController.text
                                      : null,
                              //controller: controller.relationController,
                              items: controller.items,
                              onChanged: (value) {
                                controller.inAsyncCall.value = true;
                                controller.relationController.text = value;
                                controller.count.value;
                                controller.inAsyncCall.value = false;
                                print(
                                    'controller.relationController::::::::::::::${controller.relationController.text}');
                              },
                            ),
                            SizedBox(height: 16.px),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              title: StringConstants.fullName,
                              hintText: StringConstants.enterHere,
                              controller: controller.fullNameController,
                            ),
                            SizedBox(height: 16.px),
                            Text(
                              StringConstants.mobilePhoneNumber,
                              style:
                                  Theme.of(Get.context!).textTheme.labelMedium,
                            ),
                            SizedBox(height: 16.px),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(6.px),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        controller.clickOnCountryField(),
                                    borderRadius: BorderRadius.circular(14.px),
                                    child: Container(
                                      height: 54.px,
                                      // width: 54.px,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF3F3F3),
                                        borderRadius:
                                            BorderRadius.circular(6.px),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '  ${controller.countryCode.value}  |  ${controller.countryCodeShow.value}',
                                          style: Theme.of(Get.context!)
                                              .textTheme
                                              .titleMedium,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: CommonWidgets
                                        .commonTextFieldForLoginSignUP(
                                            // title: StringConstants.mobilePhoneNumber,
                                            hintText: StringConstants.enterHere,
                                            controller: controller
                                                .mobilePhoneNumberController,
                                            keyboardType: TextInputType.phone),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.px),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              title: StringConstants.email,
                              hintText: StringConstants.enterHere,
                              controller: controller.emailController,
                            ),
                            SizedBox(height: 16.px),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              onTap: () => controller.clickOnDob(),
                              readOnly: true,
                              title: StringConstants.dob,
                              hintText: StringConstants.dobHint,
                              controller: controller.dobController,
                            ),
                            SizedBox(height: 16.px),
                            Text(
                              StringConstants.gender,
                              style:
                                  Theme.of(Get.context!).textTheme.labelMedium,
                            ),
                            SizedBox(height: 16.px),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                gender(
                                  title: StringConstants.male,
                                  value: Gender.male,
                                  onChanged: (index) {
                                    controller.inAsyncCall.value = true;
                                    controller.gender.value = Gender.male;
                                    controller.increment();
                                    controller.inAsyncCall.value = false;
                                  },
                                ),
                                gender(
                                  title: StringConstants.female,
                                  value: Gender.female,
                                  onChanged: (index) {
                                    controller.inAsyncCall.value = true;
                                    controller.gender.value = Gender.female;
                                    controller.increment();
                                    controller.inAsyncCall.value = false;
                                  },
                                ),
                                gender(
                                  title: StringConstants.nonBinary,
                                  value: Gender.nonBinary,
                                  onChanged: (index) {
                                    controller.inAsyncCall.value = true;
                                    controller.gender.value = Gender.nonBinary;
                                    controller.increment();
                                    controller.inAsyncCall.value = false;
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 16.px),
                            Theme(
                              data: ThemeData(
                                iconTheme: const IconThemeData(
                                  color: Color(0xff939393),
                                ),
                                hintColor: const Color(0xff939393),
                              ),
                              child: CSCPicker(
                                onCountryChanged: (value) {
                                  controller.countryController.text =
                                      value ?? '';
                                  controller.count.value;
                                },
                                onStateChanged: (value) {
                                  controller.stateController.text = value ?? '';
                                  controller.count.value;
                                },
                                onCityChanged: (value) {
                                  controller.cityController.text = value ?? '';
                                  controller.count.value;
                                },
                                dropdownHeadingStyle: Theme.of(Get.context!)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 14.px),
                                dropdownItemStyle: Theme.of(Get.context!)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 14.px),
                                selectedItemStyle: Theme.of(Get.context!)
                                    .textTheme
                                    .titleMedium,
                                dropdownDecoration: BoxDecoration(
                                  color: const Color(0xffF3F3F3),
                                  borderRadius: BorderRadius.circular(6.px),
                                ),
                                cityDropdownLabel: StringConstants.city,
                                countryDropdownLabel: StringConstants.country,
                                stateDropdownLabel: StringConstants.state,
                                disabledDropdownDecoration: BoxDecoration(
                                  color: const Color(0xffF3F3F3),
                                  borderRadius: BorderRadius.circular(6.px),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.px),
                            /*SizedBox(height: 16.px),
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
                            SizedBox(height: 40.px),*/
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
    required ValueChanged<Gender?>? onChanged,
  }) {
    return Row(
      children: [
        Obx(() {
          return Theme(
            data: ThemeData(
              disabledColor: Theme.of(Get.context!).colorScheme.surface,
            ),
            child: Radio<Gender>(
              value: value,
              groupValue: controller.gender.value,
              // Accessing the value of the observable
              onChanged: onChanged != null
                  ? (val) {
                controller.gender.value = val; // Update observable gender
                onChanged(val); // Trigger external callback if provided
              }
                  : null,
              activeColor: Theme.of(Get.context!).primaryColor,
            ),
          );
        }),
        Text(
          title,
          style: Theme.of(Get.context!).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
