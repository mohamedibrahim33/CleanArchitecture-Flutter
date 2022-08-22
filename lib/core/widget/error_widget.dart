// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:quotes/config/locale/app_localizations.dart';

import 'package:quotes/core/utils/app_colors.dart';

class ConstErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  final String msg;
  const ConstErrorWidget({
    Key? key,
    this.onPress,
    required this.msg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primary,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            AppLocalizations.of(context)!.translate('something_went_wrong')!,
            style: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.symmetric(vertical: 12),
        //   child: Text(
        //     msg,
        //     style: const TextStyle(
        //         color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        //   ),
        // ),
        Text(
          AppLocalizations.of(context)!.translate('try_again')!,
          style: TextStyle(
              color: AppColors.hint, fontSize: 18, fontWeight: FontWeight.w300),
        ),
        Container(
          height: 55,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(200, 55),
              primary: AppColors.primary,
              elevation: 500,
              onPrimary: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
            ),
            child: Text(
              AppLocalizations.of(context)!.translate('reload_screen')!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
