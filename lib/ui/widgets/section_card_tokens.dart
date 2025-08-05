import 'package:flutter/material.dart';

import 'package:case_study_movies_project/services/dummy_data.dart';
import 'package:case_study_movies_project/ui/widgets/card_token.dart';
import 'package:case_study_movies_project/utilities/utilities_library_imports.dart';

class SectionCardTokens extends StatelessWidget {
  const SectionCardTokens({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CardToken(
            gradient: AppGradients.tokenGradientBlackRed(context),
            token: dummyTokenList[0],
          ),
        ),
        SizedBox(width: AppConstants.spacings.space16),
        Expanded(
          child: CardToken(
            gradient: AppGradients.tokenGradientPurpleRed(context),
            token: dummyTokenList[1],
          ),
        ),
        SizedBox(width: AppConstants.spacings.space16),
        Expanded(
          child: CardToken(
            gradient: AppGradients.tokenGradientBlackRed(context),
            token: dummyTokenList[2],
          ),
        ),
      ],
    );
  }
}
