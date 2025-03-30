import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tampilan_depan_controller.dart'; 
import 'routes/app_routes.dart'; 

class TampilanDepanScreen extends GetWidget<TampilanDepanController> {
  const TampilanDepanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF083791),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Padding(
                padding: EdgeInsets.zero,
                child: Image.asset(
                  "assets/images/img_rpl_1.png",
                  height: 314,
                  width: double.maxFinite,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.maxFinite,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 46),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Color(0XFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    visualDensity: const VisualDensity(
                      vertical: -4,
                      horizontal: -4,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.homeScreen); 
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Color(0XFF083791),
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
