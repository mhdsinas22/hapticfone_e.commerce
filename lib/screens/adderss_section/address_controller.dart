import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/controllers/dropdowncontroller.dart';
import 'package:hapticfone/controllers/radiocontroller.dart';
import 'package:hapticfone/repository/address_repository.dart';
import 'package:hapticfone/models/addressmodels.dart';
import 'package:random_string/random_string.dart';

class Addresscontroller extends GetxController {
  static Addresscontroller get instance => Get.find();
  @override
  void onInit() {
    print("ONI EORINWNKsf");
    loaduseraddress();
    super.onInit();
  }

  final addrestexteditingcontroller = TextEditingController();
  final pincodetexteditingcontroller = TextEditingController();
  final fullnamecontroller = TextEditingController();
  final phonetexteditcontroller = TextEditingController();
  final citycontrooller = TextEditingController();
  final landmarkcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final dropdowncontroller = Get.put(Dropdowncontroller());
  final addressrepository = Get.put(AddressRepository());
  Rx<Addressmodels> selectedaddress = Addressmodels.empty().obs;
  RxBool refreshdata = true.obs;
  RxList<Addressmodels> addresslist = <Addressmodels>[].obs;
  final radiocontroller = Get.put(Radiocontroller());
  Future<List<Addressmodels>> getalluseraddress() async {
    print(" Get allWorking");
    final address = await addressrepository.fetchuseraddress();
    selectedaddress.value = address.firstWhere(
      (elemt) => elemt.selectedaddress,
      orElse: () => Addressmodels.empty(),
    );

    print("adddresss:$address");
    return address;
  }

  Future<void> loaduseraddress() async {
    final result = await getalluseraddress();
    addresslist.value = result;
  }

  Future<void> deleteaddress(Addressmodels address) async {
    await addressrepository.deleteaddress(address);
    await loaduseraddress();
  }

  Future<void> selectAddress(Addressmodels newSelectedAddress) async {
    try {
      //  First clear previous selected
      if (selectedaddress.value.id.isNotEmpty) {
        await addressrepository.updateSelectedfield(
          selectedaddress.value.id,
          false,
        );
      }

      //  Then assign and mark new one
      newSelectedAddress.selectedaddress = true;
      selectedaddress.value = newSelectedAddress;

      await addressrepository.updateSelectedfield(newSelectedAddress.id, true);

      // Refresh list so UI updates
      await loaduseraddress();
    } catch (e) {
      print("error$e");
    }
  }

  Future addaddresstofirebase() async {
    final randomstrings = randomAlphaNumeric(10);
    // final datatime = DateTime.now();
    // save address to firebase
    if (formkey.currentState!.validate()) {
      try {
        final address = Addressmodels(
          saveas: radiocontroller.selectedvalue.value,
          selectedaddress: true,
          id: randomstrings,
          pincode: int.parse(pincodetexteditingcontroller.text),
          fullname: fullnamecontroller.text.trim(),
          phonenumber: int.parse(phonetexteditcontroller.text.trim()),
          addresss: addrestexteditingcontroller.text.trim(),
          landmark: landmarkcontroller.text.trim(),
          city: citycontrooller.text.trim(),
          state: dropdowncontroller.selectedvalue.value.trim(),
          datetime: DateTime.now(),
        );

        cleantextformfield();
        await addressrepository.addaddress(address, randomstrings);
        // // update   Selected  Address status
        await loaduseraddress();
        await selectAddress(address);
        Get.back();
      } catch (e) {
        Get.snackbar("ERROR", e.toString());
        throw "ERRORRORORO:$e";
      }
    }
  }

  void cleantextformfield() {
    addrestexteditingcontroller.clear();
    pincodetexteditingcontroller.clear();
    fullnamecontroller.clear();
    phonetexteditcontroller.clear();
    citycontrooller.clear();
    landmarkcontroller.clear();
  }

  Future<void> edittheaddress(String addressid) async {
    final address = Addressmodels(
      id: addressid,
      pincode: int.parse(pincodetexteditingcontroller.text),
      fullname: fullnamecontroller.text,
      phonenumber: int.parse(phonetexteditcontroller.text),
      addresss: addrestexteditingcontroller.text,
      landmark: landmarkcontroller.text,
      city: citycontrooller.text,
      state: dropdowncontroller.selectedvalue.value,
      datetime: DateTime.now(),
      saveas: radiocontroller.selectedvalue.value,
    );
    await addressrepository.edittheaddresssrepo(addressid, address);
    final result = await getalluseraddress();
    addresslist.assignAll(result);
    addresslist.refresh();
    Get.back();
  }
}
