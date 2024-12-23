import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  // Common settings
  bool isGeneralNotificationEnabled = true;
  bool isSoundEnabled = false;
  bool isVibrateEnabled = true;

  // System & services update settings
  bool isAppUpdatesEnabled = false;
  bool isBillReminderEnabled = true;
  bool isPromotionEnabled = true;
  bool isDiscountAvailableEnabled = false;
  bool isPaymentRequestEnabled = false;

  // Others
  bool isNewServiceAvailableEnabled = false;
  bool isNewTipsAvailableEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Notification Settings"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Common",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            buildToggleTile(
              "General Notification",
              isGeneralNotificationEnabled,
              (value) {
                setState(() {
                  isGeneralNotificationEnabled = value;
                });
              },
            ),
            buildToggleTile(
              "Sound",
              isSoundEnabled,
              (value) {
                setState(() {
                  isSoundEnabled = value;
                });
              },
            ),
            buildToggleTile(
              "Vibrate",
              isVibrateEnabled,
              (value) {
                setState(() {
                  isVibrateEnabled = value;
                });
              },
            ),
            const Divider(height: 30, thickness: 1),
            const Text(
              "System & services update",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            buildToggleTile(
              "App updates",
              isAppUpdatesEnabled,
              (value) {
                setState(() {
                  isAppUpdatesEnabled = value;
                });
              },
            ),
            buildToggleTile(
              "Bill Reminder",
              isBillReminderEnabled,
              (value) {
                setState(() {
                  isBillReminderEnabled = value;
                });
              },
            ),
            buildToggleTile(
              "Promotion",
              isPromotionEnabled,
              (value) {
                setState(() {
                  isPromotionEnabled = value;
                });
              },
            ),
            buildToggleTile(
              "Discount Available",
              isDiscountAvailableEnabled,
              (value) {
                setState(() {
                  isDiscountAvailableEnabled = value;
                });
              },
            ),
            buildToggleTile(
              "Payment Request",
              isPaymentRequestEnabled,
              (value) {
                setState(() {
                  isPaymentRequestEnabled = value;
                });
              },
            ),
            const Divider(height: 30, thickness: 1),
            const Text(
              "Others",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            buildToggleTile(
              "New Service Available",
              isNewServiceAvailableEnabled,
              (value) {
                setState(() {
                  isNewServiceAvailableEnabled = value;
                });
              },
            ),
            buildToggleTile(
              "New Tips Available",
              isNewTipsAvailableEnabled,
              (value) {
                setState(() {
                  isNewTipsAvailableEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildToggleTile(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
          GFToggle(
            onChanged: (val) {},
            value: true,
            enabledThumbColor: Colors.white,
            type: GFToggleType.ios,
            enabledTrackColor: AppColors.secondaryColor,
          )
        ],
      ),
    );
  }
}
