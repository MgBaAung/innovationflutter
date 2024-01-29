import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovation/dimensions/dimension_manager.dart';
import 'package:innovation/screens/pick_up/network/pickup_controller.dart';
import 'package:innovation/screens/pick_up/widget/logout_error.dart';
import 'package:innovation/screens/pick_up/widget/logout_loading.dart';
import 'package:innovation/screens/pick_up/widget/pickup_item_widget.dart';
import 'package:innovation/theme/app_color.dart';
import 'package:innovation/utils/text_styles.dart';
import 'package:pull_to_refresh_plus/pull_to_refresh_plus.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({super.key});

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  PickupController controller = Get.find<PickupController>();
  final List<String> _tabs = <String>[
    'Pickup on way',
    'Pickup Completed',
    'Pickup Cancel'
  ];

  @override
  void initState() {
    controller.pickupInitFunctions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: DM.screenHeight,
            width: DM.screenWidth,
            child: DefaultTabController(
              length: _tabs.length,
              initialIndex: 1,
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverAppBar(
                        title: GestureDetector(
                          onTap: () {
                            showDialog(
                              builder: (ctxt) {
                                return SizedBox(
                                  child: AlertDialog(
                                    title: const Text("Logout"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                            "Do you Really want to logout?"),
                                        GetBuilder<PickupController>(
                                            builder: (controller) {
                                          var state =
                                              controller.logoutState.value;
                                          if (state is LogoutLoading) {
                                            return const LogoutLoading();
                                          }
                                          if (state is GEtLogoutSuccessState) {
                                            Navigator.of(context).pop();
                                          }
                                          if (state is GetLogoutErrorState) {
                                            return const LogoutError();
                                          }
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                child: const Text("Cancel"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              TextButton(
                                                child: const Text("Logout"),
                                                onPressed: () {
                                                  //Navigator.of(context).pop();
                                                  controller.logout();
                                                },
                                              )
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              barrierDismissible: false,
                              context: context,
                            );
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text('Logout'),
                          ),
                        ),
                        pinned: true,
                        centerTitle: false,
                        expandedHeight: 130.0,
                        forceElevated: innerBoxIsScrolled,
                        bottom: TabBar(
                          labelStyle: const TextStyle(
                            fontSize: 11,
                          ),
                          indicatorColor: AppColor.redColor,
                          unselectedLabelColor: AppColor.white,
                          labelColor: AppColor.white,
                          tabs: _tabs
                              .map(
                                (String name) => Tab(text: name),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    SafeArea(
                      top: false,
                      bottom: false,
                      child: Container(),
                    ),
                    SafeArea(
                      top: false,
                      bottom: false,
                      child: Builder(
                        builder: (BuildContext context) {
                          return SmartRefresher(
                            controller: controller.pickupRefresher,
                            enablePullDown: true,
                            enablePullUp: true,
                            footer: _footer(),
                            onRefresh: _onRefresh,
                            onLoading: _onLoading,
                            child: CustomScrollView(
                              slivers: <Widget>[
                                SliverOverlapInjector(
                                  handle: NestedScrollView
                                      .sliverOverlapAbsorberHandleFor(context),
                                ),
                                SliverPadding(
                                  padding: const EdgeInsets.all(8.0),
                                  sliver: GetBuilder<PickupController>(
                                      builder: (controller) {
                                    final state = controller.pickupState.value;

                                    if (state is GetPickupSuccessState) {
                                      return SliverFixedExtentList(
                                        itemExtent: 100.0,
                                        delegate: SliverChildBuilderDelegate(
                                          (BuildContext context, int index) {
                                            var item =
                                                controller.modelList[index];
                                            return PickupItemWidget(
                                              total: item.totalWays ?? 0.0,
                                              township:
                                                  item.onTownshipName ?? "",
                                              date: item.pickupDate ?? "",
                                              phone: item.osPrimaryPhone ?? "",
                                              name: item.osName ?? "",
                                              id: item.trackingId ?? "",
                                              index: index + 1,
                                              sumtotal:
                                                  controller.modelList.length,
                                            );
                                          },
                                          childCount:
                                              controller.modelList.length,
                                        ),
                                      );
                                    }
                                    if (state is GetPickupErrorState) {
                                      return SliverToBoxAdapter(
                                        child: SizedBox(
                                          height: 200,
                                          width: 100,
                                          child: Text(
                                            state.error,
                                            style: mainBody.copyWith(
                                                color: AppColor.redColor),
                                          ),
                                        ),
                                      );
                                    }

                                    if (state is GetPickupLoadingState) {
                                      return const SliverToBoxAdapter(
                                        child: SizedBox(
                                          height: 200,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CupertinoActivityIndicator(
                                                    color:
                                                        AppColor.primaryColor),
                                              ]),
                                        ),
                                      );
                                    }
                                    return const SliverToBoxAdapter(
                                        child: SizedBox());
                                  }),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SafeArea(
                      top: false,
                      bottom: false,
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: GetBuilder<PickupController>(builder: (controller) {
              var states = controller.logoutState.value;
              if (states is GEtLogoutLoadingState) {
                return const SizedBox(
                  height: 200,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CupertinoActivityIndicator(
                            color: AppColor.primaryColor),
                      ]),
                );
              }
              if (states is GetLogoutErrorState) {
                return const SizedBox();
              }
              return const SizedBox();
            }),
          )
        ],
      ),
    );
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 300));
    controller.pickupState(GetPickupLoadingState());
    controller.modelList.clear();
    controller.pickupPageNum.value = 1;
    await controller.pickupInitFunctions();
    controller.pickupRefresher.refreshCompleted();
    controller.pickupState(GetPickupSuccessState());
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (controller.canPickupLoadMore.isTrue) {
      controller.pickupPageNum.value++;
      await controller.getPickupList();
    }
    controller.pickupRefresher.loadComplete();
  }

  _footer() {
    return CustomFooter(
        height: 100,
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator(
              color: AppColor.primaryColor,
            );
          } else if (mode == LoadStatus.failed) {
            body = Text('Retry', style: mainBody);
          } else if (mode == LoadStatus.canLoading) {
            body = Container();
          } else if (controller.canPickupLoadMore.isFalse) {
            body = Text('No more data', style: mainBody);
          } else {
            body = Container();
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [body],
          );
        });
  }
}
