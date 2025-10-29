class Product {
  String image;
  String name;
  String description;
  int price;

  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });
}

class ShoppingProduct {
  String image;
  String name;
  String description;
  int price;

  ShoppingProduct({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });
}

List<ShoppingProduct> shoppingProducts =[];

List<Product> dummyProductList = [
  Product(
    image: 'asset/image/elonmusk.webp',
    name: '일론이 운전하는 현대차타기',
    description: '테슬라 오너 일론머스크가 테슬라보다 좋은 현대차로 목적지까지 데려다 드립니다.',
    price: 50000,
  ),
  Product(
    image: 'asset/image/kim.webp',
    name: '김정은과 K-drama 시청하기',
    description:
        '김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기김정은과 K-drama 시청하기',
    price: 120000,
  ),
  Product(
    image: 'asset/image/lee.webp',
    name: '이재용과 마라탕 식사하기',
    description: '이재용과 마라탕 식사하기',
    price: 25000,
  ),
  Product(
    image: 'asset/image/trump.webp',
    name: '트럼프와 할리갈리하기',
    description: '트럼프와 할리갈리하기',
    price: 25000,
  ),
  Product(
    image: 'asset/image/mcgrigor.webp',
    name: '맥그리거와 뜨개질하기',
    description: '맥그리거와 뜨개질하기',
    price: 25000,
  ),
  Product(
    image: 'asset/image/ronaldo.webp',
    name: '호날두한테 필라테스 배우기',
    description: '호날두한테 필라테스 배우기호날두한테 필라테스 배우기',
    price: 25000,
  ),
  Product(
    image: 'asset/image/snoopdogg.webp',
    name: '스눕독과 케리비안베이 가기',
    description: '스눕독과 케리비안베이 가기',
    price: 25000,
  ),
  Product(
    image: 'asset/image/xijinping.webp',
    name: '시진핑과 롤 1:1 대결하기',
    description: '시진핑과 롤 1:1 대결하기시진핑과 롤 1:1 대결하기',
    price: 25000,
  ),
  Product(
    image: 'asset/image/jeffbezos.webp',
    name: '제프 베이조스와 클럽 가기',
    description: '제프 베이조스와 클럽 가기',
    price: 25000,
  ),
  Product(
    image: 'asset/image/putin.webp',
    name: '푸틴한테 주짓수배우기',
    description: '제프 베이조스와 클럽 가기',
    price: 25000,
  ),
];
