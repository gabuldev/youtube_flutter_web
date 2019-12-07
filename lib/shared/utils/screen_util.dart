enum ScreenType { mobile, tablet, tabletExpanded, windowShort, windowExpanded }

class Screen {
  static ScreenType getTypeByWidth(double width) {
    if (width <= 510) {
      return ScreenType.mobile;
    } else if (width > 510.0 && width <= 675.0) {
      return ScreenType.tablet;
    } else if (width > 675.0 && width <= 865.0) {
      return ScreenType.tabletExpanded;
    } else if (width > 865.0 && width <= 1110.0) {
      return ScreenType.windowShort;
    } else {
      return ScreenType.windowExpanded;
    }
  }
}
