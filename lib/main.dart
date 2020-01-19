import 'package:flutter/material.dart';

int selectedTab = 0;
List<Furniture> recommendedFurniture = <Furniture>[];
List<Furniture> sofaFurnitures = <Furniture>[];
List<Furniture> tableFurnitures = <Furniture>[];

Color primary = const Color(0xFF916DD5);
Color secondary = const Color(0xFFB097E1);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Explore'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    final Furniture a =
        Furniture('1', 'Leather Sofa', 'Sofa', '36', '30', 'a.png');
    final Furniture b =
        Furniture('2', 'Dining Table', 'Table', '36', '30', 'b.png');

    recommendedFurniture.add(a);
    sofaFurnitures.add(a);
    recommendedFurniture.add(b);
    tableFurnitures.add(b);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double unitHeightValue = MediaQuery.of(context).size.height * 0.01;
    return Stack(
      children: <Widget>[
        Container(
          //Background gray
          color: Colors.grey[100],
        ),
        Container(
          //Background white
          margin: const EdgeInsets.only(left: 100.0),
          color: Colors.white,
        ),
        Container(
          // Side Menu
          color: Colors.transparent,
          width: 100,
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 0;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Recommended',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color:
                                  selectedTab == 0 ? Colors.black : Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          selectedTab == 0
                              ? Container(
                                  height: 2,
                                  width: 80,
                                  color: primary,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sofas',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color:
                                  selectedTab == 1 ? Colors.black : Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          selectedTab == 1
                              ? Container(
                                  height: 2,
                                  width: 50,
                                  color: primary,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 2;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Tables',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color:
                                  selectedTab == 2 ? Colors.black : Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          selectedTab == 2
                              ? Container(
                                  height: 2,
                                  width: 50,
                                  color: primary,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          // Body
          margin: const EdgeInsets.only(left: 100, top: 100),
          child: Material(
            child: selectedTab == 0
                ? ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 5,
                    ),
                    padding: const EdgeInsets.all(30),
                    itemCount: recommendedFurniture.length,
                    itemBuilder: (BuildContext context, int index) {
                      return furnitureTile(recommendedFurniture[index]);
                    },
                  )
                : selectedTab == 1
                    ? ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 5,
                        ),
                        padding: const EdgeInsets.all(30),
                        itemCount: sofaFurnitures.length,
                        itemBuilder: (BuildContext context, int index) {
                          return furnitureTile(sofaFurnitures[index]);
                        },
                      )
                    : ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 5,
                        ),
                        padding: const EdgeInsets.all(30),
                        itemCount: tableFurnitures.length,
                        itemBuilder: (BuildContext context, int index) {
                          return furnitureTile(tableFurnitures[index]);
                        },
                      ),
          ),
        ),
        Container(
          //Top bar
          color: Colors.transparent,
          height: 100,
          child: Stack(
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 40, left: 10, right: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.dialpad,
                                color: Colors.black,
                                size: 25,
                              ),
                              onPressed: () {
                                print('I love bakatan');
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          'Explore',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 25,
                          ),
                          onPressed: () {
                            print('I love melon');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                //Icons's Grey Shadow
                left: 34,
                top: 42,
                child: Icon(
                  Icons.lens,
                  color: Colors.grey[100],
                  size: 19,
                ),
              ),
              Positioned(
                //Purple Icon
                left: 36,
                top: 44,
                child: Icon(
                  Icons.lens,
                  color: primary,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget furnitureTile(Furniture item) {
    return Container(
      height: 275,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 90,
                color: Colors.transparent,
              ),
              Container(
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                height: 125,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //Star
                      margin: const EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      height: 50,
                      child: Icon(
                        Icons.star_border,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Text(
                        item.name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            item.category,
                            style: TextStyle(color: secondary),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '\$${item.price}',
                                style: TextStyle(
                                    color: secondary,
                                    decoration: TextDecoration.lineThrough),
                              ),
                              Text(
                                ' \$${item.currentPrice}',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Add to Cart ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute<DetailPage>(
                  builder: (BuildContext context) => DetailPage(
                        furniture: item,
                      )));
            },
            child: Container(
              //Image
              height: 150,
              margin: const EdgeInsets.only(left: 20, right: 50),
              child: Hero(
                tag: item.id,
                child: Image(
                  image: AssetImage(item.img),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  DetailPage({Key key, this.furniture}) : super(key: key);
  final Furniture furniture;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            //Purple BG
            color: primary,
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Hero(
                    tag: widget.furniture.id,
                    child: Image(
                      image: AssetImage(widget.furniture.img),
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: secondary,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                )),
                            child: Icon(Icons.crop, color: Colors.white),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 5),
                                child: Text(
                                  'Small',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Size',
                                  style: TextStyle(color: secondary),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: secondary,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                )),
                            child: Icon(Icons.zoom_out_map, color: Colors.white),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 5),
                                child: Text(
                                  '11.2"',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Diameters',
                                  style: TextStyle(color: secondary),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            //White BG
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            margin: const EdgeInsets.only(top: 300),
          ),
          Container(
            margin: const EdgeInsets.only(top: 300),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        widget.furniture.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            '\$${widget.furniture.price}',
                            style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            ' \$${widget.furniture.currentPrice}',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${widget.furniture.category}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Divider(
                    height: 40,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Explore this furniture',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. ',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 15, left: 30, right: 30),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Add to Cart ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          Container(
            //Top bar
            color: Colors.transparent,
            height: 100,
            child: Stack(
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 40, left: 10, right: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                onPressed: () {
                                  print('I love bakatan');
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            '',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {
                              print('I love melon');
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Furniture {
  Furniture(this.id, this.name, this.category, this.price, this.currentPrice,
      this.img);

  final String id;
  final String name;
  final String category;
  final String price;
  final String currentPrice;
  final String img;
}
