import 'package:einayaaminah/app/core/utilities/Shared/Text%20Components/text.dart';
import 'package:einayaaminah/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:lottie/lottie.dart';
import '../../core/Bloc/authentication_bloc/authentication_bloc.dart';
import '../../core/utilities/Constants/colors.dart';
import '../Main/main_screen.dart';
import 'Widgets/onboarding_widget.dart';

/// This widget provides the onboarding experience for the user.
/// It displays a series of slides and provides an option to sign in with Google.
class OnBording extends StatefulWidget {
  const OnBording({super.key});

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  @override
  Widget build(BuildContext context) {
    // Listens for authentication state changes and navigates to the main screen on success.
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainScreen()),
          );
        }
      },
      child: _buildOnboardingContent(context),
    );
  }

  /// Builds the onboarding slides and controls.
  Widget _buildOnboardingContent(BuildContext context) {
    return Center(
      child: OnBoardingSlider(
        controllerColor: AppColors.lightSecondryColor,
        headerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerBackground: true,
        finishButtonText: S.of(context).signUP,
        finishButtonTextStyle:
            TextStyle(fontSize: AppSizes.buttonTextSize(context)),
        onFinish: () {
          if (kDebugMode) {
            print(
                '************************************************************************************************');
          }
          context.read<AuthenticationBloc>().add(SignInWithGoogleRequested());
        },
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: AppColors.darkBlack,
        ),
        skipTextButton:
            Text(S.of(context).skip, style: Theme.of(context).textTheme.bodyMedium),
        totalPage: 3,
        background: [
          Center(
            child: Image.asset(
              'assets/imgs/woman.png',
              height: MediaQuery.of(context).size.height - 400,
            ),
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset(
                    'assets/animation/scan.json',
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.9,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 140,
                    child: Image(
                      image:
                          const AssetImage("assets/imgs/animation_shampoo.gif"),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
              child: Lottie.asset('assets/animation/phone.json',
                  height: MediaQuery.of(context).size.height * 0.6)),
        ],
        speed: 1.8,
        pageBodies: [
          OnbordingWidget(
            color: Theme.of(context).primaryColor,
            title: S.of(context).onBoardingPage1Headline,
            suptitle: S.of(context).onBoardingPage1Body,
          ),
          OnbordingWidget(
            color: Theme.of(context).primaryColor,
            title: S.of(context).onBoardingPage2Headline,
            suptitle: S.of(context).onBoardingPage2Body,
          ),
          OnbordingWidget(
            color: Theme.of(context).primaryColor,
            title: S.of(context).onBoardingPage3Headline,
            suptitle: S.of(context).onBoardingPage3Body,
          ),
        ],
      ),
    );
  }
}
