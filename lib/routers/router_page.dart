import 'dart:core';

import 'package:derma_skin_app/Pages/Account.dart';
import 'package:derma_skin_app/Pages/Get_Started_page.dart';
import 'package:derma_skin_app/Pages/My_Plan.dart';
import 'package:derma_skin_app/Pages/My_Profile.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_result_page.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_start.dart';
import 'package:derma_skin_app/Pages/Set_Remider.dart';
import 'package:derma_skin_app/Pages/TakePhotos.dart';
import 'package:derma_skin_app/Pages/UV_index.dart';
import 'package:derma_skin_app/Pages/add_spot_page.dart';
import 'package:derma_skin_app/Pages/body_page.dart';
import 'package:derma_skin_app/Pages/food_page.dart';
import 'package:derma_skin_app/Pages/intro_page.dart';
import 'package:derma_skin_app/Pages/login.dart';
import 'package:derma_skin_app/Pages/message.dart';
import 'package:derma_skin_app/Pages/second_spot_page.dart';
import 'package:derma_skin_app/Pages/signup_page.dart';
import 'package:derma_skin_app/Pages/skin_model.dart';
import 'package:derma_skin_app/Pages/skin_type/fair_skin_result_page.dart';
import 'package:derma_skin_app/Pages/skin_type/skin_type_start_page.dart';
import 'package:derma_skin_app/Pages/third_spot_page.dart';
import 'package:derma_skin_app/Widgets/Navbar.dart';
import 'package:derma_skin_app/help_supprot_pages/app_instruction_page.dart';
import 'package:derma_skin_app/help_supprot_pages/cancer_information_page.dart';
import 'package:derma_skin_app/help_supprot_pages/change_password_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterPage {
  static final router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    debugLogDiagnostics: true,
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return const MaterialPage<dynamic>(
        child: Scaffold(
          body: Center(
            child: Text("this page is not found!!"),
          ),
        ),
      );
    },
    routes: [
      GoRoute(
        //started page
        name: "home",
        path: "/",
        builder: (context, state) {
          return const GetStarted();
        },
      ),

      // intropage
      GoRoute(
        name: "intro",
        path: "/intro",
        builder: (context, state) {
          return const IntroPage();
        },
      ),

      // login page
      GoRoute(
        name: "login",
        path: "/login",
        builder: (context, state) {
          return const Login();
        },
      ),

      // signup page

      GoRoute(
        name: "signup",
        path: "/signup",
        builder: (context, state) {
          return const SignUp();
        },
      ),

      // navbar
      GoRoute(
        path: '/navbar',
        builder: (context, state) {
          return const Navbar();
        },
        routes: [
          GoRoute(
            path: 'mybody',
            builder: (context, state) {
              return const BodyPage();
            },
          ),
          GoRoute(
            path: 'message',
            builder: (context, state) {
              return const Message();
            },
          ),
          GoRoute(
            path: 'take-photo',
            builder: (context, state) {
              return const TakePhotos();
            },
          ),
          GoRoute(
            path: 'uv-index',
            builder: (context, state) {
              return const UVIndex();
            },
          ),
          GoRoute(
            path: 'account',
            builder: (context, state) {
              return const Account();
            },
          ),
        ],
      ),

      // // mybody
      GoRoute(
        name: "body-page",
        path: "/body-page",
        builder: (context, state) {
          return const BodyPage();
        },
      ),

      // // message
      // GoRoute(
      //   name: "message",
      //   path: "/message",
      //   builder: (context, state) {
      //     return const Message();
      //   },
      // ),

      // // uv index
      // GoRoute(
      //   name: "uv-index",
      //   path: "/uv-index",
      //   builder: (context, state) {
      //     return const UVIndex();
      //   },
      // ),

      // // take photos
      GoRoute(
        name: "take-photo",
        path: "/take-photo",
        builder: (context, state) {
          return const TakePhotos();
        },
      ),

//add spot page
      GoRoute(
        name: "add-spot-page",
        path: "/add-spot-page",
        builder: (context, state) {
          final int index = state.extra as int;
          return AddSpotPage(index: index);
        },
      ),

      //second spot page
      GoRoute(
        name: "second-spot-page",
        path: "/second-spot-page",
        builder: (context, state) {
          final int index = state.extra as int;
          return SecondSpotPage(index: index);
        },
      ),

      // third spot page
      GoRoute(
        name: "third-spot-page",
        path: "/third-spot-page",
        builder: (context, state) {
          final int index = state.extra as int;
          return ThirdSpotPage(index: index);
        },
      ),

      GoRoute(
        name: "food-page",
        path: "/food-page",
        builder: (context, state) {
          final title =
              (state.extra as Map<String, dynamic>)["title"] as String;
          final description =
              (state.extra as Map<String, dynamic>)["description"] as String;
          final foodToEat =
              (state.extra as Map<String, dynamic>)["foodToEat"] as String;
          final foodToAvoid =
              (state.extra as Map<String, dynamic>)["foodToAvoid"] as String;

          return FoodPage(
            title: title,
            description: description,
            foodToEat: foodToEat,
            foodToAvoid: foodToAvoid,
          );
        },
      ),

      // GoRoute(
      //   name: "skin-model",
      //   path: "/",
      //   builder: (context, state) {
      //     return SkinModel();
      //   },
      // ),

      // // account

      // GoRoute(
      //   name: "account",
      //   path: "/account",
      //   builder: (context, state) {
      //     return const Account();
      //   },
      // ),

      // body page
      // GoRoute(
      //   name: "body-page",
      //   path: "/body",
      //   builder: (context, state) {
      //     return const BodyPage();
      //   },
      // ),

      // startskintype
      GoRoute(
        name: "start_skin_type",
        path: "/start_skin_type",
        builder: (context, state) {
          return const StartSkinType();
        },
      ),

      // skin result
      GoRoute(
        name: "skin-result",
        path: "/skin-result",
        builder: (context, state) {
          // final String title = state.extra as String;
          final title =
              (state.extra as Map<String, dynamic>)["title"] as String;
          // final String description = state.extra as String;
          final description =
              (state.extra as Map<String, dynamic>)["description"] as String;
          return FairSkinResultPage(
            title: title,
            description: description,
          );
        },
      ),

      // start risk profile page
      GoRoute(
        name: "start_risk-profile",
        path: "/start_risk-profile",
        builder: (context, state) {
          return const StartRiskProfile();
        },
      ),

      // risk result page
      GoRoute(
        name: "risk-result",
        path: "/risk-result",
        builder: (context, state) {
          final title =
              (state.extra as Map<String, dynamic>)["title"] as String;
          final description1 =
              (state.extra as Map<String, dynamic>)["description1"] as String;
          final description2 =
              (state.extra as Map<String, dynamic>)["description2"] as String;
          final description3 =
              (state.extra as Map<String, dynamic>)["description3"] as String;
          final description4 =
              (state.extra as Map<String, dynamic>)["description4"] as String;
          return RiskResultPage(
            title: title,
            description1: description1,
            description2: description2,
            description3: description3,
            description4: description4,
          );
        },
      ),

      // skin model
      GoRoute(
        name: "skin-model",
        path: "/skin-model",
        builder: (context, state) {
          return SkinModel();
        },
      ),

      // myplan
      GoRoute(
        name: "myplan",
        path: "/myplan",
        builder: (context, state) {
          return const MyPlan();
        },
      ),

      // my profile
      GoRoute(
        name: "myprofile",
        path: "/myprofile",
        builder: (context, state) {
          return const MyProfile();
        },
      ),

      // reminder $ notification
      GoRoute(
        name: "reminder",
        path: "/reminder",
        builder: (context, state) {
          return const SetReminder();
        },
      ),

      // change password

      GoRoute(
        name: "change-password",
        path: "/change-password",
        builder: (context, state) {
          return const ChangePasswordPage();
        },
      ),

      // cancer infro page

      GoRoute(
        name: "cancer-info",
        path: "/cancer-info",
        builder: (context, state) {
          return const CancerInformationPage();
        },
      ),

      // instruction to use

      GoRoute(
        name: "use-info",
        path: "/use-info",
        builder: (context, state) {
          return const InstructionsPage();
        },
      ),
    ],
  );
}
