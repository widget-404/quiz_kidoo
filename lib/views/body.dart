import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_application_tut_from_scracth/controllers/question_controller.dart';
import 'package:quiz_application_tut_from_scracth/utils/constants.dart';
import 'package:quiz_application_tut_from_scracth/views/progress_bar.dart';
import 'package:quiz_application_tut_from_scracth/views/question_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.find();

    PageController pageController = questionController.pageController;
    return FutureBuilder(
        future: Future.delayed(Duration.zero),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/bg.svg",
            fit: BoxFit.fitWidth,
          ),
          SafeArea(
            child:
          questionController.filteredQuestion.isNotEmpty ?
            Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProgressBar(),
                Obx(
                  () => Text.rich(
                    TextSpan(
                        text:
                            "Question ${questionController.questionNumber.value}",
                        style:
                            Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  color: kScondaryColor,
                                ),
                        children: [
                          TextSpan(
                              text:
                                  "/${questionController.filteredQuestion.length}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    color: kScondaryColor,
                                  ))
                        ]),
                  ),
                ),
                const Divider(
                  thickness: 1.5,
                ),

                Expanded(
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: questionController.updateTheQnNum,
                    itemCount: questionController.filteredQuestion.length,
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return QuestionCard(
                          question: questionController.filteredQuestion[index]);
                    },
                  ),
                )
              ],
            ) : Center(
              child: Text(
                "No Questions Added in This Category",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30
                ),
              )),
          )
        ],
      );}
    else {
      // Placeholder or loading indicator while waiting for Future.delayed
      return CircularProgressIndicator();
    }
        }
    );
  }
}
