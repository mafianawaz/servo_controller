import 'package:get/get.dart';

class UsersLogic extends GetxController{

  final searchQuery = ''.obs;
  var selectedValue = RxnString();

  final allUsers = <Users>[
   Users(name: 'Sarah Khan', email: 'sarah@example.com', role: 'Technician', status: 'Active', lastActive: '2 hours ago'),
   Users(name: 'Imran Patel', email: 'imran@example.com', role: 'Viewer', status: 'Disabled', lastActive: '1 week ago'),
   Users(name: 'Sarah Khan', email: 'sarah@example.com', role: 'Admin', status: 'Active', lastActive: '2 hours ago'),
  ].obs;

  List<Users> get filteredUsers {
    return allUsers.where((t) {
      final matchesSearch = t.name.toLowerCase()
          .contains(searchQuery.value.toLowerCase());

      final selectedCategory = selectedValue.value?.toLowerCase();

      final matchesStatus =
          selectedCategory == null ||
              selectedCategory == "all" ||
              t.role.toLowerCase() == selectedCategory;

      return matchesSearch && matchesStatus;
    }).toList();
  }


  void updateSearch(value) {
    searchQuery.value = value;
  }

  void updateSelectedStatus(String? value) {
    selectedValue.value = value;
  }
}


class Users {
  final String name;
  final String email;
  final String role;
  final String status;
  final String lastActive;



  Users({
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    required this.lastActive,

  });
}