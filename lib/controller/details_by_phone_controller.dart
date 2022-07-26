import 'package:cellsandcell/model/details_by_phone_model.dart';
import 'package:cellsandcell/service/APIService.dart';
import 'package:get/get.dart';

class DetailsByPhoneController extends GetxController {
  GetDetailsByPhoneModel? getDetailsByPhoneModel;
  var searchResult = <GetDetailsByPhoneModel>[].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  var searchKey = "".obs;
  void hitSearch(val) {
    searchKey.value = val;
    debounce(searchKey, (_) => getData(phone: val),
        time: const Duration(milliseconds: 800));
  }

  void getData({phone = ""}) async {
    print('phone.......................');
    print(phone);
    getDetailsByPhoneModel = await APIService().getDetails(phone);
    if (getDetailsByPhoneModel != null) {
      searchResult.value =
          getDetailsByPhoneModel?.data as List<GetDetailsByPhoneModel>;
      print('update');
      update();
    }
  }
}
