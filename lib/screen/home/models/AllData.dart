class AllDataModel {
  final int id;
  final String image;
  final String title;
  final String label;
  final double statingPrice;
  final double finalPrice;
  final String discount;
  final double rating;
  final List<String> size;

  AllDataModel({
    required this.id,
    required this.image,
    required this.title,
    required this.label,
    required this.statingPrice,
    required this.finalPrice,
    required this.discount,
    required this.rating,
    required this.size,
  });
}

List<AllDataModel> newArrivals = [
  AllDataModel(
    id: 1,
    image: 'assets/images/new arrival - erigo work shir sturgeon dark oak.png',
    title: 'Erigo Work Shirt Sturgeon Dark Oak',
    label: 'New',
    statingPrice: 200.000,
    finalPrice: 150.000,
    discount: '-25%',
    rating: 4.5,
    size: ['S', 'M', 'L', 'XL', 'XXL'],
  ),
  AllDataModel(
    id: 2,
    image: 'assets/images/new arrival - erigo work shirt tesla black.png',
    title: 'Erigo Work Shirt Tesla Black',
    label: 'New',
    statingPrice: 200.000,
    finalPrice: 150.000,
    discount: '-25%',
    rating: 4.5,
    size: ['S', 'M', 'L', 'XL', 'XXL'],
  ),
  AllDataModel(
    id: 3,
    image: 'assets/images/new arrival - erigo knitwear walker grey.png',
    title: 'Erigo Knitwear Walker Grey',
    label: 'New',
    statingPrice: 200.000,
    finalPrice: 150.000,
    discount: '-25%',
    rating: 4.5,
    size: ['S', 'M', 'L', 'XL', 'XXL'],
  ),
  AllDataModel(
    id: 4,
    image: 'assets/images/new arrival - erigo knitwear latham grey.png',
    title: 'Erigo Knitwear Latham Grey',
    label: 'New',
    statingPrice: 200.000,
    finalPrice: 150.000,
    discount: '-25%',
    rating: 4.5,
    size: ['S', 'M', 'L', 'XL', 'XXL'],
  ),
];

List<AllDataModel> heroProducts = [
  AllDataModel(
    id: 1,
    image: 'assets/images/erigo chino pants sirius black.png',
    title: 'Erigo Chino Pants Sirius Black',
    label: '',
    statingPrice: 200.000,
    finalPrice: 150.000,
    discount: '-67%',
    rating: 4.5,
    size: ['S', 'M', 'L', 'XL', 'XXL'],
  ),
  AllDataModel(
    id: 2,
    image: 'assets/images/erigo t-shirt oversize antelope black unisex.png',
    title: 'Erigo T-Shirt Oversize Antelope Black Unisex',
    label: '',
    statingPrice: 200.000,
    finalPrice: 150.000,
    discount: '-67%',
    rating: 4.5,
    size: ['S', 'M', 'L', 'XL', 'XXL'],
  ),
  AllDataModel(
    id: 3,
    image: 'assets/images/erigo chino pants paul light grey.png',
    title: 'Erigo Chino Pants Paul Light Grey',
    label: '',
    statingPrice: 200.000,
    finalPrice: 150.000,
    discount: '-67%',
    rating: 4.5,
    size: ['S', 'M', 'L', 'XL', 'XXL'],
  ),
  AllDataModel(
    id: 4,
    image: 'assets/images/erigo t-shirt project summer black.png',
    title: 'Erigo T-Shirt Project Summer Black',
    label: '',
    statingPrice: 200.000,
    finalPrice: 150.000,
    discount: '-67%',
    rating: 4.5,
    size: ['S', 'M', 'L', 'XL', 'XXL'],
  ),
];