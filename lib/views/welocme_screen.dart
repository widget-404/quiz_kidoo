import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_application_tut_from_scracth/utils/constants.dart';
import 'package:quiz_application_tut_from_scracth/views/admin/admin_dashboard.dart';
import 'package:quiz_application_tut_from_scracth/views/quiz_category.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:quiz_application_tut_from_scracth/controllers/question_controller.dart';


import 'admin/admin_login.dart';

class WelcomeScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final QuestionController _questionController = Get.put(QuestionController());


  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          "Quiz Kidoo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white
          ),
        ),
          centerTitle: true,
          gradient: LinearGradient(
            colors: [Color(0xffb40707), Color(0xFFF56363)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment : MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: (){
                  Get.to(()=> AdminLoginScreen());
                },
                child: Text("Admin/Parent",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white
                ),)),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [

          SvgPicture.asset(
            "assets/bg.svg",
            fit: BoxFit.fitWidth,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Let's Play Quiz",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  const Text("Check your IQ with Quiz Kidoo"),
                  const Spacer(), // /1/6
                  TextField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Enter your Full Name kidoo",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _questionController.savedCategories.isNotEmpty ?
                      Get.to(
                        QuizCategoryScreen(),
                      ): Get.snackbar("No Question Added", "Please Ask Parent to Add",backgroundColor: Colors.transparent,colorText: Colors.red,snackPosition: SnackPosition.BOTTOM);

                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Let's Start Quiz",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),

                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
