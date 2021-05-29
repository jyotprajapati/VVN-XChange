import 'package:flutter/material.dart';
import 'package:vvn_xchange/theme/ThemeColors.dart';

class WidgetHomeBaseDesign extends StatefulWidget {
  Widget widgetTop, widgetBody;
  EdgeInsetsGeometry marginToBody;
  Gradient gradient;
  WidgetHomeBaseDesign(
      {@required this.widgetBody,
      @required this.widgetTop,
      this.marginToBody,
      this.gradient});
  @override
  _WidgetHomeBaseDesignState createState() => _WidgetHomeBaseDesignState();
}

class _WidgetHomeBaseDesignState extends State<WidgetHomeBaseDesign> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 4),
            decoration: BoxDecoration(
                gradient: widget.gradient != null
                    ? widget.gradient
                    : LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                            ThemeColor.themePrimaryLight2,
                            ThemeColor.themePrimaryLight2,
                            // ThemeColor.themeLight,
                            // ThemeColor.pink,
                          ])),
            child: widget.widgetTop,
          ),
          Container(
              margin: widget.marginToBody == null
                  ? EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 5.5)
                  : widget.marginToBody,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: ThemeColor.themeLight),
              child: widget.widgetBody),
        ],
      ),
    );
  }
}
