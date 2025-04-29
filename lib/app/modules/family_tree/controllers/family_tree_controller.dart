import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../apis/api_Methods.dart';
import '../../../../apis/api_key_constants.dart';
import '../../../../apis/api_models/get_relation_requests_model.dart';
import '../../../../apis/api_models/user_data_model.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../constants/icons_constant.dart';
import '../../../../constants/size_constants.dart';
import '../../profile/views/profile_view.dart';

class FamilyTreeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;

  final selectedTab = 0.obs;
  final isOpenBottom = 0.obs;
  final inAsyncCall = true.obs;

  final selectedOption = ''.obs;
  final userId = ''.obs;
  final initialUrl = ''.obs;

  final List<String> relationShipOptions = ['CURRENT', 'FORMER'];
  late WebViewController webViewController;
  List<Requests> requests = [];

  final isBottomSheetAlreadyOpened = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    initializeWebView();
    await getApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  clickOnTab({required int value}) async {
    selectedTab.value = value;
    increment();
    if (selectedTab.value == 0) {
      inAsyncCall.value = true;
      increment();
      webViewController.reload();
      inAsyncCall.value = false;
      increment();
    } else {
      await getApi();
    }
  }

  void clickOnAddMember({required BuildContext context, required String r_id}) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      barrierColor: Colors.black87,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.px),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConstants.bodyHorizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.px),
                Container(
                  height: 5.px,
                  width: 40.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.px),
                    color: Theme.of(context)
                        .colorScheme
                        .surface
                        .withOpacity(.2.px),
                  ),
                ),
                SizedBox(height: 12.px),
                userDataCardView(),
                Divider(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                  height: 1.px,
                ),
                ListTile(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.ADD_MEMBER, arguments: r_id);
                  },
                  title: Text(
                    'Add new member',
                    style: Theme.of(Get.context!).textTheme.labelLarge,
                  ),
                  leading: CommonMethods.appIcons(
                      assetName: IconConstants.icEditProfile),
                ),
                Divider(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                  height: 1.px,
                ),
                ListTile(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.EDIT_MEMBER);
                  },
                  title: Text(
                    'Edit',
                    style: Theme.of(Get.context!).textTheme.labelLarge,
                  ),
                  leading: CommonMethods.appIcons(
                      assetName: IconConstants.icEditMember),
                ),
                Divider(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                  height: 1.px,
                ),
                ListTile(
                  onTap: () => clickOnDeleteMember(),
                  title: Text(
                    'Delete Member',
                    style: Theme.of(Get.context!).textTheme.labelLarge,
                  ),
                  leading: CommonMethods.appIcons(
                      assetName: IconConstants.icDeleteMember),
                ),
                Divider(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                  height: 1.px,
                ),
                ListTile(
                  onTap: () => clickOnReportMember(),
                  title: Text(
                    'Report Member',
                    style: Theme.of(Get.context!).textTheme.labelLarge,
                  ),
                  leading: CommonMethods.appIcons(
                      assetName: IconConstants.icReportMember),
                ),
                Divider(
                  color:
                      Theme.of(context).colorScheme.surface.withOpacity(.2.px),
                  height: 1.px,
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(
      () {
        isBottomSheetAlreadyOpened.value = false;
        webViewController.loadRequest(Uri.parse(initialUrl.value));
        increment();
      },
    );
  }

  Widget userDataCardView() => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 12.px),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            userProfileView(),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: userNameTextView(),
                      ),
                      checkIconView(),
                    ],
                  ),
                  SizedBox(height: 4.px),
                  userDetailTextView(text: '1970, Hamburg'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: CommonMethods.appIcons(assetName: IconConstants.icCross),
            )
          ],
        ),
      );

  Widget userProfileView() => Container(
        height: 61.px,
        width: 61.px,
        margin: EdgeInsets.only(right: 9.px),
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

  Widget userNameTextView() => Text(
        'Erina Yamashita ',
        style:
            Theme.of(Get.context!).textTheme.labelSmall?.copyWith(height: 1.2),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget checkIconView() => CommonMethods.appIcons(
        assetName: IconConstants.icCheck,
        width: 12.px,
        height: 12.px,
      );

  Widget userDetailTextView({required String text}) => Text(
        text,
        style: Theme.of(Get.context!)
            .textTheme
            .titleMedium
            ?.copyWith(height: 1.2, fontSize: 10.px),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  void clickOnDeleteMember() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Obx(
          () {
            count.value;
            return Dialog(
              insetPadding: EdgeInsets.symmetric(
                  horizontal: SizeConstants.bodyHorizontalPadding),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConstants.bodyHorizontalPadding,
                    vertical: 24.px),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Delete Member',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onTap: () => Get.back(),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.px),
                    Text(
                      'Confirm delete this family member?',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.surface),
                    ),
                    SizedBox(height: 24.px),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 42.px,
                          child: CommonWidgets.commonElevatedButton(
                            wantBorder: false,
                            buttonColor: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(.4.px),
                            onPressed: () => Get.back(),
                            child: Text(
                              'Cancel',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      color: Theme.of(Get.context!)
                                          .colorScheme
                                          .primary),
                            ),
                          ),
                        )),
                        SizedBox(width: 10.px),
                        Expanded(
                          child: SizedBox(
                            height: 42.px,
                            child: const ProfileView().commonEleButtonView(
                              buttonText: 'Save',
                              onPressed: () => Get.back(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void clickOnReportMember() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Obx(
          () {
            count.value;
            return Dialog(
              insetPadding: EdgeInsets.symmetric(
                  horizontal: SizeConstants.bodyHorizontalPadding),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConstants.bodyHorizontalPadding,
                    vertical: 24.px),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Report Member',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onTap: () => Get.back(),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.px),
                    Text(
                      'Confirm Report this family member?',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.surface),
                    ),
                    SizedBox(height: 24.px),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 42.px,
                          child: CommonWidgets.commonElevatedButton(
                            wantBorder: false,
                            buttonColor: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(.4.px),
                            onPressed: () => Get.back(),
                            child: Text(
                              'Cancel',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                      color: Theme.of(Get.context!)
                                          .colorScheme
                                          .primary),
                            ),
                          ),
                        )),
                        SizedBox(width: 10.px),
                        Expanded(
                          child: SizedBox(
                            height: 42.px,
                            child: const ProfileView().commonEleButtonView(
                              buttonText: 'Report',
                              onPressed: () => Get.back(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> clickOnAcceptButton({required int index}) async {
    if (requests[index].userId != null && requests[index].userId!.isNotEmpty) {
      inAsyncCall.value = true;
      increment();
      Map<String, dynamic> bodyParams = {
        ApiKeyConstants.userIdStatic: requests[index].userId.toString(),
        ApiKeyConstants.confirmation: true,
      };
      UserDataModel? userDataModel =
          await ApiMethods.confirmRelation(bodyParams: bodyParams);
      print('userDataModel::::::::::::::::::${userDataModel}');
      if (userDataModel != null) {
        inAsyncCall.value = true;
        increment();
       await getApi();
        inAsyncCall.value = false;
        increment();
        //Get.offAllNamed(Routes.LOGIN);
      }
      inAsyncCall.value = false;
      increment();
    } else {
      CommonMethods.showToast(msg: 'All field request!');
    }
    /*showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Obx(
          () {
            count.value;
            return Dialog(
              insetPadding: EdgeInsets.symmetric(
                  horizontal: SizeConstants.bodyHorizontalPadding),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConstants.bodyHorizontalPadding,
                    vertical: 24.px),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Text(
                            'Please Confirm relationship with your partner',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: Theme.of(Get.context!)
                                      .colorScheme
                                      .primary,
                                  fontSize: 20.px,
                                ),
                          ),
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onTap: () => Get.back(),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.px),
                    Wrap(
                      children: [
                        Row(
                          children: List.generate(
                            relationShipOptions.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    selectedOption.value =
                                        relationShipOptions[index];
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 14.px,
                                        width: 14.px,
                                        margin: EdgeInsets.only(right: 8.px),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: selectedOption.value
                                                    .contains(
                                                        relationShipOptions[
                                                            index])
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                          ),
                                        ),
                                        child: Center(
                                          child: Container(
                                            height: 8.px,
                                            width: 8.px,
                                            decoration: BoxDecoration(
                                              color: selectedOption.value
                                                      .contains(
                                                          relationShipOptions[
                                                              index])
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                  : Colors.transparent,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        relationShipOptions[index]
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: selectedOption.value
                                                      .contains(
                                                          relationShipOptions[
                                                              index])
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .primary
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .surface,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.px),
                    SizedBox(
                      height: 42.px,
                      child: const ProfileView().commonEleButtonView(
                        buttonText: 'Save',
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );*/
  }

  Future<void> initializeWebView() async {
    // Fetch user ID from SharedPreferences asynchronously
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId.value = sp.getString(ApiKeyConstants.userId) ?? '';

    // Build the URL
    initialUrl.value = 'http://157.173.222.27:3004/tree-app/${userId.value}';

    print('initialUrl.value:::::::::::: ${initialUrl.value}');

    // Initialize the WebViewController after the URL is ready
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print('Loading progress: $progress');
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');

            // Check if URL contains https://example.com/
            if (url.contains('https://example.com/')) {
              Uri uri = Uri.parse(url);
              String lastSegment = uri.pathSegments.last;
              print('lastSegment::::::::::::::::::::::::$lastSegment');
              // Only call the method and reload if it hasn't been done yet
              if (!isBottomSheetAlreadyOpened.value) {
                clickOnAddMember(
                  context: Get.context!,
                  r_id: lastSegment,
                );
                isBottomSheetAlreadyOpened.value =
                    true; // Set the flag to true to prevent re-execution
                // Reload the WebView with the initial URL after calling the method
                webViewController.loadRequest(Uri.parse(initialUrl.value));
              }
            }
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          onHttpError: (HttpResponseError error) {
            print('HTTP error occurred: ${error.toString()}');
          },
          onWebResourceError: (WebResourceError error) {
            print('Web resource error occurred: ${error.toString()}');
          },
          onNavigationRequest: (NavigationRequest request) {
            print('Navigation request: ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(initialUrl
          .value)); // Load the initial URL when the web view is created

    inAsyncCall.value = false;
    increment();
  }

  Future<void> getApi() async {
    inAsyncCall.value = true;
    increment();
    GetRelationRequestsModel? getRelationRequestsModel =
        await ApiMethods.getRelationRequests();
    if (getRelationRequestsModel != null &&
        getRelationRequestsModel.requests != null &&
        getRelationRequestsModel.requests!.isNotEmpty) {
      requests.clear();
      requests = getRelationRequestsModel.requests!;
      increment();
    }
    inAsyncCall.value = false;
    increment();
  }
}
