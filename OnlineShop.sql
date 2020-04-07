※※
cd c:\xampp\mysql\bin
※※

※※
mysql -u root
※※

※※
CREATE DATABASE `OnlineShop` CHARACTER SET utf8 ;
※※

※※
USE `OnlineShop`;
※※

※※
DROP TABLE Customers;
DROP TABLE GoodsType;
DROP TABLE GoodsImg;
DROP TABLE Goods;
DROP TABLE Address;
DROP TABLE Order;
DROP TABLE Cart;
DROP TABLE Area;
※※

※※
select * from customers;

CREATE TABLE Customers (
  `CustomerId` int(20) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(100),
  `CustomerPass` varchar(20),
  `CustomerEmail` varchar(100),
  `CusPortrait` varchar(1000),
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
※※

※※
INSERT INTO `Customers` VALUES ('1','ジャオジンヤー','zhao742052797','zhao742052797@gmail.com', 'portrait.jpg');
INSERT INTO `Customers` VALUES ('2','マリオ','123456','zhao742052797@gmail.com', 'portrait.jpg');
※※

※※
CREATE TABLE GoodsType (
  `GoodsTypeId`  int(20) NOT NULL AUTO_INCREMENT,
  `GoodsTypeName` varchar(100),
  PRIMARY KEY (`GoodsTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
※※

※※
INSERT INTO `GoodsType` VALUES (1,'メンズ'),(2,'レディー'),(3,'キーズ＆ベビー'),(4,'和服'),(5,'ウェディングドレス'),(6,'スーツ'),(7,'演出服'),(8,'アクセサリー'),(9,'お人形'),(10,'ゲーム機'),(11,'パーティーゲーム'),(12,'大型車'),(13,'小型車'),(14,'スマートフォン'),(15,'カメラ'),(16,'パソコン'),(17,'家庭用'),(18,'オフェンス用'),(19,'キャンプ'),(20,'旅行'),(21,'花見'),(22,'ピクニック'),(23,'マンガ'),(24,'ミュージック'),(25,'学生用書'),(26,'演出用'),(27,'家庭用'),(28,'ベビーカー');
※※

※※
CREATE TABLE GoodsImg (
  `ImgId`  int(20) NOT NULL AUTO_INCREMENT,
  `ImgSrcMain` varchar(1000),
  `ImgSrc02` varchar(1000),
  `ImgSrc03` varchar(1000),
  `ImgSrc04` varchar(1000),
  PRIMARY KEY (`ImgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
※※

※※
INSERT INTO `GoodsImg` VALUES (1,'game02.jpg','single01.jpg','single02.jpg','single03.jpg');
INSERT INTO `GoodsImg` VALUES (2,'game03.jpg',"", "", "");
INSERT INTO `GoodsImg` VALUES (3,'game04.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (4,'wedding01.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (5,'wedding02.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (6,'wedding03.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (7,'camp01.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (8,'camp02.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (9,'camp03.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (10,'osusume01.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (11,'osusume02.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (12,'osusume03.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (13,'osusume04.jpg',null, null, null);
INSERT INTO `GoodsImg` VALUES (14,'osusume05.jpg',null, null, null);
※※

※※
CREATE TABLE Goods (
  `GoodsId`  int(20) NOT NULL AUTO_INCREMENT,
  `ImgId` int(20),
  `GoodsName` varchar(100),
  `GoodsTypeId` varchar(100),
  `GoodsDescript` varchar(2000),
  `GoodsUnitPrice` decimal(10,0),
  `GoodsBorrowDate` varchar(50),
  `GoodsReturnDate` varchar(50),
  `GoodsBrand` varchar(50),
  `GoodsAreaId` varchar(50),
  `GoodsMedia` varchar(100),
  `GoodsAmount` varchar(100),
  `GoodsIssue` varchar(100),
  `GoodsSize` varchar(100),
  `GoodsModel` varchar(100),
  `GoodsSex` varchar(100),
  `GoodsWeight` varchar(100),
  `GoodsColor` varchar(100),
  PRIMARY KEY (`GoodsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
※※

※※
INSERT INTO `Goods` VALUES (1,1,'大乱闘スマッシュブラザーズ SPECIAL - Switch',10,'Joy-ConやNintendo Switch Proコントローラーに加え、ゲームキューブコントローラ (*1) にも対応しております。
TVモード、携帯モード、テーブルモードと、いつでもどこでもお好きなプレイスタイルで遊ぶことができます。
もちろん、オンラインプレイ (*2) にも対応しております。
*1別売の「ゲームキューブコントローラ接続タップ」が必要です。
*2Nintendo Switch Onlineサービスへの加入が必要です。',100,'2020-02-01','2020-02-14','Nintendo Switch',2,'Video Game','1','2018-12-07','30*10*20cm','HAC-P-AAABA', "", "", "");


INSERT INTO `Goods` VALUES (2,2,'ドラえもん のび太の月面探査記 -Switch',10,'(C)藤子プロ・小学館・テレビ朝日・シンエイ・ADK 2019
(C)FURYU Corporation.',100,'2020-02-01','2021-02-14','Nintendo Switch',3,'Video Game','1','2019/2/28','30*10*20cm','HAC-P-ASH3A', "", "", "");


INSERT INTO `Goods` VALUES (3,3,'マリオカート8 デラックス - Switch',10,'「マリオカート8 デラックス」
対応ハード:Nintendo Switch
メーカー:任天堂
ジャンル:レース / アクション
対応コントローラー:Nintendo Switch Proコントローラー
プレイモード:TVモード, テーブルモード, 携帯モード
プレイ人数:1~4人
ローカル通信プレイ人数:2~8人
インターネット通信プレイ人数:2~12人
対応言語:日本語, 英語, スペイン語, フランス語, ドイツ語, イタリア語, オランダ語, ポルトガル語, ロシア語, 韓国語, 中国語',100,'2020-02-01','2021-02-14','Nintendo Switch',4,'Video Game','1','2017/4/28','30*10*20cm','NSW-054', "", "", "");


INSERT INTO `Goods` VALUES (4,4,'単層ウエディングベール ブライダルベール レース刺繍 花嫁用品',5,'美しい結婚式レースベール、?優美なタイプで、きれいなウェディングドレスにピッタリ！
3Ｍ超長！！結婚式、二次会、パーティ、舞台など華やかなシーンにピッタリの人気アイテム！！
単層ベール　　純白 レース刺繍 　完璧なブライダルベール！！',500,'2020-02-01','2021-02-14',"",5,"",'1',"",'12.7 x 12.7 x 1.8 cm','HSTS-MB', '女性', '168g', 'オフホワイト');


INSERT INTO `Goods` VALUES (5,5,'レディース 演奏会ロングドレス カラードレス ロング ワンピース ',5,'素材】チュール、レース

【ライン】理想のAシルエット
ボディラインに適度にフィットし、いい着心地になります。

【バックスタイル】ファスナー',450,'2020-02-01','2021-02-14','ベビーオンラインドレス',6,"",'1',"",'12.7 x 12.7 x 1.8 cm','HSTS-MB', '女性', '168g', 'オフホワイト');


INSERT INTO `Goods` VALUES (6,6,'ウエディングドレス オフショルダー ロング Aライン 花嫁衣装 ',5,"",390,'2020-02-01','2021-02-14',"",5,"",'1',"",'12.7 x 12.7 x 1.8 cm','HSTS-MB', '女性', '168g', 'オフホワイト');


INSERT INTO `Goods` VALUES (7,7,'LEDランタン キャンプランタン USB充電式 電池式',19,"",120,'2020-02-01','2021-02-14',"",8,"",'1',"",'29×9cm','HSTS-MB', "", '230ｇ', 'ブラック');


INSERT INTO `Goods` VALUES (8,8,'フライシート付キャンプテント フィールドキャンプドーム',19,'FIELDOOR','220','2020-02-01','2021-02-14',"",9,"",'1',"",'1人','HSTS-MB', "", '2.6 Kg', 'ブラック');


INSERT INTO `Goods` VALUES (9,9,'【アウトドアチェア・キャンプ用品】コンパクトチェア',19,' さあ、出かけて自然に触れ合いましょう。キャンプ、ハイキング、お釣り、ツーリングなどのさまざまなアウトドア活動に重宝します。

日常の活動にも役に立ちます。運動会、お花見などにも、庭いじり、家庭菜園、庭でのBBQ、パーティーにもぴったりです。室内で使用しても、違和感がありません。 ','120','2020-02-01','2021-02-14','Linkax',10,"",'1',"",'47cm*58cm*67cm','HSTS-MB', "", '862 g', 'ブラック＋ブルー');


INSERT INTO `Goods` VALUES (10,10,'鬼滅の刃',23,null,'100','2020-02-01','2021-02-23',null,11,null,'1','2016-6-3','47cm*58cm*67cm','HSTS-MB', null, '862 g', 'ブラック＋ブルー');


INSERT INTO `Goods` VALUES (11,11,'LNMLAN スーツケース アルミニウムマグネシウムフレーム 機内持ち込みスーツケース キャリーバッグ 静音キャスター 360°自由回転 旅行用4010',20,null,'100','2020-02-01','2021-02-14','LNMLAN',10,null,'1',null,null,'HSTS-MB', null, '6.5 Kg', 'ブラック＋ブルー');


INSERT INTO `Goods` VALUES (12,12,'SAMCAMEL 寝袋 冬用 軽量 封筒型 高級ダウン 寝袋 1700g-2700gダウン マミー型 スリーピングバック 丸洗い可能 車中泊 シュラフ 地震防災/キャンプ/登山/アウトドア 2個 連結可能',19,'就寝時の圧迫感が少なく、寝袋の中で寝返りがうてます。横向き派の人も仰向け派の人も快適に眠れる封筒タイプ！特に登山やオートキャンパーに人気！','100','2020-02-01','2021-02-14','SAMCAMEL',10,null,'1',null,'1人','HSTS-MB', null, '1.9 Kg', 'ブルー');


INSERT INTO `Goods` VALUES (13,13,'レゴ (LEGO) シティ ポリスステーション 60047',10,' レゴで一番人気のシティシリーズは「ポリス」「消防隊」「宇宙探検」「はたらく車」「海底調査隊」「トレイン」「解体工事」など、子どもが大好きな世界がたくさん。お気に入りのサブシリーズを見つけて、同じシリーズで集めれば、壮大なスケールで映画のようなストーリーも思い浮かぶかもしれない。

また、別々のシリーズからお気に入りの商品を組み合わせて、自分だけの街をつくることもできるので、楽しみ方は無限大。

手頃なサイズの商品から、おとなも一緒に楽しめてしまう大きなセット商品もあるので、行事ごとのプレゼントにおすすめ。 ','100','2020-02-01','2021-02-14','レゴ (LEGO)',10,null,'1',null,'ピース数854','HSTS-MB', null, '2.1 Kg', null);


INSERT INTO `Goods` VALUES (14,14,'アップリカ(Aprica) 軽量B形ベビーカー マジカルエアークッション MagicalAir Cushion NV パトリオットストライプ 7か月~ (1年保証) 2074137',28,'□□赤ちゃんを守るこだわり すくすくッション設計□□

私たちが気付かない振動ストレスから赤ちゃんを守ります。
1ゆれぐらガード~デコボコ道での振動から全身を守る~
・溶接された「がっちりフレーム」
・車輪に備わった「安心サスペンション」が軽減','100','2020-02-01','2021-02-14','アップリカ(Aprica)',10,null,'1',null,'102 x 47.5 x 29.5 cm','HSTS-MB', null, '15 Kg', 'ブラック＋ブルー');
※※
 
※※
CREATE TABLE Address (
  `CustomerAddressId` int(20) NOT NULL AUTO_INCREMENT,
  `CustomerAddress` varchar(100),
  `CustomerPost` varchar(100),
  `AddressName` varchar(100),
  `CustomerTel` varchar(100),
  `CustomerId` int(20),
  PRIMARY KEY (`CustomerAddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
※※

※※
INSERT INTO `Address` VALUES (1,'埼玉県さいたま市岸町3-1-6 ジョイフル浦和212号','3300064','ジャオジンヤー','07016868989', 1);
INSERT INTO `Address` VALUES (2,'京都府','3300064','マリオ','07016868989', 2);
INSERT INTO `Address` VALUES (3,'東京都','3300063','ジャオジンヤー','07016868989', 1);
INSERT INTO `Address` VALUES (4,'神奈川県','3300062','マリオ','07016868989', 2);
INSERT INTO `Address` VALUES (null, '大阪府','3300062','マリオ','07016868989', 2);
※※

※※
CREATE TABLE Order (
  `OrderId`  int(20) NOT NULL AUTO_INCREMENT,
  `GoodsId` int(20),
  `CustomerId` int(20),
  `OrderTime` date,
  `CustomerName` varchar(100),
  `TotalMoney` decimal(10,0),
  `BorrowTime` varchar(100),
  `ReturnTime` varchar(100),
  `OrderState` char(1),
  `CustomerAddressId` int(20),
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
※※

※※
CREATE TABLE `Area` (
  `GoodsAreaId` int(20) NOT NULL AUTO_INCREMENT,
  `AreaName` varchar(255),
  PRIMARY KEY (`GoodsAreaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
※※

※※
INSERT INTO `Area` VALUES
  (2,'北海道'),
  (3,'青森県'),
  (4,'岩手県'),
  (5,'宮城県'),
  (6,'秋田県'),
  (7,'山形県'),
  (8,'福島県'),
  (9,'茨城県'),
  (10,'栃木県'),
  (11,'群馬県'),
  (12,'埼玉県'),
  (13,'千葉県'),
  (14,'東京都'),
  (15,'神奈川県'),
  (16,'新潟県'),
  (17,'富山県'),
  (18,'石川県'),
  (19,'福井県'),
  (20,'山梨県'),
  (21,'長野県'),
  (22,'岐阜県'),
  (23,'静岡県'),
  (24,'愛知県'),
  (25,'三重県'),
  (26,'滋賀県'),
  (27,'京都府'),
  (28,'大阪府'),
  (29,'兵庫県'),
  (30,'奈良県'),
  (31,'和歌山県'),
  (32,'鳥取県'),
  (33,'島根県'),
  (34,'岡山県'),
  (35,'広島県'),
  (36,'山口県'),
  (37,'徳島県'),
  (38,'香川県'),
  (39,'愛媛県'),
  (40,'高知県'),
  (41,'福岡県'),
  (42,'佐賀県'),
  (43,'長崎県'),
  (44,'熊本県'),
  (45,'大分県'),
  (46,'宮崎県'),
  (47,'鹿児島県'),
  (48,'沖縄県');
※※

※※
CREATE TABLE Cart (
  `CartId` int(20) NOT NULL AUTO_INCREMENT,
  `GoodsId` int(20),
  `CustomerId` int(20),
  `count` int(20),
  PRIMARY KEY (`CartId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
※※


※※
CREATE TABLE Favorite (
  `FavoriteId` int(20) NOT NULL AUTO_INCREMENT,
  `GoodsId` int(20),
  `CustomerId` int(20),
  PRIMARY KEY (`FavoriteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
※※


CREATE TABLE message (
  `MessageId` int(20) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(20),
  `mes_time`  varchar(100),
  `mes_title`  varchar(100),
  `mes_message` varchar(1000),
  PRIMARY KEY (`MessageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE reply (
  `ReplyId` int(20) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(20),
  `rep_time` varchar(20),
  `rep_message` varchar(60),
  PRIMARY KEY (`ReplyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `reply` VALUES (1, 2, '2020-04-05', '返信');

CREATE TABLE review (
  `reviewId` int(20) NOT NULL AUTO_INCREMENT,
  `GoodsId` int(20),
  `CustomerId` int(20),
  `review_time`  varchar(100),
  `review_title`  varchar(100),
  `review_message` varchar(1000),
  PRIMARY KEY (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `review` VALUES (1, 1, 1, '2020/04/06 14:28:56', 'おすすめ商品', 'ゲーム内容では、グラフィックの進化と音が良いです♪自然音とゆったりとしたBGMが心地良くて癒されます。虫のグラフィックがかなりリアルでした。焚き火の照り返しなどもリアルで細部も作り込まれています。');

