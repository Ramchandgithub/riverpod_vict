
import 'package:flutter/material.dart';


class TopRoundNavigationBar extends StatelessWidget {
  final List<TopRoundedNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;
  final Color selectedColor;
  final Color unselectedColor;

  const TopRoundNavigationBar({super.key, required this.items, this.onTap, this.currentIndex = 0, this.selectedColor = Colors.blue, this.unselectedColor = Colors.grey});


  @override
  Widget build(BuildContext context) {
    return Container(
      height:  kToolbarHeight,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10)
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            items.length, (index){
              final item = items[index];
          return _TopRoundedNavigationBarButton(
            item: item,
            selectedColor: item.color ?? selectedColor,
            isSelected: index == unselectedColor,
            onPressed: (){
              onTap?.call(index);
            },

          );
        }),
      ),

    );
  }
}


class _TopRoundedNavigationBarButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final TopRoundedNavigationBarItem? item;
  final bool? isSelected;
  final Color selectedColor;
  final Color unselectedColor;

  const _TopRoundedNavigationBarButton({
   this.onPressed,
    this.item,
    this.isSelected,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.grey
});

  @override
  Widget build(BuildContext context) {
    final color = isSelected! ? selectedColor : unselectedColor;
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected! ? color.withOpacity(.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Icon(
              item!.selectedIcon, color: color,
            ),
            const SizedBox(width: 5,),
            AnimatedDefaultTextStyle(
                child: Text(item!.label),
                style:TextStyle(color: color),
                duration: kThemeAnimationDuration)
          ],
        ),
      ),
    );
  }
}

class TopRoundedNavigationBarItem {
  final String label;
  final IconData selectedIcon;
  final IconData? unselectedIcon;
  final Color? color;
  const TopRoundedNavigationBarItem({
    required this.label,
    required this.selectedIcon,
    this.unselectedIcon,
    this.color
});
}
