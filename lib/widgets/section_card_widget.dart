import 'package:flutter/material.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/pages/section_page.dart';
import 'package:generic_restaurant_app/resources/theme.dart';
import 'package:page_transition/page_transition.dart';

class SectionCardWidget extends StatelessWidget {
  final SectionModel section;
  const SectionCardWidget({
    Key? key,
    required this.section
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double _height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
            child: SectionScreen(section: section),
            type: PageTransitionType.leftToRight,
          )
        );
      },
      child: Padding(
        padding:Design.padding,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Design.circularRadius,
            boxShadow: [
              Design.shadow
            ]
          ),
          child: ClipRRect(
            borderRadius: Design.circularRadius,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: _height/4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    section.cover
                  )
                ),
              ),
              child: BackdropFilter(
                filter: Design.blur,
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: Design.padding,
                  child: Text(
                    section.sectionName,
                    textAlign: TextAlign.center,
                  )
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}