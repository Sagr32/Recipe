import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/util/size_config.dart';

///  Widget that shows
/// loading indicator while loading
class LoadingWidget extends StatelessWidget {
  /// Constructor
  const LoadingWidget({Key? key, required this.height, required this.width})
      : super(key: key);

  /// widget height
  final double height;

  /// widget width
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * width,
      height: SizeConfig.blockSizeVertical * height,
      child: const Center(
        child: SpinKitFadingCube(
          color: kMainColor,
        ),
      ),
    );
  }
}
