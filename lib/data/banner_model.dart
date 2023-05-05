import 'package:macha/data/banner.dart';

List<Banner> banners() {
  Banner one = Banner();
  one.image = '1.png';
  one.image1 = '1_1.png';
  one.image2 = '1_2.png';
  one.image3 = '1_3.png';
  one.name = 'Macha';
  one.price = '80';

  Banner two = Banner();
  two.image = '2.png';
  two.image1 = '2.png';
  two.image2 = '2.png';
  two.image3 = '2.png';
  two.name = 'Macha Mix';
  two.price = '70';

  Banner three = Banner();
  three.image = '3.png';
  three.image1 = '3.png';
  three.image2 = '3.png';
  three.image3 = '3.png';
  three.name = 'Habanera';
  three.price = '90';

  Banner four = Banner();
  four.image = '4.png';
  four.image1 = '4.png';
  four.image2 = '4.png';
  four.image3 = '4.png';
  four.name = 'Suprema';
  four.price = '85';

  return [one, two, three, four];
}
