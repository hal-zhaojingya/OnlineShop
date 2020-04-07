����
cd c:\xampp\mysql\bin
����

����
mysql -u root
����

����
CREATE DATABASE `OnlineShop` CHARACTER SET utf8 ;
����

����
USE `OnlineShop`;
����

����
DROP TABLE Customers;
DROP TABLE GoodsType;
DROP TABLE GoodsImg;
DROP TABLE Goods;
DROP TABLE Address;
DROP TABLE Order;
DROP TABLE Cart;
DROP TABLE Area;
����

����
select * from customers;

CREATE TABLE Customers (
  `CustomerId` int(20) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(100),
  `CustomerPass` varchar(20),
  `CustomerEmail` varchar(100),
  `CusPortrait` varchar(1000),
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
����

����
INSERT INTO `Customers` VALUES ('1','�W���I�W�����[','zhao742052797','zhao742052797@gmail.com', 'portrait.jpg');
INSERT INTO `Customers` VALUES ('2','�}���I','123456','zhao742052797@gmail.com', 'portrait.jpg');
����

����
CREATE TABLE GoodsType (
  `GoodsTypeId`  int(20) NOT NULL AUTO_INCREMENT,
  `GoodsTypeName` varchar(100),
  PRIMARY KEY (`GoodsTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
����

����
INSERT INTO `GoodsType` VALUES (1,'�����Y'),(2,'���f�B�['),(3,'�L�[�Y���x�r�['),(4,'�a��'),(5,'�E�F�f�B���O�h���X'),(6,'�X�[�c'),(7,'���o��'),(8,'�A�N�Z�T���['),(9,'���l�`'),(10,'�Q�[���@'),(11,'�p�[�e�B�[�Q�[��'),(12,'��^��'),(13,'���^��'),(14,'�X�}�[�g�t�H��'),(15,'�J����'),(16,'�p�\�R��'),(17,'�ƒ�p'),(18,'�I�t�F���X�p'),(19,'�L�����v'),(20,'���s'),(21,'�Ԍ�'),(22,'�s�N�j�b�N'),(23,'�}���K'),(24,'�~���[�W�b�N'),(25,'�w���p��'),(26,'���o�p'),(27,'�ƒ�p'),(28,'�x�r�[�J�[');
����

����
CREATE TABLE GoodsImg (
  `ImgId`  int(20) NOT NULL AUTO_INCREMENT,
  `ImgSrcMain` varchar(1000),
  `ImgSrc02` varchar(1000),
  `ImgSrc03` varchar(1000),
  `ImgSrc04` varchar(1000),
  PRIMARY KEY (`ImgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
����

����
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
����

����
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
����

����
INSERT INTO `Goods` VALUES (1,1,'�嗐���X�}�b�V���u���U�[�Y SPECIAL - Switch',10,'Joy-Con��Nintendo Switch Pro�R���g���[���[�ɉ����A�Q�[���L���[�u�R���g���[�� (*1) �ɂ��Ή����Ă���܂��B
TV���[�h�A�g�у��[�h�A�e�[�u�����[�h�ƁA���ł��ǂ��ł����D���ȃv���C�X�^�C���ŗV�Ԃ��Ƃ��ł��܂��B
�������A�I�����C���v���C (*2) �ɂ��Ή����Ă���܂��B
*1�ʔ��́u�Q�[���L���[�u�R���g���[���ڑ��^�b�v�v���K�v�ł��B
*2Nintendo Switch Online�T�[�r�X�ւ̉������K�v�ł��B',100,'2020-02-01','2020-02-14','Nintendo Switch',2,'Video Game','1','2018-12-07','30*10*20cm','HAC-P-AAABA', "", "", "");


INSERT INTO `Goods` VALUES (2,2,'�h�������� �̂ё��̌��ʒT���L -Switch',10,'(C)���q�v���E���w�فE�e���r�����E�V���G�C�EADK 2019
(C)FURYU Corporation.',100,'2020-02-01','2021-02-14','Nintendo Switch',3,'Video Game','1','2019/2/28','30*10*20cm','HAC-P-ASH3A', "", "", "");


INSERT INTO `Goods` VALUES (3,3,'�}���I�J�[�g8 �f���b�N�X - Switch',10,'�u�}���I�J�[�g8 �f���b�N�X�v
�Ή��n�[�h:Nintendo Switch
���[�J�[:�C�V��
�W������:���[�X / �A�N�V����
�Ή��R���g���[���[:Nintendo Switch Pro�R���g���[���[
�v���C���[�h:TV���[�h, �e�[�u�����[�h, �g�у��[�h
�v���C�l��:1~4�l
���[�J���ʐM�v���C�l��:2~8�l
�C���^�[�l�b�g�ʐM�v���C�l��:2~12�l
�Ή�����:���{��, �p��, �X�y�C����, �t�����X��, �h�C�c��, �C�^���A��, �I�����_��, �|���g�K����, ���V�A��, �؍���, ������',100,'2020-02-01','2021-02-14','Nintendo Switch',4,'Video Game','1','2017/4/28','30*10*20cm','NSW-054', "", "", "");


INSERT INTO `Goods` VALUES (4,4,'�P�w�E�G�f�B���O�x�[�� �u���C�_���x�[�� ���[�X�h�J �ԉŗp�i',5,'���������������[�X�x�[���A?�D���ȃ^�C�v�ŁA���ꂢ�ȃE�F�f�B���O�h���X�Ƀs�b�^���I
3�l�����I�I�������A�񎟉�A�p�[�e�B�A����Ȃǉ؂₩�ȃV�[���Ƀs�b�^���̐l�C�A�C�e���I�I
�P�w�x�[���@�@���� ���[�X�h�J �@�����ȃu���C�_���x�[���I�I',500,'2020-02-01','2021-02-14',"",5,"",'1',"",'12.7 x 12.7 x 1.8 cm','HSTS-MB', '����', '168g', '�I�t�z���C�g');


INSERT INTO `Goods` VALUES (5,5,'���f�B�[�X ���t����O�h���X �J���[�h���X �����O �����s�[�X ',5,'�f�ށz�`���[���A���[�X

�y���C���z���z��A�V���G�b�g
�{�f�B���C���ɓK�x�Ƀt�B�b�g���A�������S�n�ɂȂ�܂��B

�y�o�b�N�X�^�C���z�t�@�X�i�[',450,'2020-02-01','2021-02-14','�x�r�[�I�����C���h���X',6,"",'1',"",'12.7 x 12.7 x 1.8 cm','HSTS-MB', '����', '168g', '�I�t�z���C�g');


INSERT INTO `Goods` VALUES (6,6,'�E�G�f�B���O�h���X �I�t�V�����_�[ �����O A���C�� �ԉňߑ� ',5,"",390,'2020-02-01','2021-02-14',"",5,"",'1',"",'12.7 x 12.7 x 1.8 cm','HSTS-MB', '����', '168g', '�I�t�z���C�g');


INSERT INTO `Goods` VALUES (7,7,'LED�����^�� �L�����v�����^�� USB�[�d�� �d�r��',19,"",120,'2020-02-01','2021-02-14',"",8,"",'1',"",'29�~9cm','HSTS-MB', "", '230��', '�u���b�N');


INSERT INTO `Goods` VALUES (8,8,'�t���C�V�[�g�t�L�����v�e���g �t�B�[���h�L�����v�h�[��',19,'FIELDOOR','220','2020-02-01','2021-02-14',"",9,"",'1',"",'1�l','HSTS-MB', "", '2.6 Kg', '�u���b�N');


INSERT INTO `Goods` VALUES (9,9,'�y�A�E�g�h�A�`�F�A�E�L�����v�p�i�z�R���p�N�g�`�F�A',19,' �����A�o�����Ď��R�ɐG�ꍇ���܂��傤�B�L�����v�A�n�C�L���O�A���ނ�A�c�[�����O�Ȃǂ̂��܂��܂ȃA�E�g�h�A�����ɏd�󂵂܂��B

����̊����ɂ����ɗ����܂��B�^����A���Ԍ��Ȃǂɂ��A�낢����A�ƒ�؉��A��ł�BBQ�A�p�[�e�B�[�ɂ��҂�����ł��B�����Ŏg�p���Ă��A��a��������܂���B ','120','2020-02-01','2021-02-14','Linkax',10,"",'1',"",'47cm*58cm*67cm','HSTS-MB', "", '862 g', '�u���b�N�{�u���[');


INSERT INTO `Goods` VALUES (10,10,'�S�ł̐n',23,null,'100','2020-02-01','2021-02-23',null,11,null,'1','2016-6-3','47cm*58cm*67cm','HSTS-MB', null, '862 g', '�u���b�N�{�u���[');


INSERT INTO `Goods` VALUES (11,11,'LNMLAN �X�[�c�P�[�X �A���~�j�E���}�O�l�V�E���t���[�� �@���������݃X�[�c�P�[�X �L�����[�o�b�O �É��L���X�^�[ 360�����R��] ���s�p4010',20,null,'100','2020-02-01','2021-02-14','LNMLAN',10,null,'1',null,null,'HSTS-MB', null, '6.5 Kg', '�u���b�N�{�u���[');


INSERT INTO `Goods` VALUES (12,12,'SAMCAMEL �Q�� �~�p �y�� �����^ �����_�E�� �Q�� 1700g-2700g�_�E�� �}�~�[�^ �X���[�s���O�o�b�N �ې􂢉\ �Ԓ��� �V�����t �n�k�h��/�L�����v/�o�R/�A�E�g�h�A 2�� �A���\',19,'�A�Q���̈����������Ȃ��A�Q�܂̒��ŐQ�Ԃ肪���Ă܂��B�������h�̐l�������h�̐l�����K�ɖ���镕���^�C�v�I���ɓo�R��I�[�g�L�����p�[�ɐl�C�I','100','2020-02-01','2021-02-14','SAMCAMEL',10,null,'1',null,'1�l','HSTS-MB', null, '1.9 Kg', '�u���[');


INSERT INTO `Goods` VALUES (13,13,'���S (LEGO) �V�e�B �|���X�X�e�[�V���� 60047',10,' ���S�ň�Ԑl�C�̃V�e�B�V���[�Y�́u�|���X�v�u���h���v�u�F���T���v�u�͂��炭�ԁv�u�C�꒲�����v�u�g���C���v�u��̍H���v�ȂǁA�q�ǂ�����D���Ȑ��E����������B���C�ɓ���̃T�u�V���[�Y�������āA�����V���[�Y�ŏW�߂�΁A�s��ȃX�P�[���ŉf��̂悤�ȃX�g�[���[���v�������Ԃ�������Ȃ��B

�܂��A�ʁX�̃V���[�Y���炨�C�ɓ���̏��i��g�ݍ��킹�āA���������̊X�����邱�Ƃ��ł���̂ŁA�y���ݕ��͖�����B

�荠�ȃT�C�Y�̏��i����A���ƂȂ��ꏏ�Ɋy���߂Ă��܂��傫�ȃZ�b�g���i������̂ŁA�s�����Ƃ̃v���[���g�ɂ������߁B ','100','2020-02-01','2021-02-14','���S (LEGO)',10,null,'1',null,'�s�[�X��854','HSTS-MB', null, '2.1 Kg', null);


INSERT INTO `Goods` VALUES (14,14,'�A�b�v���J(Aprica) �y��B�`�x�r�[�J�[ �}�W�J���G�A�[�N�b�V���� MagicalAir Cushion NV �p�g���I�b�g�X�g���C�v 7����~ (1�N�ۏ�) 2074137',28,'�����Ԃ�������邱����� ���������b�V�����݌v����

���������C�t���Ȃ��U���X�g���X����Ԃ��������܂��B
1��ꂮ��K�[�h~�f�R�{�R���ł̐U������S�g�����~
�E�n�ڂ��ꂽ�u��������t���[���v
�E�ԗւɔ�������u���S�T�X�y���V�����v���y��','100','2020-02-01','2021-02-14','�A�b�v���J(Aprica)',10,null,'1',null,'102 x 47.5 x 29.5 cm','HSTS-MB', null, '15 Kg', '�u���b�N�{�u���[');
����
 
����
CREATE TABLE Address (
  `CustomerAddressId` int(20) NOT NULL AUTO_INCREMENT,
  `CustomerAddress` varchar(100),
  `CustomerPost` varchar(100),
  `AddressName` varchar(100),
  `CustomerTel` varchar(100),
  `CustomerId` int(20),
  PRIMARY KEY (`CustomerAddressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
����

����
INSERT INTO `Address` VALUES (1,'��ʌ��������܎s�ݒ�3-1-6 �W���C�t���Y�a212��','3300064','�W���I�W�����[','07016868989', 1);
INSERT INTO `Address` VALUES (2,'���s�{','3300064','�}���I','07016868989', 2);
INSERT INTO `Address` VALUES (3,'�����s','3300063','�W���I�W�����[','07016868989', 1);
INSERT INTO `Address` VALUES (4,'�_�ސ쌧','3300062','�}���I','07016868989', 2);
INSERT INTO `Address` VALUES (null, '���{','3300062','�}���I','07016868989', 2);
����

����
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
����

����
CREATE TABLE `Area` (
  `GoodsAreaId` int(20) NOT NULL AUTO_INCREMENT,
  `AreaName` varchar(255),
  PRIMARY KEY (`GoodsAreaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
����

����
INSERT INTO `Area` VALUES
  (2,'�k�C��'),
  (3,'�X��'),
  (4,'��茧'),
  (5,'�{�錧'),
  (6,'�H�c��'),
  (7,'�R�`��'),
  (8,'������'),
  (9,'��錧'),
  (10,'�Ȗ،�'),
  (11,'�Q�n��'),
  (12,'��ʌ�'),
  (13,'��t��'),
  (14,'�����s'),
  (15,'�_�ސ쌧'),
  (16,'�V����'),
  (17,'�x�R��'),
  (18,'�ΐ쌧'),
  (19,'���䌧'),
  (20,'�R����'),
  (21,'���쌧'),
  (22,'�򕌌�'),
  (23,'�É���'),
  (24,'���m��'),
  (25,'�O�d��'),
  (26,'���ꌧ'),
  (27,'���s�{'),
  (28,'���{'),
  (29,'���Ɍ�'),
  (30,'�ޗǌ�'),
  (31,'�a�̎R��'),
  (32,'���挧'),
  (33,'������'),
  (34,'���R��'),
  (35,'�L����'),
  (36,'�R����'),
  (37,'������'),
  (38,'���쌧'),
  (39,'���Q��'),
  (40,'���m��'),
  (41,'������'),
  (42,'���ꌧ'),
  (43,'���茧'),
  (44,'�F�{��'),
  (45,'�啪��'),
  (46,'�{�茧'),
  (47,'��������'),
  (48,'���ꌧ');
����

����
CREATE TABLE Cart (
  `CartId` int(20) NOT NULL AUTO_INCREMENT,
  `GoodsId` int(20),
  `CustomerId` int(20),
  `count` int(20),
  PRIMARY KEY (`CartId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
����


����
CREATE TABLE Favorite (
  `FavoriteId` int(20) NOT NULL AUTO_INCREMENT,
  `GoodsId` int(20),
  `CustomerId` int(20),
  PRIMARY KEY (`FavoriteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
����


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

INSERT INTO `reply` VALUES (1, 2, '2020-04-05', '�ԐM');

CREATE TABLE review (
  `reviewId` int(20) NOT NULL AUTO_INCREMENT,
  `GoodsId` int(20),
  `CustomerId` int(20),
  `review_time`  varchar(100),
  `review_title`  varchar(100),
  `review_message` varchar(1000),
  PRIMARY KEY (`reviewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `review` VALUES (1, 1, 1, '2020/04/06 14:28:56', '�������ߏ��i', '�Q�[�����e�ł́A�O���t�B�b�N�̐i���Ɖ����ǂ��ł��􎩑R���Ƃ������Ƃ���BGM���S�n�ǂ��Ė�����܂��B���̃O���t�B�b�N�����Ȃ胊�A���ł����B�����΂̏Ƃ�Ԃ��Ȃǂ����A���ōו�����荞�܂�Ă��܂��B');

