import 'package:cbloiro/services/auth_services.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/autenticacao_page.dart';
import 'package:get/get.dart';

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() => AuthService.to.userIsAuthenticated.value
        ? HomePage()
        : AutenticacaoPage());
  }
}
