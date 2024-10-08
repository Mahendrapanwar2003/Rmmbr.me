import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:new_pro/common/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/icons_constant.dart';
import '../constants/string_constants.dart';
import 'common_methods.dart';

class CommonWidgets {
  static appBar({String? title, bool wantBackButton = true}) {
    return AppBar(
      elevation: 0,
      shadowColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      foregroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      leading: wantBackButton
          ? GestureDetector(
              onTap: () {
                Get.back();
              },
              child: CommonMethods.appIcons(
                assetName: IconConstants.icBack,
                height: 34.px,
                width: 34.px,
              ),
            )
          : null,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: Theme.of(Get.context!)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 20.px),
      ),
    );
  }

  static Widget appBarView({String? title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            IconConstants.icBack,
            height: 30.px,
            width: 30.px,
          ),
        ),
        Text(
          title ?? '',
          style: Theme.of(Get.context!)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 20.px),
        ),
        const SizedBox(),
      ],
    );
  }

  static Widget shimmerView({double? height, double? width}) {
    return SizedBox(
      height: height ?? 64.px,
      width: width ?? double.infinity,
      child: Shimmer.fromColors(
        baseColor:
            Theme.of(Get.context!).colorScheme.onSecondary.withOpacity(.4.px),
        highlightColor: Theme.of(Get.context!).colorScheme.onSecondary,
        child: Container(
          color:
              Theme.of(Get.context!).colorScheme.onSecondary.withOpacity(.4.px),
        ),
      ),
    );
  }

  ///For Full Size Use In Column Not In ROW
  static Widget commonElevatedButton(
      {double? height,
      double? width,
      EdgeInsetsGeometry? buttonMargin,
      EdgeInsetsGeometry? contentPadding,
      double? borderRadius,
      Color? splashColor,
      bool wantContentSizeButton = false,
      bool wantBorder = false,
      Color? buttonColor,
      TextStyle? textStyle,
      double? elevation,
      required VoidCallback onPressed,
      required Widget child}) {
    return Container(
      height: wantContentSizeButton ? height : 48.px,
      width: wantContentSizeButton ? width : double.infinity,
      margin: buttonMargin,
      decoration: BoxDecoration(
        border: wantBorder ? Border.all(
            color: Theme.of(Get.context!).colorScheme.primary, width: 1.px):null,
        borderRadius: BorderRadius.circular(borderRadius ?? 32.px),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 0.px,
          padding: contentPadding,
          textStyle: textStyle ??
              Theme.of(Get.context!).textTheme.labelSmall?.copyWith(
                  color: Theme.of(Get.context!).scaffoldBackgroundColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 32.px),
          ),
          backgroundColor:
              buttonColor ?? Theme.of(Get.context!).colorScheme.primary,
          foregroundColor:
              splashColor ?? Theme.of(Get.context!).scaffoldBackgroundColor,
          shadowColor: Colors.transparent,
        ),
        child: child,
      ),
    );
  }

  static Widget commonTextFieldForLoginSignUP(
      {double? elevation,
      String? hintText,
      String? labelText,
      String? errorText,
      String? title,
      TextStyle? titleStyle,
      EdgeInsetsGeometry? contentPadding,
      TextEditingController? controller,
      int? maxLines,
      double? cursorHeight,
      bool wantBorder = false,
      ValueChanged<String>? onChanged,
      FormFieldValidator<String>? validator,
      Color? fillColor,
      Color? initialBorderColor,
      double? initialBorderWidth,
      TextInputType? keyboardType,
      double? borderRadius,
      double? maxHeight,
      TextStyle? hintStyle,
      TextStyle? style,
      TextStyle? labelStyle,
      TextStyle? errorStyle,
      List<TextInputFormatter>? inputFormatters,
      TextCapitalization textCapitalization = TextCapitalization.none,
      bool autofocus = false,
      bool readOnly = false,
      bool hintTextColor = false,
      Widget? suffixIcon,
      Widget? prefixIcon,
      AutovalidateMode? autoValidateMode,
      int? maxLength,
      GestureTapCallback? onTap,
      bool obscureText = false,
      FocusNode? focusNode,
      MaxLengthEnforcement? maxLengthEnforcement,
      bool? filled,
      bool isCard = false}) {
    return Column(
      children: [
        if (title != null && title.isNotEmpty)
          Row(
            children: [
              CommonMethods.textViewLinearGradient(text: title, value: isCard),
            ],
          ),
        if (title != null && title.isNotEmpty) SizedBox(height: 8.px),
        Container(
          margin: EdgeInsets.all(1.4.px),
          decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(borderRadius ?? 6.px),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: Row(
              children: [
                prefixIcon != null
                    ? Row(children: [
                        prefixIcon,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.px),
                          child: Container(
                            width: 1.4.px,
                            height: 30.px,
                            decoration: BoxDecoration(
                              gradient: isCard
                                  ? CommonMethods.commonLinearGradientView()
                                  : CommonMethods
                                      .commonLinearGradientViewGrey(),
                            ),
                          ),
                        ),
                      ])
                    : const SizedBox(),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.px),
                    child: TextFormField(
                      focusNode: focusNode,
                      maxLengthEnforcement: maxLengthEnforcement,
                      obscureText: obscureText,
                      onTap: onTap,
                      maxLength: maxLength,
                      cursorHeight: cursorHeight,
                      cursorColor: Theme.of(Get.context!).primaryColor,
                      autovalidateMode: autoValidateMode,
                      controller: controller,
                      onChanged: onChanged ??
                          (value) {
                            value = value.trim();
                            if (value.isEmpty ||
                                value.replaceAll(" ", "").isEmpty) {
                              controller?.text = "";
                            }
                          },
                      validator: validator,
                      keyboardType: keyboardType ?? TextInputType.streetAddress,
                      readOnly: readOnly,
                      autofocus: autofocus,
                      inputFormatters: inputFormatters,
                      textCapitalization: textCapitalization,
                      style: style ??
                          Theme.of(Get.context!)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 14.px),
                      decoration: InputDecoration(
                        errorText: errorText,
                        counterText: '',
                        errorStyle: errorStyle ??
                            Theme.of(Get.context!)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Theme.of(Get.context!).colorScheme.error),
                        hintText: hintText,
                        labelText: labelText,
                        labelStyle: labelStyle,
                        fillColor:
                            fillColor ?? Theme.of(Get.context!).primaryColor,
                        filled: filled ?? false,
                        hintStyle: hintStyle ??
                            Theme.of(Get.context!).textTheme.titleMedium,
                        disabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                suffixIcon != null
                    ? Row(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.px),
                          child: Container(
                            width: 1.4.px,
                            height: 30.px,
                            decoration: BoxDecoration(
                              gradient: isCard
                                  ? CommonMethods.commonLinearGradientView()
                                  : CommonMethods
                                      .commonLinearGradientViewGrey(),
                            ),
                          ),
                        ),
                        suffixIcon,
                      ])
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }



  static Widget commonDropDownForLoginSignUP(
      {double? elevation,
        String? hintText,
        String? labelText,
        String? errorText,
        String? title,
        TextStyle? titleStyle,
        EdgeInsetsGeometry? contentPadding,
        TextEditingController? controller,
        int? maxLines,
        double? cursorHeight,
        bool wantBorder = false,
        Color? fillColor,
        Color? initialBorderColor,
        double? initialBorderWidth,
        TextInputType? keyboardType,
        double? borderRadius,
        double? maxHeight,
        TextStyle? hintStyle,
        TextStyle? style,
        TextStyle? labelStyle,
        TextStyle? errorStyle,
        List<TextInputFormatter>? inputFormatters,
        TextCapitalization textCapitalization = TextCapitalization.none,
        bool autofocus = false,
        bool readOnly = false,
        bool hintTextColor = false,
        Widget? suffixIcon,
        Widget? prefixIcon,
        AutovalidateMode? autoValidateMode,
        int? maxLength,
        GestureTapCallback? onTap,
        bool obscureText = false,
        FocusNode? focusNode,
        MaxLengthEnforcement? maxLengthEnforcement,
        bool? filled,
        ValueChanged? onChanged,
        dynamic value,
        List<DropdownMenuItem<String>>? items,
        bool isCard = false}) {
    return Column(
      children: [
        if (title != null && title.isNotEmpty)
          Row(
            children: [
              CommonMethods.textViewLinearGradient(text: title, value: isCard),
            ],
          ),
        if (title != null && title.isNotEmpty) SizedBox(height: 8.px),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.px),
          decoration: BoxDecoration(
            color: const Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(borderRadius ?? 6.px),
          ),
          child: DropdownButton<String>(
            style: style ??
                Theme.of(Get.context!)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 14.px),
            value: value,
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Theme.of(Get.context!).textTheme.titleMedium?.color,
            ),
            underline: const SizedBox(),
            items: items,
            hint: Text(
              hintText ?? '',
              style: Theme.of(Get.context!).textTheme.titleMedium,
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }


  static Widget commonTextFieldDropDownForLoginSignUPNew(
      {double? elevation,
      String? hintText,
      String? labelText,
      String? errorText,
      String? title,
      TextStyle? titleStyle,
      EdgeInsetsGeometry? contentPadding,
      TextEditingController? controller,
      int? maxLines,
      double? cursorHeight,
      bool wantBorder = false,
      ValueChanged<String>? onChanged,
      FormFieldValidator<String>? validator,
      Color? fillColor,
      Color? initialBorderColor,
      double? initialBorderWidth,
      TextInputType? keyboardType,
      double? borderRadius,
      double? maxHeight,
      TextStyle? hintStyle,
      TextStyle? style,
      TextStyle? labelStyle,
      TextStyle? errorStyle,
      List<TextInputFormatter>? inputFormatters,
      TextCapitalization textCapitalization = TextCapitalization.none,
      bool autofocus = false,
      bool readOnly = false,
      bool hintTextColor = false,
      Widget? suffixIcon,
      Widget? prefixIcon,
      AutovalidateMode? autoValidateMode,
      int? maxLength,
      GestureTapCallback? onTap,
      bool obscureText = false,
      FocusNode? focusNode,
      MaxLengthEnforcement? maxLengthEnforcement,
      bool? filled,
      required BuildContext context,
      List<DropdownMenuItem>? items,
      bool isCard = false}) {
    return Column(
      children: [
        if (title != null && title.isNotEmpty)
          Row(
            children: [
              CommonMethods.textViewLinearGradient(text: title, value: isCard),
            ],
          ),
        if (title != null && title.isNotEmpty) SizedBox(height: 8.px),
        Container(
          margin: EdgeInsets.all(1.4.px),
          decoration: BoxDecoration(
            color: Color(0xffF3F3F3),
            borderRadius: BorderRadius.circular(borderRadius ?? 14.px),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 2.px),
            child: DropdownButtonFormField(
              icon: Icon(Icons.keyboard_arrow_down_sharp),
              onChanged: (v) {},
              decoration: InputDecoration(
                errorText: errorText,
                counterText: '',
                errorStyle: errorStyle ??
                    Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Theme.of(context).colorScheme.error),
                // suffixIcon: suffixIcon,
                // prefixIcon: prefixIcon,
                hintText: hintText,
                contentPadding:
                    contentPadding ?? EdgeInsets.symmetric(vertical: 2.px),
                labelText: labelText,
                labelStyle: labelStyle,
                fillColor: fillColor ?? Theme.of(context).primaryColor,
                filled: filled ?? false,
                hintStyle: hintStyle ?? Theme.of(context).textTheme.titleMedium,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              items: items,
            ),
          ),
        ),
      ],
    );
  }

  static Widget commonOtpView({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    PinCodeFieldShape? shape,
    TextInputType keyboardType = TextInputType.number,
    List<TextInputFormatter>? inputFormatters,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onCompleted,
    int length = 4,
    double? height,
    double? width,
    double? borderRadius,
    double? borderWidth,
    bool readOnly = false,
    bool autoFocus = true,
    bool enableActiveFill = true,
    bool enablePinAutofill = true,
    bool autoDismissKeyboard = true,
    TextStyle? textStyle,
    Color? cursorColor,
    Color? inactiveColor,
    Color? inactiveFillColor,
    Color? activeColor,
    Color? activeFillColor,
    Color? selectedColor,
    Color? selectedFillColor,
  }) =>
      PinCodeTextField(
        length: length,
        mainAxisAlignment: mainAxisAlignment,
        appContext: Get.context!,
        cursorHeight: 28.px,
        cursorColor: cursorColor ?? Color(0xff939393),
        autoFocus: autoFocus,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters ??
            <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        readOnly: readOnly,
        textStyle: textStyle ?? Theme.of(Get.context!).textTheme.headlineLarge,
        autoDisposeControllers: false,
        enabled: true,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          activeFillColor: Color(0xffF3F3F3),
          inactiveFillColor: Color(0xffF3F3F3),
          selectedFillColor: Color(0xffF3F3F3),
          inactiveColor: Color(0xffF3F3F3),
          activeColor: Color(0xff939393),
          selectedColor: Color(0xffF3F3F3),
          shape: shape ?? PinCodeFieldShape.box,
          fieldWidth: width ?? 62.px,
          fieldHeight: height ?? 62.px,
          borderWidth: borderWidth ?? 1.px,
          borderRadius: BorderRadius.circular(borderRadius ?? 6.px),
        ),
        enableActiveFill: enableActiveFill,
        controller: controller,
        onChanged: onChanged,
        enablePinAutofill: enablePinAutofill,
        onCompleted: onCompleted,
        autoDismissKeyboard: autoDismissKeyboard,
      );

  static imageView({
    double? width,
    double? height,
    double? radius,
    required String image,
    String? defaultNetworkImage,
    BoxFit? fit,
    BorderRadiusGeometry? borderRadius,
  }) {
    return SizedBox(
      height: height ?? 64.px,
      width: width ?? double.infinity,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 8.px),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: fit ?? BoxFit.cover,
          errorWidget: (context, error, stackTrace) {
            return Container(
              height: height ?? 64.px,
              width: width ?? double.infinity,
              color:
                  Theme.of(context).colorScheme.onSecondary.withOpacity(.2.px),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius ?? 8.px),
                child: Icon(Icons.error, color: Theme.of(context).primaryColor),
              ),
            );
          },
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return SizedBox(
              height: height ?? 64.px,
              width: width ?? double.infinity,
              child: Shimmer.fromColors(
                baseColor: Theme.of(context)
                    .colorScheme
                    .onSecondary
                    .withOpacity(.4.px),
                highlightColor: Theme.of(context).colorScheme.onSecondary,
                child: Container(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.4.px),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static switchButton({bool value = false, ValueChanged<bool>? onChanged}) {
    return CupertinoSwitch(
      activeColor: Theme.of(Get.context!).primaryColor,
      value: value,
      onChanged: onChanged,
    );
  }

  static void showAlertDialog(
      {String title = StringConstants.logout,
      String content = StringConstants.wouldYouLikeToLogout,
      VoidCallback? onPressedYes}) {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Get.back(),
            child: const Text(StringConstants.no),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: onPressedYes,
            child: const Text(StringConstants.yes),
          ),
        ],
      ),
    );
  }

  static InputDecoration inputDecoration(
      {String? hintText,
      String? labelText,
      String? errorText,
      EdgeInsetsGeometry? contentPadding,
      Color? fillColor,
      TextStyle? hintStyle,
      TextStyle? labelStyle,
      TextStyle? errorStyle,
      Widget? suffixIcon,
      Widget? prefixIcon,
      bool? filled}) {
    return InputDecoration(
      errorText: errorText,
      counterText: '',
      errorStyle: Theme.of(Get.context!)
          .textTheme
          .titleMedium
          ?.copyWith(color: Theme.of(Get.context!).colorScheme.error),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintText: hintText,
      labelText: labelText,
      labelStyle: Theme.of(Get.context!).textTheme.titleMedium,
      fillColor: Theme.of(Get.context!).primaryColor,
      // filled: filled ?? false,
      contentPadding: EdgeInsets.symmetric(vertical: 4.px, horizontal: 16.px),
      hintStyle: Theme.of(Get.context!).textTheme.titleMedium,
      disabledBorder: border(color: Theme.of(Get.context!).colorScheme.surface),
      border: border(color: Theme.of(Get.context!).colorScheme.surface),
      errorBorder: border(color: Theme.of(Get.context!).colorScheme.surface),
      enabledBorder: border(color: Theme.of(Get.context!).colorScheme.surface),
      focusedErrorBorder: border(),
      focusedBorder: border(),
    );
  }

  static border({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
          color: color ?? Theme.of(Get.context!).primaryColor, width: 2.px),
      borderRadius: BorderRadius.circular(14.px),
    );
  }

  static Future<bool> internetConnectionCheckerMethod() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
    try {
      final result = await http.get(Uri.parse('https://www.google.com/'));
      if (result.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBarView1({String title = ''}) {
    var snackBar = SnackBar(
      content: Text(title,
          style: Theme.of(Get.context!)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 14.px)),
      backgroundColor: Theme.of(Get.context!).colorScheme.onSecondary,
    );
    return ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static SnackbarController snackBarView({String title = ''}) {
    return Get.snackbar(margin: EdgeInsets.all(20.px), 'Message', title);
  }

  static void showImagePopup({required String image}) {
    Get.bottomSheet(
        backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
        Column(children: [
          SizedBox(height: 40.px),
          CommonWidgets.appBar(),
          CommonWidgets.imageView(
              image: image,
              width: MediaQuery.of(Get.context!).size.width,
              height: MediaQuery.of(Get.context!).size.height / 1.2.px,
              borderRadius: BorderRadius.circular(20.px),
              fit: BoxFit.contain)
        ]),
        isScrollControlled: true);
    /*showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CommonWidgets.imageView(
              image: image,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              borderRadius: BorderRadius.circular(20.px),
              fit:  BoxFit.contain
            ),
          ),
        );
      },
    );*/
  }

  static Widget commonAppBarView({
    bool isBackButtonVisible = true,
    bool isNotificationClick = true,
    required String appBarTitle,
  }) => Container(
    width: double.infinity,
    height: 120.px,
    padding: EdgeInsetsDirectional.only(start: 24.px, end: 24.px, top: 50.px, bottom: 16.px),
    decoration: BoxDecoration(
      color: AppLightColors().text,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(24.px),
        bottomLeft: Radius.circular(24.px),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isBackButtonVisible)
          GestureDetector(
            onTap: () => Get.back(),
            child: SizedBox(
              height: 54.px,
              // width: 54.px,
              child: Center(
                child: CommonMethods.appIcons(
                  assetName: IconConstants.icBackArrow,
                  width: 24.px,
                  height: 24.px,
                ),
              ),
            ),
          )
        else
          SizedBox(
            height: 54.px,
            width: 54.px,
          ),
        if (isBackButtonVisible) SizedBox(width: 24.px),
        Flexible(
          flex: 3,
          child: Text(
            appBarTitle,
            style: Theme.of(Get.context!).textTheme.headlineLarge?.copyWith(
              color: Theme.of(Get.context!).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Flexible(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  '20',
                  style: Theme.of(Get.context!).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(Get.context!).colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              SizedBox(width: 4.px),
              CommonMethods.appIcons(
                assetName: IconConstants.icPpCoin,
                width: 24.px,
                height: 24.px,
              ),
              SizedBox(width: 12.px),
              GestureDetector(
                onTap: () {
                  if(isNotificationClick) {
                    Get.toNamed(Routes.NOTIFICATION);
                  }
                },
                child: CommonMethods.appIcons(
                  assetName: IconConstants.notification,
                  width: 24.px,
                  height: 24.px,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );

  static Widget commonSearchFieldView() {
    return Container(
      height: 44.px,
      padding: EdgeInsets.symmetric(horizontal: 16.px),
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12.px),
        boxShadow: [
          BoxShadow(
            color: AppLightColors().text.withOpacity(.12), // Shadow color
            blurRadius: 10.px, // Blur radius
            offset: Offset(1.px, 0.px), // Shadow offset
          ),
        ],
      ),
      child: Row(
        children: [
          CommonMethods.appIcons(
            assetName: IconConstants.icSearch,
            width: 16.px,
            height: 16.px,
          ),
          SizedBox(width: 8.px),
          Expanded(
            child: TextField(
              cursorHeight: 20.px,
              style: Theme.of(Get.context!).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 4.px),
                hintStyle: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static commonDividerView({double? height,Color? color,double? thickness}) {
    return Divider(
      height: height ?? 0.px,
      color: color ?? Theme.of(Get.context!).colorScheme.primary.withOpacity(.1),
      thickness: thickness ?? 1.px,
    );
  }

  static Widget commonMsgFieldView() {
    return Container(
      height: 40.px,
      padding: EdgeInsets.symmetric(horizontal: 16.px),
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).colorScheme.surface.withOpacity(.2),
        borderRadius: BorderRadius.circular(20.px),
        // boxShadow: [
        //   BoxShadow(
        //     color: AppLightColors().text.withOpacity(.12), // Shadow color
        //     blurRadius: 10.px, // Blur radius
        //     offset: Offset(1.px, 0.px), // Shadow offset
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorHeight: 20.px,
              style: Theme.of(Get.context!).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                hintText: 'Type massege...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 10.px),
                hintStyle: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(width: 8.px),
          CommonMethods.appIcons(
            assetName: IconConstants.icEmoji,
            width: 24.px,
            height: 24.px,
          ),
        ],
      ),
    );
  }

}

enum ErrorAnimationType { shake, clear }
