import 'package:flutter/material.dart';

class ListParallaxPage extends StatelessWidget {
  const ListParallaxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parallax Scrolling Effect')),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) => ItemWidget(index: index),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  ItemWidget({super.key, required this.index});

  final int index;
  final keyImage = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      height: 220,
      child: Flow(
        delegate: ParallaxFlowDelegate(
          itemContext: context,
          scrollable: Scrollable.of(context),
          keyImage: keyImage,
        ),
        children: [
          Image.network(
            'https://source.unsplash.com/random/300x800?sig=$index',
            fit: BoxFit.cover,
            key: keyImage,
          ),
        ],
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.itemContext,
    required this.keyImage,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext itemContext;
  final GlobalKey keyImage;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(width: constraints.maxWidth);
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final itemBox = itemContext.findRenderObject() as RenderBox;
    final itemOffset = itemBox.localToGlobal(
      itemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (itemOffset.dy / viewportDimension).clamp(0, 1);

    final verticalAligment = Alignment(0, scrollFraction * 2 - 1);

    final imageBox = keyImage.currentContext!.findRenderObject() as RenderBox;
    final childRect = verticalAligment.inscribe(
      imageBox.size,
      Offset.zero & context.size,
    );

    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(0, childRect.top),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        itemContext != oldDelegate.itemContext ||
        keyImage != oldDelegate.keyImage;
  }
}
