import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HorizontalEventCard extends StatelessWidget {
  const HorizontalEventCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: screenHeight * 0.25, //card height
        // height: 225, //card height
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 25), //padding between cards
              child: CustomRoundedContainer(
                width: screenWidth * 0.65, //card width
                backgroundColor: AppColors.white,
                radius: 12,
                borderColor: AppColors.containerBorderColor,
                showBorder: true,
                //image and texts
                child: Column(
                  children: [
                    //image
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * 0.12,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/card1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: CustomRoundedContainer(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 1),
                                backgroundColor: AppColors.white,
                                radius: 25,
                                child: Text(
                                  'New',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.poppins,
                                    fontSize: 10,
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //after image texts
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomRoundedContainer(
                            height: screenHeight * 0.022,
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 5),
                            backgroundColor:
                                AppColors.primaryColor.withOpacity(0.1),
                            radius: 25,
                            child: Text(
                              'Soccer',
                              style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color:
                                    AppColors.secondaryColor.withOpacity(0.8),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            'Reflexes Training',
                            style: TextStyle(
                                fontFamily: AppFontsFamily.poppins,
                                fontSize: AppFontSizes.body,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black,
                                letterSpacing: 0.5),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.secondaryColor,
                                size: AppFontSizes.body,
                              ),
                              SizedBox(width: screenWidth * 0.010),
                              Text(
                                'Florida, USA',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.poppins,
                                  fontSize: AppFontSizes.small,
                                  color: AppColors.IconColors,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.030),
                              Icon(
                                Iconsax.calendar,
                                color: AppColors.secondaryColor,
                                size: AppFontSizes.small,
                              ),
                              SizedBox(width: screenWidth * 0.010),
                              Text(
                                '25 Dec, 24',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.poppins,
                                  fontSize: AppFontSizes.small,
                                  color: AppColors.IconColors,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '€20',
                                style: TextStyle(
                                  fontFamily: AppFontsFamily.poppins,
                                  fontSize: AppFontSizes.body,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
