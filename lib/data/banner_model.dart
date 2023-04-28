import 'package:macha/data/banner.dart';

List<Banner> banners() {
  Banner one = Banner();
  one.image = '1.png';
  one.name = 'Macha';
  one.price = '80';

  Banner two = Banner();
  two.image = '2.png';
  two.name = 'Macha Mix';
  two.price = '70';

  Banner three = Banner();
  three.image = '3.png';
  three.name = 'Habanera';
  three.price = '90';

  Banner four = Banner();
  four.image = 'Suprema.png';
  four.name = 'Suprema';
  four.price = '85';

  return [one, two, three, four];
}
