import 'package:brogam/screens/Organizer/OrganizerEventsScreen/TicketScreen/TicketScreen.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundContainer/custom_round_container.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:flutter/material.dart';

class ParticipantsTile extends StatelessWidget {
  final int length;

  const ParticipantsTile({
    super.key,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: ListView.builder(
        itemCount: length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 20),
            child: CustomRoundedContainer(
              padding: const EdgeInsets.fromLTRB(12, 8, 8, 5),
              borderColor: Colors.grey[100],
              showBorder: true,
              width: double.infinity,
              height: screenHeight * 0.08,
              radius: 12,
              backgroundColor: AppColors.white,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('assets/images/ProfileImage.png'),
                  ),
                  SizedBox(width: screenHeight * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Sofia Carter', // Dynamic participant label
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: AppFontSizes.subtitle1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Paid: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: AppFontSizes.body1,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: '\$ 40', // Dynamic amount
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: AppFontSizes.body,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Bought 2 Tickets', // Dynamic ticket count
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: AppFontSizes.small,
                        ),
                      ),
                      ActionButton(
                        buttonWidth: screenWidth * 0.30,
                        buttonHeight: screenHeight * 0.04,
                        borderRadius: 25,
                        text: 'View Ticket',
                        fontSize: AppFontSizes.small,
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                        borderColor: AppColors.primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TicketScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
