import 'dart:developer';
import 'package:apc_pro/view/screens/survey/career_stage.dart';
import 'package:apc_pro/view/screens/survey/competency.dart';
import 'package:apc_pro/view/screens/survey/cpd_studyPref.dart';
import 'package:apc_pro/view/screens/survey/goals_expectations.dart';
import 'package:apc_pro/view/screens/survey/pathway_location.dart';
import 'package:apc_pro/view/screens/survey/review_profile.dart';
import 'package:apc_pro/view/screens/survey/training_experience.dart';
import 'package:get/get.dart';
import 'package:apc_pro/view/screens/survey/about_you.dart';

class SurveyController extends GetxController {
  var currentStep = 0.obs;

  // Data for each step
  final stepsData = [
    {
      'title': 'Tell us about you',
      'Desc': 'Let’s get to know you better to personalise your APC journey',
      'progress_ind': 1.0,
      'body': AboutYou()
    },
    {
      'title': 'Career Stage',
      'Desc': 'Select your current career stage to customize your experience',
      'progress_ind':2.0,
      'body': CareerStage()
    },
    {
      'title': 'Pathway & Location',
      'Desc':
          'Tell us where you are in your career journey so we can tailor your experience.',
      'progress_ind': 3.0,
      'body': PathwayLocation()
    },
    {
      'title': 'Competency Selection',
      'Desc':
          'Based on your selected RICS pathway, below are the technical competencies applicable to you.',
      'progress_ind': 4.0,
      'body': Competency()
    },
    {
      'title': 'Training & Experience',
      'Desc': "Let's gather some information about your training and experience",
      'progress_ind': 5.0,
      'body': TrainingExperience()
    },
    {
      'title': 'CPD & Study Preferences',
      'Desc':
          'Let’s tailor your app experience based on your current CPD progress and how you prefer to study.',
      'progress_ind': 6.0,
      'body': CpdStudypref()
    },
    {
      'title': 'Goals & Expectations',
      'Desc':
          'Define your professional objectives and the type of support you need from APC Pro.',
      'progress_ind': 7.0,
      'body': GoalsExpectations()
    },
    {
      'title': 'Review Your Profile',
      'Desc':
          'Check your details and make sure everything is correct before you continue.',
      'progress_ind': 8.0,
      'body': ReviewProfile()
    },
  ];

  void nextStep() {
    if (currentStep.value < stepsData.length - 1) {
      currentStep.value++;
    } else {
      log("✅ Survey Completed");
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }
}
