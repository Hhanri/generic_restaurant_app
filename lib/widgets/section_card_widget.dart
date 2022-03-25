import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:generic_restaurant_app/models/section_model.dart';
import 'package:generic_restaurant_app/pages/section_page.dart';
import 'package:generic_restaurant_app/providers/providers.dart';
import 'package:generic_restaurant_app/resources/theme.dart';
import 'package:page_transition/page_transition.dart';

class SectionCardWidget extends StatelessWidget {
  final SectionModel section;
  const SectionCardWidget({
    Key? key,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _containerHeight = MediaQuery.of(context).size.height/4;
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final Design design = ref.watch(appSettingsProvider).design;
        final bool hasInternet = ref.watch(connectivityProvider);
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageTransition(
                child: SectionScreen(
                  section: section,
                  //design: design,
                ),
                type: PageTransitionType.leftToRight,
              )
            );
          },
          child: Padding(
            padding: design.padding,
            child: Stack(
              children: [
                hasInternet
                ? FutureBuilder(
                    future: ref.watch(firebaseProvider).downloadURL(section.cover),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data);
                        return SectionCardContainerWidget(
                          parameters: ImageContainerParameters(
                            design: design,
                            imageProvider: CachedNetworkImageProvider(snapshot.data),
                            height: _containerHeight,
                          )
                        );
                      }
                      return SectionCardContainerWidget(
                        parameters: LoadingContainerParameters(
                          design: design,
                          height: _containerHeight,
                        )
                      );
                    },
                  )
                : SectionCardContainerWidget(
                    parameters: ImageContainerParameters(
                    design: design,
                    imageProvider: AssetImage(section.cover),
                    height: _containerHeight,
                    )
                  ),
                SectionCardContainerWidget(
                  parameters: GradientContainerParameters(
                    design: design,
                    height: _containerHeight,
                    child: Text(
                      section.sectionName,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                )
              ],
            )
          ),
        );
      }
    );
  }
}

class SectionCardContainerWidget extends StatelessWidget {
  final SectionCardContainerParameters parameters;
  const SectionCardContainerWidget({
    Key? key,
    required this.parameters
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: parameters.boxDecoration,
      child: parameters.child,
      height: parameters.height,
    );
  }
}

class SectionCardContainerParameters{
  final double height;
  final BoxDecoration boxDecoration;
  final Design design;
  Widget? child;
  ImageProvider? imageProvider;
  SectionCardContainerParameters({
    required this.design,
    required this.height,
    required this.boxDecoration,
    this.child,
    this.imageProvider
  });
}

class ImageContainerParameters extends SectionCardContainerParameters {
  ImageContainerParameters({
    required double height,
    required Design design,
    required ImageProvider imageProvider
  }) : super (
    design: design,
    height: height,
    boxDecoration: BoxDecoration(
      borderRadius: design.circularRadius,
      boxShadow: [design.shadow],
      image: DecorationImage(
        image: imageProvider,
        fit: BoxFit.cover
      )
    ),
  );
}

class LoadingContainerParameters extends SectionCardContainerParameters {
  LoadingContainerParameters({
    required double height,
    required Design design,
  }) : super (
    design: design,
    height: height,
    boxDecoration: BoxDecoration(
      borderRadius: design.circularRadius,
      boxShadow: [design.shadow],
    ),
    child: const Center(child: CircularProgressIndicator.adaptive())
  );
}

class GradientContainerParameters extends SectionCardContainerParameters {
  GradientContainerParameters({
    required double height,
    required Design design,
    required Widget child
  }) : super(
    design: design,
    height: height,
    boxDecoration: BoxDecoration(
      borderRadius: design.circularRadius,
      gradient: design.gradient
    ),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: design.padding,
        child: child,
      ),
    )
  );
}