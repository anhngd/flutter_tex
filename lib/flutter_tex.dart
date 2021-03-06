library flutter_tex;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'mobile_tex_view.dart' if (dart.library.html) 'web_tex_view.dart'
    as multiPlatformTeXView;

///A Flutter Widget to render Mathematics / Maths, Physics and Chemistry, Statistics / Stats Equations based on LaTeX with full HTML and JavaScript support.
///
///
class TeXView extends StatelessWidget {
  final Key key;

  ///Raw String containing HTML and TEX Code e.g. String textHTML = r"""$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}.$$<br> """
  @required
  final String teXHTML;

  /// Render Engine to render TeX.
  final RenderingEngine renderingEngine;

  /// Fixed Height for TeXView. (Avoid using fixed height for TeXView, let it to adopt the height by itself)
  final double height;

  /// Show a loading widget before rendering completes.
  final Widget loadingWidget;

  /// Callback when TEX rendering finishes.
  final Function(double height) onRenderFinished;

  /// Callback when TeXView loading finishes.
  final Function(String message) onPageFinished;

  /// Keep widget Alive. (True by default).
  final bool keepAlive;

  TeXView(
      {this.key,
      this.teXHTML,
      this.renderingEngine,
      this.height,
      this.loadingWidget,
      this.keepAlive,
      this.onRenderFinished,
      this.onPageFinished});

  @override
  Widget build(BuildContext context) {
    return multiPlatformTeXView.TeXView(
        height: this.height,
        loadingWidget: this.loadingWidget,
        keepAlive: this.keepAlive,
        key: this.key,
        onPageFinished: this.onPageFinished,
        onRenderFinished: this.onRenderFinished,
        teXHTML: this.teXHTML,
        renderingEngine: this.renderingEngine);
  }
}

/// TeX Rendering Engine
enum RenderingEngine { MathJax, Katex }
