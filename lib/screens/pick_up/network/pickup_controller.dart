import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:innovation/cache/app_storage.dart';
import 'package:innovation/routes/route_helper.dart';
import 'package:innovation/screens/pick_up/model/pickup_model.dart';
import 'package:innovation/screens/pick_up/network/pickup_repo.dart';
import 'package:pull_to_refresh_plus/pull_to_refresh_plus.dart';

class PickupController extends GetxController {
  final PickupRepo repo;

  PickupController(this.repo);

  Future<void> pickupInitFunctions() async {
    await Future.wait([
      getPickupList(isFirstLoad: true),
    ]);
  }

  RxInt pickupPageNum = 1.obs;
  RefreshController pickupRefresher = RefreshController();
  Rx<GetPickupState> pickupState = GetPickupState().obs;
  RxList<PickupItem> modelList = List<PickupItem>.empty().obs;
  RxBool canPickupLoadMore = false.obs;

  Future<void> getPickupList({bool? isFirstLoad}) async {
    if (isFirstLoad ?? false) {
      pickupState(GetPickupLoadingState());
      update();
    }

    try {
      await repo.getPickupList(body: {
        "first": pickupPageNum.value,
        "max": 10,
      }).then((response) {
        if (response.statusCode == 200 && response.body["success"] == true) {
          final model = PickupModelData.from(response.body);
          modelList.addAll(model.data?.item as Iterable<PickupItem>);
          if (model.data?.totalRecords == model.data?.item?.length) {
            canPickupLoadMore.value = true;
          } else {
            canPickupLoadMore.value = true;
          }
          if (isFirstLoad ?? false) {
            pickupState(GetPickupSuccessState());
            update();
          }
        } else {
          pickupState(GetPickupErrorState(response.bodyString ?? ""));
        }
      });
    } catch (e) {
      debugPrint(" Get Pickup failed - $e");
      pickupState(
          GetPickupErrorState("Something was wrong in getting pickupList."));
    }
    update();
  }

  Rx<GetLogoutState> logoutState = GetLogoutState().obs;
  Future<void> logout() async {
    logoutState(GetLogoutState());

    try {
      await repo.lgout(body: {}).then((response) {
        if (response.statusCode == 200 && response.body["success"] == true) {
          AppStorage().clearPreferencesData();
          Get.offAllNamed(
            RouteHelper.login,
          );
        } else {
          logoutState(GetLogoutErrorState(response.bodyString ?? ""));
        }
      });
      update();
    } catch (e) {
      debugPrint(" Get Pickup failed - $e");
      logoutState(
          GetLogoutErrorState("Something was wrong in getting pickupList."));
    }
    update();
  }
}

class GetPickupState {}

class GetPickupSuccessState extends GetPickupState {}

class GetPickupLoadingState extends GetPickupState {}

class GetPickupErrorState extends GetPickupState {
  final String error;

  GetPickupErrorState(this.error);
}

class GetLogoutState {}

class GEtLogoutLoadingState extends GetLogoutState {}

class GEtLogoutSuccessState extends GetLogoutState {}

class GetLogoutErrorState extends GetLogoutState {
  final String error;

  GetLogoutErrorState(this.error);
}
