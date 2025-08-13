import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:test_b_slincing/utils/text_style_resource.dart';
import 'package:test_b_slincing/utils/uitls.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cateogories =
      [
        CategoryModel(
          icon: "assets/images/icon_menu_default.png",
          name: "All Item",
        ),
        CategoryModel(icon: "assets/images/icon_menu_dress.png", name: "Dress"),
        CategoryModel(
          icon: "assets/images/icon_menu_t_shirt.png",
          name: "T-Shirt",
        ),
        CategoryModel(icon: "assets/images/icon_menu_jeans.png", name: "Jeans"),
      ].toList();

  final _products =
      [
        ProductModel(
          image: "assets/images/product1.png",
          name: "Modern Light Clothes",
          categoryName: "T-Shirt",
          price: 212.99,
          rate: 5.0,
        ),
        ProductModel(
          image: "assets/images/product2.png",
          name: "Light Dress Bless",
          categoryName: "Dress modern",
          price: 162.99,
          rate: 5.0,
        ),
        ProductModel(
          image: "assets/images/product3.png",
          name: "Maroon Dark Top",
          categoryName: "Dress",
          price: 194.99,
          rate: 5.0,
        ),
        ProductModel(
          image: "assets/images/product4.png",
          name: "Light Dress Yellow",
          categoryName: "Dress Modern",
          price: 122.99,
          rate: 5.0,
        ),
      ].toList();

  Widget userInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello, Welcome👋",
              style: regular12().copyWith(fontWeight: FontWeight.w400),
            ),
            Text(
              "Albert Stevano",
              style: regular16().copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          child: Image.asset("assets/images/profile.png", width: 32),
        ),
      ],
    );
  }

  // Search Bar
  Widget searchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedSearch01,
                color: Color(0xFFDFDEDE),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: const Color(0xFFDFDEDE),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: const Color(0xFFDFDEDE),
                  width: 1,
                ),
              ),
              hintText: "Search clothes...",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Color(0xFF292526),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Image.asset("assets/images/icon_filter.png", width: 24),
            ),
          ),
        ),
      ],
    );
  }

  // Card category
  Widget cartCategory(
    bool isSelected,
    String? iconAsset,
    String? categoryName,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF292526)),
        color: (isSelected) ? Color(0xFF292526) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              iconAsset ?? "assets/images/icon_menu_default.png",
              width: 16,
              color: (!isSelected) ? Color(0xFF292526) : Colors.white,
            ),
            SizedBox(width: 4),
            Text(
              categoryName ?? "Category Name",
              style: regular12().copyWith(
                fontWeight: FontWeight.w500,
                color: (isSelected) ? Color(0xFFDFDEDE) : Color(0xFF292526),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget list of category
  Widget listOfMenu() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 24),
          ..._cateogories.map((value) {
            final firstItemName = _cateogories[0].name;
            final isFirstItem = value.name == firstItemName;
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: cartCategory(isFirstItem, value.icon, value.name),
            );
          }),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  // Cart Product
  Widget cartProduct(bool isSelected, double height, ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(product.image ?? "assets/images/product1.png", height: height, fit: BoxFit.cover,),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Color(0xFF292526),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    (isSelected)
                        ? "assets/images/icon_love.png"
                        : "assets/images/icon_love_outline.png",
                    width: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name ?? "Product name",
              overflow: TextOverflow.ellipsis,
              style: regular14().copyWith(fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                product.categoryName ?? "Product category",
                overflow: TextOverflow.ellipsis,
                style: regular10().copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  overflow: TextOverflow.ellipsis,
                  style: regular14().copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 24),
                Row(
                  children: [
                    Image.asset("assets/images/icon_star.png", width: 18),
                    SizedBox(width: 4),
                    Text(
                      product.categoryName ?? "Product cateogry",
                      overflow: TextOverflow.ellipsis,
                      style: regular12().copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // List of Product
  Widget listOfProduct() {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _products.length,
      crossAxisCount: 2,
      mainAxisSpacing: 17,
      crossAxisSpacing: 24,
      itemBuilder: (context, index) {
        final product = _products[index];
        final defaultHeight = 217;
        final height =
            (index + 1) % 2 == 0 ? defaultHeight + 32 : defaultHeight;

        return cartProduct(index == 1, height.toDouble(), product);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                    child: userInfo(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: searchBar(),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: listOfMenu(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: listOfProduct(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
