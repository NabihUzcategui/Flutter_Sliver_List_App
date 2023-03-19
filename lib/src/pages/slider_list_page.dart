import 'package:flutter/material.dart';

class SliderListPage extends StatelessWidget {
  const SliderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _MainScroll(),
        Positioned(bottom: -10, right: 0, child: _BotonNewList()),
      ],
    ));
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: MaterialButton(
        onPressed: () {},
        color: const Color(0xffed6762),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: const Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _ListItem(
      titulo: 'Orange',
      color: Color(0xffF08F66),
    ),
    const _ListItem(
      titulo: 'Family',
      color: Color(0xffF2A38A),
    ),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(
      titulo: 'Orange',
      color: Color(0xffF08F66),
    ),
    const _ListItem(
      titulo: 'Family',
      color: Color(0xffF2A38A),
    ),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minheight: 170,
                maxheight: 200,
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: const Color(0xffF08F66).withOpacity(0.9),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: const _Titulo(),
                ))),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          const SizedBox(
            height: 100,
          )
        ])),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minheight, required this.maxheight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: const Text(
            'New',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: const Color(0xfff7cdd5),
              ),
            ),
            Container(
              child: const Text(
                'List',
                style: TextStyle(
                    color: Color(0xffd93a30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    const _ListItem(
      titulo: 'Orange',
      color: Color(0xffF08F66),
    ),
    const _ListItem(
      titulo: 'Family',
      color: Color(0xffF2A38A),
    ),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    const _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    const _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    const _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem({required this.titulo, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Text(
        titulo,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
