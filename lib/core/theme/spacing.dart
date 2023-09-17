part of 'theme.dart';

class AppSpacings {
  const AppSpacings();

  double get xxs => 4;
  double get xs => 8;
  double get s => 12;
  double get m => 16;
  double get l => 24;
  double get xl => 32;
  double get xxl => 48;
  double get xxxl => 64;

  double get buttonHeight => 42;

  double get horizontal => m;
  double get vertical => m;
  double get all => m;

  EdgeInsets get xxSmallAll => EdgeInsets.all(xxs);
  EdgeInsets get xSmallAll => EdgeInsets.all(xs);
  EdgeInsets get smallAll => EdgeInsets.all(s);
  EdgeInsets get mediumAll => EdgeInsets.all(m);
  EdgeInsets get largeAll => EdgeInsets.all(l);

  EdgeInsets get xxSmallHorizontal => EdgeInsets.symmetric(horizontal: xxs);
  EdgeInsets get xSmallHorizontal => EdgeInsets.symmetric(horizontal: xs);
  EdgeInsets get smallHorizontal => EdgeInsets.symmetric(horizontal: s);
  EdgeInsets get mediumHorizontal => EdgeInsets.symmetric(horizontal: m);

  EdgeInsets get xxSmallVertical => EdgeInsets.symmetric(vertical: xxs);
  EdgeInsets get xSmallVertical => EdgeInsets.symmetric(vertical: xs);
  EdgeInsets get smallVertical => EdgeInsets.symmetric(vertical: s);
  EdgeInsets get mediumVertical => EdgeInsets.symmetric(vertical: m);

  EdgeInsets get xxSmallHV =>
      EdgeInsets.symmetric(horizontal: xxs, vertical: xxs);
  EdgeInsets get xSmallHV => EdgeInsets.symmetric(horizontal: xs, vertical: xs);
  EdgeInsets get smallHV => EdgeInsets.symmetric(horizontal: s, vertical: s);
  EdgeInsets get mediumHV => EdgeInsets.symmetric(horizontal: m, vertical: m);

  EdgeInsets get xxSmallTop => EdgeInsets.only(top: xxs);
  EdgeInsets get xSmallTop => EdgeInsets.only(top: xs);
  EdgeInsets get smallTop => EdgeInsets.only(top: s);
  EdgeInsets get mediumTop => EdgeInsets.only(top: m);

  EdgeInsets get xxSmallBottom => EdgeInsets.only(bottom: xxs);
  EdgeInsets get xSmallBottom => EdgeInsets.only(bottom: xs);
  EdgeInsets get smallBottom => EdgeInsets.only(bottom: s);
  EdgeInsets get mediumBottom => EdgeInsets.only(bottom: m);

  EdgeInsets get xxSmallLeft => EdgeInsets.only(left: xxs);
  EdgeInsets get xSmallLeft => EdgeInsets.only(left: xs);
  EdgeInsets get smallLeft => EdgeInsets.only(left: s);
  EdgeInsets get mediumLeft => EdgeInsets.only(left: m);

  EdgeInsets get xxSmallRight => EdgeInsets.only(right: xxs);
  EdgeInsets get xSmallRight => EdgeInsets.only(right: xs);
  EdgeInsets get smallRight => EdgeInsets.only(right: s);
  EdgeInsets get mediumRight => EdgeInsets.only(right: m);

  BorderRadius get xxSmallRadius => BorderRadius.circular(xxs);
  BorderRadius get xSmallRadius => BorderRadius.circular(xs);
  BorderRadius get smallRadius => BorderRadius.circular(s);
  BorderRadius get mediumRadius => BorderRadius.circular(m);
  BorderRadius get largeRadius => BorderRadius.circular(l);
  BorderRadius get xLargeRadius => BorderRadius.circular(xl);
  BorderRadius get xxLargeRadius => BorderRadius.circular(xxl);
  BorderRadius get xxxLargeRadius => BorderRadius.circular(xxxl);
}
