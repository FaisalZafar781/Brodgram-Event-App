import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../Providers/SplashProvider.dart';
import 'package:brogam/generated/assets.dart';
import '../../../../services/constants/constants.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    Provider.of<SplashScreenProvider>(context, listen: false)
        .navigateToNextScreen(context);
    final double topPadding = screenHeight * 0.275;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Center(
              child: Image.asset(Assets.imagesLogo),
            ),
          ),
          SizedBox(height: screenHeight * 0.09),
          Padding(
            padding:  EdgeInsets.only(top:screenHeight * 0.09 ),
            child: SpinKitChasingDots(
              color: AppColors.secondaryColor,
              size: 30.0,
            ),
          ),

        ],
      ),
    );
  }
}
