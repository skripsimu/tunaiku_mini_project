import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'initial.dart';

class WaveView {
  body(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: RotatedBox(
        quarterTurns: 2,
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [colorLib.greenShade, colorLib.green],
              [colorLib.greenHc, colorLib.greenShade]
            ],
            durations: [19440, 10800],
            heightPercentages: [0.20, 0.25],
            blur: MaskFilter.blur(BlurStyle.solid, 10),
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
          ),
          waveAmplitude: 0,
          size: Size(double.infinity, double.infinity),
        ),
      ),
    );
  }

  waveDown(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: RotatedBox(
        quarterTurns: 4,
        child: WaveWidget(
          config: CustomConfig(
            gradients: [
              [colorLib.greenShade, colorLib.green],
              [colorLib.greenHc, colorLib.greenShade]
            ],
            durations: [19440, 10800],
            heightPercentages: [0.15, 0.2],
            blur: MaskFilter.blur(BlurStyle.solid, 10),
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
          ),
          waveAmplitude: 0,
          size: Size(double.infinity, double.infinity),
        ),
      ),
    );
  }
}
