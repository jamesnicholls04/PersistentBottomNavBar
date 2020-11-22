part of persistent_bottom_nav_bar;

class BottomNavStyle4 extends StatelessWidget {
  final int selectedIndex;
  final int previousIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;
  final double navBarHeight;
  final NavBarPadding padding;
  final Function(int) popAllScreensForTheSelectedTab;
  final bool popScreensOnTapOfSelectedTab;
  final ItemAnimationProperties itemAnimationProperties;
  final Widget trailingWidget;

  const BottomNavStyle4(
      {Key key,
      this.selectedIndex,
      this.previousIndex,
      this.showElevation = false,
      this.iconSize,
      this.backgroundColor,
      this.popScreensOnTapOfSelectedTab,
      this.itemAnimationProperties,
      this.navBarHeight = 0.0,
      @required this.items,
      this.onItemSelected,
      this.popAllScreensForTheSelectedTab,
      this.padding,
      this.trailingWidget});

  Widget _buildItem(
      PersistentBottomNavBarItem item, bool isSelected, double height) {
    return this.navBarHeight == 0
        ? SizedBox.shrink()
        : AnimatedContainer(
            width: 80.0,
            height: height,
            duration: itemAnimationProperties?.duration ??
                Duration(milliseconds: 1000),
            curve: itemAnimationProperties?.curve ?? Curves.ease,
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: itemAnimationProperties?.duration ??
                  Duration(milliseconds: 1000),
              curve: itemAnimationProperties?.curve ?? Curves.ease,
              height: height / 1.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: IconTheme(
                      data: IconThemeData(
                          size: iconSize,
                          color: isSelected
                              ? (item.activeContentColor == null
                                  ? item.activeColor
                                  : item.activeContentColor)
                              : item.inactiveColor == null
                                  ? item.activeColor
                                  : item.inactiveColor),
                      child: item.icon,
                    ),
                  ),
                  item.title == null
                      ? SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Material(
                            type: MaterialType.transparency,
                            child: DefaultTextStyle.merge(
                              style: item.titleStyle != null
                                  ? (item.titleStyle.apply(
                                      color: isSelected
                                          ? (item.activeContentColor == null
                                              ? item.activeColor
                                              : item.activeContentColor)
                                          : item.inactiveColor))
                                  : TextStyle(
                                      color: isSelected
                                          ? (item.activeContentColor == null
                                              ? item.activeColor
                                              : item.activeContentColor)
                                          : item.inactiveColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: item.titleFontSize),
                              child: FittedBox(
                                  child: Text(isSelected ? item.title : " ")),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = 80;

    return Container(
      width: double.infinity,
      height: this.navBarHeight,
      padding: EdgeInsets.only(
          top: this.padding?.top ?? 0.0,
          left: this.padding?.left ?? MediaQuery.of(context).size.width * 0.05,
          right:
              this.padding?.right ?? MediaQuery.of(context).size.width * 0.05,
          bottom: this.padding?.bottom ?? this.navBarHeight * 0.1),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: itemAnimationProperties?.duration ??
                          Duration(milliseconds: 300),
                      curve: itemAnimationProperties?.curve ?? Curves.ease,
                      color: Colors.transparent,
                      width: (selectedIndex == 0
                          ? MediaQuery.of(context).size.width * 0.0
                          : itemWidth * selectedIndex),
                      height: 4.0,
                    ),
                    Flexible(
                      child: AnimatedContainer(
                        duration: itemAnimationProperties?.duration ??
                            Duration(milliseconds: 300),
                        curve: itemAnimationProperties?.curve ?? Curves.ease,
                        width: itemWidth,
                        height: 4.0,
                        alignment: Alignment.center,
                        child: Container(
                          height: 5.0,
                          // TODO: James here, forced width
                          width: 23,
                          decoration: BoxDecoration(
                            //TODO: James altered colour
                            color: Color.fromRGBO(0, 255, 0, 1),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: items.map((item) {
                        var index = items.indexOf(item);
                        return Flexible(
                          child: GestureDetector(
                            onTap: () {
                              if (this.items[index].onPressed != null) {
                                this.items[index].onPressed();
                              } else {
                                if (this.popScreensOnTapOfSelectedTab &&
                                    this.previousIndex == index) {
                                  this.popAllScreensForTheSelectedTab(index);
                                }
                                this.onItemSelected(index);
                              }
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: _buildItem(item, selectedIndex == index,
                                  this.navBarHeight),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          trailingWidget ?? Container()
        ],
      ),
    );
  }
}
