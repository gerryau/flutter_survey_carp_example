import 'package:research_package/research_package.dart';

RPInstructionStep instructionStep = RPInstructionStep(
  identifier: "instructionID",
  title: "Instructions",
  footnote: "(1) Important footnote",
  // imagePath: "assets/images/waving-hand.png",
  text:
      "Please indicate for each of the five statements which is closest to how you have been feeling over the last two weeks. Notice that higher numbers mean better well-being.",
);

// Slider
RPSliderAnswerFormat sliderAnswerFormat = RPSliderAnswerFormat(
  minValue: 1,
  maxValue: 10,
  divisions: 9,
  // prefix: "\$",
  // suffix: " paid",
);

// Slider
RPQuestionStep sliderQuestionStep = RPQuestionStep(
  identifier: "sliderQuestionsStepID",
  title: "How are you feeling today?",
  answerFormat: sliderAnswerFormat,
  // optional: true,
);

RPCompletionStep completionStep = RPCompletionStep(
    identifier: "completionID",
    title: "Finished",
    text: "Thank you for filling out the survey!");

RPTextAnswerFormat textAnswerFormat =
    RPTextAnswerFormat(hintText: "Write your answer here");

/*How can we support you in feeling more satisfied with your career at Planit?*/
RPQuestionStep additionalInfoQuestionStep = RPQuestionStep(
  identifier: 'additionalInfoQuestionStepID',
  title:
      'How can we support you in feeling more satisfied with your career at Planit?',
  answerFormat: textAnswerFormat,
);

RPOrderedTask linearSurveyTask = RPOrderedTask(
  identifier: "surveyTaskID",
  steps: [
    // instructionStep,
    sliderQuestionStep,
    additionalInfoQuestionStep,
    completionStep,
  ],
);
