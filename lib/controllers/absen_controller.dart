import 'package:absensi_getx/models/absen_model.dart';
import 'package:absensi_getx/repo/absen_repo.dart';
import 'package:get/get.dart';

class AbsenController extends GetxController {
  var absensiList = <Absen>[].obs;
  var isLoading = true.obs;

  fecthAbsens() async {
    isLoading(true);
    var absens = await AbsenRepositoryImpl().absenFetchData();
    absensiList.value = absens.absen;
    isLoading(false);
  }

  @override
  void onInit() {
    fecthAbsens();
    super.onInit();
  }
}
