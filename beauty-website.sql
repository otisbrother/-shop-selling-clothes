-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 23, 2024 lúc 12:38 PM
-- Phiên bản máy phục vụ: 10.4.16-MariaDB
-- Phiên bản PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `beauty-website`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `categoryName`, `createdAt`, `updatedAt`) VALUES
(1, 'Áo', '2023-04-13 19:35:20', '2023-05-11 13:03:43'),
(2, 'Sản phẩm bán chạy', '2023-04-14 03:31:34', '2023-05-11 12:59:24'),
(3, 'Quần', '2023-04-15 01:15:31', '2023-05-11 12:58:58'),
(4, 'Đồ Handmade', '2023-04-15 01:15:53', '2023-05-11 12:46:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favoritelists`
--

CREATE TABLE `favoritelists` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `totalPrice` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productcomments`
--

CREATE TABLE `productcomments` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `commentContent` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `imageUrl` longblob DEFAULT NULL,
  `price` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `categoryId`, `productName`, `quantity`, `description`, `imageUrl`, `price`, `createdAt`, `updatedAt`) VALUES
(35, 2, 'Áo da', 23, 'Áo da dành cho nam', 0x89504e470d0a1a0a0000000d49484452000004b90000009d08060000005849aafe000000017352474200aece1ce90000000467414d410000b18f0bfc61050000000970485973000012740000127401de661f78000035bc49444154785eeddd077c1cf599fff1efeeaabae06e6c8131109aa9c2100ca68400a1d810085c0a175288cd8516c2fd4d8e3b0824214042821320b40b2685e44280102060c724b4501c9a6d516cd38d31b1dc25cb92adb2e5ff7b7e3b2bade495b46a9656fabcc37a676667676667c7bed77eeff93d134a380200000000e484aaaa2aff5c5656e69fbba2b4b4d43f575757aba4a4c44f0340ae0a07cf00000000000040ce1ad0955c0d0d51d5d537f8e786684cb1585c89843d8215804e0a85ec11562412567e5e44f9f9792a2cc8f7cf000000405750c90500990db84aae6834a6aacd355ab3b6426bd7576a53558db66cadf341573c4ec085ee61d7915d4f765dd9f565d7995d6f76ddd9f567d7210000000000e83e0326e4b24aad8acacd5ab3ae429babb72a1a2364c0f667d79d5d7f761ddaf568d7250000000000e8ba01117259e5ccda7515bea206e82bec7ab4ebd2ae4f0000000000d035fd3ae4b2a1623644cc2a6780becaae4fbb4eed7a0500000000009dd36f43aeadb5755ab781e000b9c1ae53bb5eedba0500000000001dd72f432e1b06b6b162334de49153ec7ab5eb9661b50000000000745cbf0bb9ac12c61a7a03b9caae5f2aba0000000000e8987e1572d9902f022ef407fece8b0cb50500000000206bfd2ae4aad854cd1045f40b761ddbf50c0000000000b2134a38c174873cfbcf57f4e2ab8bf5c6b2b7b562e54a6dd858a1fabaa8f20bf3346ae430ed3661671d38696f1d71c8641d39754af0ae9e53b5b986bb28a2df193aa4583b0c1d1ccc01000000eeb74f55957f2e2b2bf3cf5d515a5aea9fababab555252e2a70120577528e42a5fb34ef73cf0b0fef4e87c1f6a291157381472afc4fdeb21b7a590fb9f1221c5c252d43d226ed9e891c375d6f493f5b52f9ca9713b8ef1eb76a786684c6bd7b9e301faa1b16346283f2f12cc01000060a023e40280ccb21eae78d39dbfd191d3bfa8bbef7b48550df54a842ddc721b48241f26114a281c0f292f1e56246e3fca438a86e35a5d59a95fde73bf4e38e94bbaf58e5f2757ee46d5d55b8229a0ffe1fa0600000080ec44a3516ddab449f178b218a7bebede87b81818da0db996bcf5aece3ae702ddfecb7b140a85142ec8d3a051c315292ef4f38a2792155ceed942ad845b1409c735223fa6b1d12a0dafaf5661b4564a44656db46ffbdf7b74fa57cff3dbed0ed1684c5bb672273af45f767ddb750e00000000689d55395e74d1451a33668c66ce9ca937de7843bffad5af74efbdf7066ba0bf6b33e47ae21f0bf485af5fac254bdef641968d6c8c29a1487181127961c513711b9ce81f5e22a286889457247d72cff13a63ef121d3566078d8ed52a1c8eaa3e5f8a45c27a6bc93bfafcb917bbedbf10bcb1f3b66cad0da680fe8beb1c00000000dab67af56a0d1d3a546bd6acd1bffffbbfeb9bdffca61e7ffc719d70c209c11ae8ef5aedc96501d7f9ffef2a3795f0c3117dc01509296f48b18a470d53d5baf50a6fad572466655cb696148e1728168e29a27a4dc84f686ac9308d1dbe835e58b95eaf6eac57342f5f856efd703cac869055a624f4bf3fbf5ec71d33d576d9296bd656281aa3ca05fd5b5e24a21dc78e08e60000003090d1932bf7d4d4d468e5ca95da6bafbd140e67dd3568c0dbba75ab2ebbec32bdf4d24bfac31ffee0cf1fd0968c7fbb6c28e125ff7d8d9b4af8f02a66a312ddc3c2aed0d606d5afdda0705d837f3dea16c64209f77a42e1821a8d2edaaca14551ad0ce5e9ded5b5baefad0fb53552a8c1e1b80ae39b14cdaf55555e81228aba9dc7f49f575ea365efbe6fbbedb08686689f0bb816dd52a2dd2e7c48eb82f9b6f87527deac45c17c9bca1fd20513ddfab72c0c1674a360dbb72e0ee6b78b85bad5edf38247d606f3bd27f93dccd423e5c1822eeac835902dbbceed7a0700000072dd860d1b74fbedb7fbea9a8282028d1b374e679f7db6afb8a9abeb9956344b962cd151471da55ffce217be80637bb29e50dffffef775e08107eac1071f0c963679f6d967b5c71e7be8f39fffbcd6adebce5f117d837da7f7dd779f3ffff67d1f77dc719a3b776e63cfac9ef0f7bfff5da3468dd2a5975eea83320c1c1943ae2baf9bad3af717b1d95ffd504871abe6723fb6ebea6aad04ccf7e4f2c315dd8af9eef998b1c33473af61faee7e85ba72ef3c5db25b913e593256a313353a78644411bbeba2221a116aba13627d7d83aef9e92dc15cc7d4b9f7f657eb1e99a9dd2cd4f261c942dd7af845daefe1555a7ec9214daf77739032202dbe5967cdbe5c0fae98a3d3c707cbfaa8fe7cbd030000606078f1c51775d24927f9f061f1e2c53ef8d865975d7cf873da69a7e9bffffbbfb579f3e660edeeb3df7efbf9de4cf3e6cdf3a1d2fdf7dfef83250b5cde79e79d60ad9e118944b4d34e3b69df7df7f5cfe96c589d056ffff55fffe587d9dd73cf3dfe37f7f6f6eaabafea3ffff33f3386705d619fe5d65b6fd585175ea8430f3d547ffce31f356cd8307df5ab5ff541574fb0218b77dc7187efcdb570e1423dfae8a3c12badb3e37cfae9a775eeb9e7faaa31e4ae6d42ae9beefcb5de58fab69bb2882b3de6b2502bf9ecffb3f4db9acdbb47d81acebbc9e5950d5aba31ac0f37176af890613a7aa7229db9739e4edca15ec7ef345a3b0d1aa3fcda7c8daeaff77fd193c31c137ae3ad77f48bbbeff17be9885caf6c997cc92a2d5ff16d4d0ee6532cc03a6cc505eeb5557af9a4b93a6ce2f39aeaa62f3e3858c159b9625e3085ce5ba85bcf784337bdb8ed77d01751c9050000805cf6de7beff9a167cb972fd78f7ffc637df4d1477aeaa9a7f4f2cb2febdd77dfd517bff845dd76db6d3ef4b13be475371bea662157454585af2c7aecb1c774f9e597ebbbdffdae3fb69e62bf7d2dd4b3e1a553a736b5eab1cf68a1d6a44993f48d6f7cc3075df3e7cfef9590c5aae8ecdc5bd55947bcfdf6db3aecb0c35a3de6caca4a1f1e7df6b39fd50f7ff8439d79e699bae69a6bb4e38e3beaf5d75f0fd6ea3e764e2dcc3ce2882374f5d557ebbaebaed36f7ffb5bad58b122582333fbdc7ffad39ff47ffff77fdd12325a5e629ff73bdff94e87cf29baa659c855be669d7e71d7efdc94afcf0a1e29c9790bb3ac8acb267c3597ff5ff2e5d5d10a3db3a15affbbbc5e97ff73bd662d58a3fbdf5fa321bb8cd13e63aaf5e5c9d2d0a2cd7aa370820a0b0b150e593ce6b8eddcfaabdfab7c6dc7ea921afae51de7d66ae52ed737566c8d397d8e96af385b13ba69281dd2944fd01773a0822ba57f5eef0000001808ec47bf854a166859b5d625975ca2c1830707af4a13274ed40d37dca0638f3dd657fbf45475958d463ae38c337cc5d23efbece3abca52555ddb5b5e5e9e0f412cf4b1693b1e1b66971e84f565f69d7efcf1c7dab2658bf2f36d6cd7b6acff987d361b9a981a9e585b5beb7b940d1932c4cf7727dbd715575ce1cfab4d1f73cc31be62ccaeafedc9aac9da0bd6d0339a855cbfbbefa160aa7d3644d1447c795742459188ce3f7017dd78cc4efac9e43cfdcf8185fac26e83356170b156acdaa278b448870d0deb4b7b0ed7f8861a7f51db5f0abbd0edd9fda7dfdd9ffdfe4d2cd69531bc4d3da11a8706fa47536fa664afa6d423cbde598dd6ea910bd3dfbf6dcfa7ccbd9bc66ac24757a4bdcf3d6e59a931a92026e89f75d66c373df7221d16ac934d3fade69fc73d320c776c7e2e5aeb99d5f2b3b5beff6cf6d9a469bb6df5ea6a3c6fa93e65c1a3f13d8b6f6eda9f7b643a36bf8dc34b1bcf5fb3ef37d86ec66368ebb536341f7eda395dbbde01000080de637db89e7cf2495ff563bda72c8068c91adf4f9f3e5d6fbdf5965e78e105df4bc9869c591fa7050b16046b259b91db721bfe666198558359ff255b96de7fc92a727ef0831ff880e395575ef1cbecf55ffef2978dfda1ec78ac72cc7e9f1adb9e6dd7b6651567175f7cb1ef19b6fffefbebaebbee6ab3c22cfdbdf619ecee7ea79e7aaaffec5651d4f273d8b61e7ef8619d7cf2c9fe35db871d6f7a5faed4fb9e7ffe79bfae1db77d56eb61965e7d66bfa96df8a72db7d7274f9eec2b987ef7bbdff9f7df7befbdc19acda58ed9f66bbef6b5aff9f56dbf76dc76fca9f39c925a6e852b5ffef297f5ad6f7dcbf71bcb64871d76f055551670fef5af7ff5e7c5fa934d9830c17fd71d611551f61dd879b2cf78de79e7f9902d5d7979b9afe0b2755a3ba72dd9776243286ddbc682d6d4396beb3b35166459055e6a7fa9875d739b366df27777b4796c3fcd42ae3ffd657e1038251f166445e22145ecd9cd87159775d552222c9bb3f2adb81f7098502c1e57b861a886d7c554523844478d8ae8b49d0a75e29ec374d4ee310d53b50a071768eaa1a374c4902d6ac8b768ac56e170bd1adcf66389901e74fbef8844a2eb3ffae75f52aaab75bd1f1ab87c45996e9a3e4f971e7eb36ebda544774d2c4b5b7e83ceca3aa098abab275e215d65ef4d3e1e9c65db6dbfb9b9852f875d72801e0cdeb77cc5a39a35fbb4a67064fce77487df9e9b9e7e9b5e0ed64b1fcab8ad64a077d65b4debfb633a297839b0e4aea66192f678f99669fefc340f896c5ba5ba749f471bd75bfef0e59a7d46cbe027bb7da65b748bdbeedc69bae9c555bae3f4b1c1d25658c0f743e99a60bb8dc77acbcddaedae5d1af769cb679fd1e2bc5b1f2ea51d7fcbef77fc913ad9fd7b3bfff117b6f9bed7bd3c57f375b9ce6beff8d2b9fd1d76c93c9d7c8bbb9e6eff9cc6048b3baa3bae77000000a0376cdcb8d107107beeb9a70f285a63e18c59bb36fbffa7b20df74b0d99b33b18a6d8362c1cb2d7ac52cb822c1b9e682188554b599063fbb3d0c5aaa9d29bdedbf0c90b2eb84083060df2fda3d6af5fef2bd02ca8698f851bd75e7bad1ffed61a0bb87efef39f6bc68c19da75d75dfdb14c9b36cdf792b22a371b52996ece9c39bafbeebb75ca29a7f8d0c82ad1aebaeaaac6f59e7bee391f1efeed6f7ff3db39ebacb37cc065815e5b2c84b2cf67db3516e2d8b11c7c709b3f303d0bb6acbf99053999424b634335bffef5affbe0c8f663efb1a18a362cb023d573562d66df910d37b561ad7befbdb70ff17ef4a31f35069b1642d939b0619776fcb6be5d6ff679ec73d9f0d84cc68e1debaf8154059df50fb3f7ecbefbee7ede64fa4e6d7f16f2d9f792da5f2ab8b3cf69c3157ba34270a06b0cb99e5df0b2d66f6cfe17c98ab5127e3c6172da04b35e6a99a98bc7f5e33797e9ab4fbfae2fbd54a1af2ddea28b5fafd043cbb7aa7a5089123bee22f7af99c68c2ed631078c577e28e2de65658bee391657281ed3c60d1bf59c3b8e6c25d20fa0b3a6dfa66b1a038bb13afdaadb74b26ed0ecb75a2c3fef7269ee5c2dc866d8e0dc79daefe1e6c3e0265f1204680fb4717744df04dd429ef41e5187e8e2873bb0ef0c16dd729a665b20d62260997c7af3f9f99aae9783619266cce917c8b2b4d9cf351d73e3b6d2d6d3c1dff6a15b7a2894ed3e53acd2c9aad366b5386fad73e7e9aaa66d8d39fd7a777eddb1ce7ea3c572fb0cf334ffe5b4ff23e98e37351c34a9e5f73b56534f9a96e19cafd582c7e7b9833c2afb1e5e56f975c60dee3d8fb61fdcb5a35bae77000000a0175968d45a20627cefe60eb24a2b1b76683d9eacd1788add51f11ffff8870f7d468c18a1bffce52f7ae491477c85ce4f7ef2133fa4ede69b6ff6d54bd69c3cbd5ac97a4d592066ebd9e3ce3beff40df12dd469afc7d233cf3ce343180ba0ac822953a8f7cf7ffed33764b72a320bb6ec586cb8a605691660a57f0e535c5cec87715e79e5953ebc3afdf4d37d0592559b597867bdbd6c7f161ed9b4ad67814c7b218b9d3b0bd52c0834761eed58ec9c75070ba0ecb8ad32cfd84d062cf44a0d1f7ce289271aaba6da62556b369cf381071ef0e19ef5ddb220c9ced3aa55abfc39b8f1c61bb56cd9321f72d939b07369eb5b6065d7c19ffffc675fccd3929d236bba6f3727305ff8c217fc399832658a9f372dbfd3a2a2a236f767d7a2f57deb8d9b080c748d21d73f5f2d0ba69ab34b201692e26e4d9bb6eaaef4a0cb7e79dbfca0c2021d3f7298ce3b6092beb2e76efaccb0612a0de7aba02ea497df5caa0dd15a25dc5fcce2e2b076191dd310bfb5024513050a4563ca0bbefc7fbe9ac5b8bb40b2117e17edb34bf3d065fc2eb24bfbe4938e6cbe7cdc2e3a59f3b4727530dfa6cb35759be03b084e663fdfeab0c745cfdd204d9faea92d439e838fda36a8c9da422d989de1f364b0ed3a1334c182e8b73e0ac2abd6b735f9e8f49028fb7d1adf68ff92799af5707b1569e90ed08466e769ac26ece39eb6397fc9cf307f45d3ff4727a316df6fc670acfc05cd9f2bcd3a3a3d206b83055c875fa4f9b31e6d11aa754eb75cef000000402fb21ffd99828694ce8402d667ebc4134ff421880d4bb48a2c0ba2ac99ba85379ffef4a77d1f280b96ac9acc829cd4b032bba3a1854d16a2a4dfd5d1eeba68c3d452ac5acc86a45945517bc76895595ff9ca579af51c6bc9022a3b160b7c6cd89f1d8b3ddbd037d372789d5566a5b6377cf8701ff0d8fbed7359ffa737df7c539ff9cc677c95979d8fd47ac71f7fbc9fee0da9ca390bf27ef6b39ff92a2c0b87ac52ca2acf8c8574f61db4d733cbd6b12aa954406a77a93ce080037c459c7d1fe9e7c0aad252e7c0d6b7a6f7f6ddd99d3dabaaaafcf28e6af99d66b33f0bc0aaababfd726c3f8d21d79bfe8e8adbb2015291c27c4513c9de5921bba3629ab82d735fa80d5b8c8c8fe8d0030b74c6a1f53ae7b8429dfdb9dd75caa777d74947efa17123c38ab8ef3d9c1fd1f84f8cd4ce83434a588fa170814289a8e41e3604b2b5e3c824146a3cfc4e3b79e28460aa1b4ddf45ad6ff50dadcc5891b5562bdf724f697db69a1ea7c95a7075cae2e7fd7bf7dba5fd2aa26dd70982a394f28fb4c43dd9b0c0e6c7e71e56ad94d2817deaf12b1a87f2651f70396d9ee3ec34eb17666154b03ce9104d6d519de6872a4ebf4d5fccea38e7ea6adb66cbaab72ee88eeb1d000000e80d165258359505036d0d455cb4285912903e542c1b9ff8c42774c20927f8c6f616fe580861d316728d1f3fdeff96b530c4aa766c989b35786ff9b0bb2fa6b4ac38b3dfbcd6443d1b1670d810b8b65838632c00ca742c471e79a47f3dc58e27a5e5b1d8e7b2ed59c558cbfe4f9da98ceb2e563d659565d6d7cc7a85d9f773fbedb7fb60ce2aa7ac21bc0dafb4ef68b7dd760bde9599bd6ed74f8a7d37e9e7a4ad73307af468dfefcd02a7d479efa896df694fef0f9dd7f83763f947cd1bb6a5587835edb3a7a968c8603f7431d5703ec5fe72d93f18d1684ce56ba27af6f58d7af8c5d5facb8b1fea5f15751a3e61ac8a4715282f9250bc2eaca8dbc8e07183b5cfd842abe352346ebdbfa26e1b7145dd8ff80f5b398e4c22915cfcd1dfb202a905abfa69ec15d5fcd1f9e16ed334615c30d90dace22ad3f12d6f76a7c2ecf669c1d2c9f69ca1ff554f4935816fd697eb451ba6da5cf3eab4e450c56cabd334d73dac0a6e9b218f9d979bd73b000000201f1058d3740b9e6c6860a66a2e1b7666c18755641d74d041c1d26d5970601555e9ac0aca1a825bf54c5959991f2e66815aaa417a8a551759d0f5a94f7d6a9b878513ddc182a554654f7bac3f55a663b1617d1d65e7a465a8d213954476f3380b79da638df0ad3ace3e63ea7c1c7df4d1be72aeb2b2529ffbdce7fcf051ab90b26193ddc11ac2b71c4e6afdd4ecda1a3366cc368154b65afb4e7b6a7fe8bcc65fcd1b5af4e332f144dc875843860ed501071de80718a6d8d71bf24b12be0c32df7de9230715e8850febf487770b34f7e322d50edf59138f384a358347e8c3759bb5a67cb362eeef5ca8a8417bed344cc5fe2ea309b79f986221f717c54dafdbb0d11666253faff752e936cdfd489906c7ad5c31af8d0aa4a06aaa71686037e9d030cb76044339977cd4ceb0c90eecf3e493aed71d16305905db2d6df42beb360b755faa097c7b1556e9c344fd50c5693af9b02c83c6e9d375cded4d3732e8d89d3933ebb3d73b000000d00e0b09ac61b855ed58cf22aba64abf13a2dda5ce86b659ef23eb9165fd8f6c685b2afcb0f02a158c5978921aee962ed580defa3ccd9f3fdf0f394c3550b79e5656a965555ed6d3cac2ae140b62ec0e8ddb532ac4b36359b3668d9f3636d4d2ce81553b656be4c891be5acd3ec3abafbe1a2c4d0ea9b3d0b023d2c32b3b673befbcb31f5268df4f8a85874b972e0de65a97aac6b375534dfd2d28b2e1a3167019ab90b273916d28d81a1bbe585a5aeaabe0ece600a96bc5423febc566c76c3719183264885fde966c02bceedc1fba5763c85557df104c3589b89763f184a279791a397aac426ebe2e62f7582c50381e512811f2bdba86ee30544589b006e7e56bf4c8c13a78f4461db9df700ddb619036344415fb57855ede58a7a7deaf517ea240050d11ed39364ffb0e2ad6e086906af30b7c5c36389a50437df663b0f3f35b6f58d8bb6ed0826d5a8b25fb546dd3032c4db272e822dd976d5bb256c2b466823b05cebe2bdb3b43b62518c277c9bd6d87361ddda7dd31d29aebdb5d247b3ae80a865cb61c4a99bc6b624b4d431617f9a18a19faa5b569ac4ebffd51cd72d7c35913bb1e74f5ddeb1d000000689f5568d9ddf0ac62ea3ffee33ffc1034eba565c194dd05cf1a75cf9a354be79f7f7e63e58c0ddbb3a18ed648dd86bd59736f6b049f693863aa01bddd51d01ef65e2bc848f9d297bea4d34e3bcd3791b7670bdbbef7bdeff9ca29ebd7b53d59d0639fd3aadaaca7931d871d8f4d5bf3f24c956eadb1217376973fabdab26181175d7491df9e858ae943fada923a9f3ffef18ffdb9b63b06da7badf9ba858036bcd0ee4a693dc3ecf5fc7c5fb1d2260b19ed3c5b437d3bf7b66d3b2eeb1b668de3ad5f988567b6ddf4a0af33ac57d637bef10d1ff6d9e7b73b39dafeec6e8b76bcd6d3cc1acab716a659a06ac195b1b0d58ed31accb7a6bdfdd9e76e6b7fe8398d215761c1b61769c2a2a7785c7bb87f7cd696972b9208c9464c1524aa9408d7ab211c562891af4d6bd7a93812d30e85d2f8a23a7dee5307e9b84f1fa5e28993b469f3680dde6b4f45f286e981e51f68d0962ac56aa4d1790dda6fe7c11a19ae5661acc11d484471b7bd82c2ec7fc8673ae6be62f61933f548e330b5b57ae442ebab75b91e6cab7ae8e0b39377086cf65eb350b75ed83c30f28158abfdbdd205778cdca652ca1dd32d1d0fbe267f3e79f7c9b35a1c8fdd19f2824752155e9dd8e7c1dfd6cbb75863fed3d2b6d303826ab466019c3b76eb0b9689ffbc73e7eaaec7e769d67999ef0cd9b64374b11f0a99e19c75505fbede010000806cd870b5a79f7e5ad75e7bad1f9267554b1b376ed4d4a9537d986561537ad5d031c71ce3ef3e683d8eec2e7df69a0565168ab5648142aa01bd3d6c3a3d64b0617316705908617dc17ef0831ff83b195aafa873ce3927586bfbb090c43ec7ecd9b37d7f299bfef5af7fed3fd737bff94d1fba64cb3ee3bffddbbff9f3644331efbaeb2ebdf4d24bfafef7bfef876b66c39aa5db5d0b6da89d055ca94a370ba7ec18adb2cc82430bbc6c3f767edb933adff65dbffbeebb3eccb2f37decb1c7fa6bc02a9e2cb4b4a0cf02bef4eabaceb06bc82ad72c7cb2ebc8f6670dfcadefd99c3973fcf1b4c6cee179e79da7193366f83b6b5a2fb1f62abadada9fdd6db1adfda1e7841241447cd4b42f6ad5eae6e142d8bdb2cbeebb6bcaa78fd643f7fe51b19aad8a4712ca53bd62e1880a43114d28086bcf51f90a4537a96a6b81ea87eca837ca2bb5c5ba79856a559088e9d0b1514d1ab9ab56554575f2de09edfec91215bcb7528b5715e8b1251bf56e6d4c150df96a8885b5d3b8d17a76defdc111b46fcdda0a45b32827dcd642dd3af1342db9a5ac45afab56960777cadbaf9d3b005a33f3b3deba4d2f5fa564e3f160b9ac01f9edcd4392c675332d6fd1693ed39d07d3d76bffce84c9cfd56cb3a9bbfeb5f1d9321f63866d5980b7e2db9a1ccc25b5b1cf56ce73e367ca70be52da3c6fdb2cb780b15497ee937687c3d45d0f9373c97d05dfd7b6e72078ffdc4c9f2fb38cc7b1f8e6a039ff34ddf4627aefb2ece44522da716c53a3450000000c5ca93bc459efa9aeb22157c6aa802c48ea2d36cccb42140b5aac3ae6b6db6ef30157472b61de78e30d5fd564c1950547e9fdb8061afba96fe7c0c2ae3ffff9cf59075e402e6b0cb9be72fe2cbdf072f301551185545054a8da444ca1fa7a15c4126a8824140e859557204d70ff5e7c7adc280d0e6d52d1e802e557e7291cabd7c6cd355a9328d447b17c556c6ad0b8d810950fdaa0498346eac3cd15fa7ae9088d2baad5479bf3f4cc3b9bf4eed67cadaa8b684b34aea99f3c48f7dcf1f3e008da57e5f6b5b9ba692c37d0bd328464bd60e89062ed30b4f55b1003000060e0e88f2197b1a0ebe69b6fd6f5d75fefefa467c3dcac7753b67735b4f75f73cd353e20b35e57d3a64d0b5e1998962c59e2abc2ccef7fff7bedbaebae7e1add6fc18205baf0c20b75c51557f8618ae83d8dff5aecbfefdec15413bb6b425d5dada2755b1571d36125dc3f302115c5c22a8e4735cc1ad3d7c6f5ceea06fd65d946adae6dd0eaca6a85c2050a87f254b161b33eaeaed5d69a6a2daba9d1a27fd56a69455c735fdfacf57545da545bafb16346a83852a0b8afc68ae9807ddb2f7b4c37a838fb324ea0c316dfab4be74ed34d9fefbd80cb709d030000a0bfb3617bd693cbee58f7de7beff93e4ad9045cefbfffbeaf56b27e48d617c9eed6673daf06121b0678e69967fa617f3ffde94f75eeb9e7fa9e57d6b0df7a994d9c383158133dc5ae55eb2587ded5f82fc611879606774c4c7bb83f12f1b86f409f088515f3cdff22da212fa25df20a347170b1eae275aa2f1aa4b59ba5473faad39f360cd66f56156aeebf1af4f1967ad5e685f56e78abf2eb0bb5216ab7330d69614d582fae0e69abdcfbd66fd0fafab86add3e42a1840e3f349b01614df2dcb10c2a1eb825a8e8490b75ab0d319c75418787177627bbbeed3a07000000b02deb9d644dc2adefd3cf7ef6333f44cfee0c389058ff271ba465fda0ace798dd7d72faf4e97ae8a1876880be1d587fae458b16f96016bdab71b8a29972fc99dab0b1229833eea550ea65fb4b61955c610d0e47b5cfc8419a326194ea3755e85f9b6ad5503444f1d85abdb3b6461b43c355952854433ca231c38a55b3696372336e5779e1884f37c7e7c7b4ff983c556ca9d7a2aa2255c6dc5fcc11c57af1f1bff8bd75444334a6b5ebd28f1be88ab45e628d3dc47a8f553be6137201000020d05f872b02405735abfd3cebb3270753db4a05bf3684b14251bd53b141afad5ea7350d2155d6c5b5b521a11dc68ed74ebb4c5481622a8c6ed5b070bda2b55bdc7bfc7d1afd46e2eec91ac5afab973ea88a6b7d439e5f160ec575e6a9a7d85a1d660180f52c02bac721ba78c52a2db7472f075c765d13700100000000d0be66955cabd7acd3d1a77c319833e9955c4d1a42525e3caaa24483f2dceb0da1b01a14517db8c8ad1e5741bc41c5a1068d280a69435d485be2618543215f05669bf3356191420d8dc47c6557657d4c758aebf947efd7f81dd3ef74d8316bd757aaa1c1864402b92f3f3f4f63470f0fe600000080242ab90020b366955ce3761ca38bffe3abc15cebf262d6823e4f5b4245aa8c146b73a4505bf322ca4f6c55440d8a85dc6b91615a593f4c352a543ce4e3321bade8abb942e188e28a69733cac4d0d71b73ca66fcdf84a97022e3362d890c68a332097d9756cd7330000000000c8ce36b7aaf8f6f95fd70119eeb4d84c788bfb155eef1e51e525a22a8ed56b68439d0fb7ac4e2be29685eab7283fbad54ddb5d13a584fbd11e8ab8dd85437e3a1c6a504342aa778ffdf6d953977e73865faf2bacf265c4f0a1c11c90bbec3ab6eb19000000000064679b90cbfcf0bbffcfffc0b6918c991e2115b9371628a27c299ea758a240f5b62c1672f361c5dc2bf1489ea2e1b0e209b9b990c2a1e4aeac982b9e882b1acb57281e57a1dbcf0faebcdcbfd61d8a8b0a09ba90d3ecfab5eb180000000000642f63c8659555b7dcf0bd60aefbf8902c1e57dc8765364c31ae9baebfdaefaf3b0d2a2ed4c8114319ba889c62d7ab5db776fd0200000000808ec9187299138e3d5277fefc3a151414044b3ac9074dc9b4a931e072cf05f905ba73f6753ae15347fad7ba9b55c28c19359c215fc809769ddaf54a051700000000009dd36ac8652ce87ae037b7b5dfa32b10b2a6f2be7cca3d6c5ca263c314fda24472814d1eb0df243df0eb5b7b2ce04ab1e0c0ee4e37744871b004e87becfab4eb9440160000000080ce6b33e432fbedb3971efafd2f75f1795f0b9674cd45e77d5d7fbee72ebfdded6587a1833576cc088681a14fb1ebd1ae4bbb3e010000000040d78412d6282b4be56bd6ea77f73da43f3f3a5feb375424cbb26cf8a1bde8a6433e337373b6493f6f955d098d1a395c679e768abef28533356ec7b1b676af894663dab2b5565bb7d62b1a4bdef911d85ef2221115171768507191f2f222c152000000207b555555feb9acaccc3f77456969a97faeaeae564949899f06805cd5a1902bddb30b5ed68baf2ed61bcbded6f2951f6bc3c64ad5d54755949fa79123866bf7893be980497bebf04f4ed6d1471c16bcab6f696888ba636ef0cf0dd19862b16433fcce9d11a0890dd10d85c28a44c2cacf8bf8a1888505f90c49040000409711720140669d0eb90000000000db1f21170064d66e4f2e000000000000a0af23e402000000000040ce23e402000000000040ce23e402000000000040ce23e402000000000040ce23e402000000000040ce23e402000000000040ce23e402000000000040ce23e402000000000040ce23e402000000b08d442298e847fae36702003409259c601a000000c0005355272d5c2d2d2a9796ac97deaf90566c922a6ba54deeb5fe242f2c1544a47143a412f7d86ba4b4ef18a97447e9889da441f9c18a7d5c5555957f2e2b2bf3cf5d515a5aea9fababab555252e2a701205711720100000003d0732ba5bfbe2f3db15c7a6555b070003b649c74d227a4e97b4853770e16f651845c00901921170000003080fc7db974ff52e9e1b7a5f55b83856834bc48fac224f7d8573a7ed760611f43c8050099d1930b00000018003ea894ae7846faea23d29c3202aed6d830cd5f2e96ce7e48bad29daf8f927912002007107201000000fddcbcf7a46f3d2efde80569754db0106d5ab745bade9daff3e725cf1f00a0ef23e402000000fab15fbd267dfb6f04359d657dcb663d21fde6f5600100a0cf22e402000000faa9db174a573d23bd57112c40a7bcb541fa9fa7a43bdcf90400f45d845c000000403f64155c57ff435a551d2c4097d830cf6b9ea3a20b00fa32422e000000a09fb1a18937be286da0b97cb7b2a0eb86050cfd0480be8a900b000000e8473ea8906e7e455ab63e58806e6543176f7d95bb2e02405f44c805000000f42373caa4bf7d10cca0475833faff5d14cc0000fa0c422e000000a09f78eac3642f2ef4bcbb164b4fbaf30d00e83b08b9000000807ee20f4ba43535c10c7ad4ba2dd2fd4b831900409f40c805000000f403cf7e24fd71493083ede2fe65d2828f83190040af23e402000000fa81f9ef4b350dc10cb68bca5a692e775a04803e83900b000000c8717531e9efcb83196c578fbf2f6d215c04803e81900b000000c8712fac945e2d0f66b6b339e74b895992fbaf7553a48a2ba5a5a706f3d972eb27dcfb126e1f7dd5c2d5d23fff15cc00007a15211700000090e316af0e26fa99a507494f3d212d1bd589806c3b2a5b134c00007a15211700000090e3de5c174cf4235621367e8574fc4bd2be4fb8e983dcb2e0b5be66693f3cff00908b08b9000000801cf7d68660a21f59b6581af1fb60e625377d9d5b362598ef63ded9184c00007a15211700000090e3566d0e26bae8c959410face0d1d92182b3ce09b691a15757e36bc1a3c2cd6732eda8e6ebd9b62cec4a97de0f6c698b755beed7b4dcb7f5fa4a2deb4a95d8aaea600200d0ab08b9000000801c9648744fc86221d1713552e8bae0f19a34e9a0d643a8569d2add3851aa5ce1b6315b72ff351abfb77b6d48d33e2e73eb0c77eb360bd38226f5cd8ec53d9e722fddd84a18f55db77c41dabacb8adcba2d822e0bc4ecb8acc7576abdbbdd725bd655ab09b900a04f20e4020000007258282445e3c14c27590034a956baecce6081794cba7b83347cc7cc555119594075907b76ef6b1c6a9866b87ba4ef63b65b67997b9eb47372de3c79945bafe5b138c7cf4eae3bc31d6b334552f96bd2cc60d6dcbdc2fde1964f4b0d6f3cd5bd6f947bbf5bcf7a7ca5cc74fb78caedababb634041300805e45c805000000e4b0ba98549c17cc74d2d45152e59ae6555766e6c7ee8ff4b0a82d16709d200ddf20855a04542999f6516e21d3e0204873db98ecf6b7eced6dd7330bacf7586add340b1e0b2602b32b93cfe3c7249fe75888e6f673778bf5cc3cee8c0800fd06211700000090c30a23d288a260a633a648e3dd930d1b6cd6afca1e569595a5ef5ac095a1022b5d79103ea55b5e134c9831c96aaff256ee56b8cc8605bacf3a29399be4f669155ecdb8f7a7ef6ab7c1c10400a05f23e40200000072dc6e960c75910de54bf5aa6af9481fe29791856c5691956dd5576fa8c95c1d0600e83f08b9000000801cb7c7c860a2335e92caddd3f8ae0465b5d2b5b393fdad8e3ba10b772a0c2ab052c30c5b9a34c4fd91a972ab1dbe5a2cc33047e3b70900e81708b9000000801cb77f2ba150b6acd7950d57ec743815686c0e7f6527b7f592b4a8569ab477e640aab5de61ed490d73cc546566db0400f40f845c000000408e3bd49a6a75c1ccc5c90aaa19b35a844ba74a15e704d359daf78956b695a5e39f77ef2f926e6c7117c527ddc6ec0e90d766b86b637bec2e8e99aacc6c9be3dd720040ff40c805000000e4b84f964853dca3d35e92465c272db370a945e3f9073b1a2ad9b65e73cfc1b69eec688faed4b18c4a3b0ef738ae460acdee7c5f2dab32b3a0cbaacc52db1cffb6742d775704807e23947082690000000039ea8aa7a51f2d086690b539e74b33064b9775214033169a6d2f555555feb9acaccc3f77456969a97faeaeae56494957925200e87d547201000000fdc089bb4bc30a831964adb37dbe00007d0f2117000000d00f1c3b513a6b9f6006cd4d912a32f408eb4a9f2f0040df43c805000000f41367ef27950c0d66d0c4eedae89e9af51b738faef6f90200f42df4e402000000fa117a73f50e7a720140efa3920b000000e847ce3d483a69f7600600800184900b000000e847f61c295d7a98b4f7a86001000003042117000000d0cf9cfc09e93b874b6307070b0000180008b9000000807e6846a9f4fda309ba000003072117000000d04f5d708874fdb10c5d04000c0c845c000000403f66155d377d263984113d636841300100e855845c000000403f6701d72d274a571c29ed343458886ef319ee6609007d0221170000003000d85d17af3b56faed69c9eaaee145c10be8b253a89203803e81900b00000018408edf4d9a335d7af8f3c9caaec3770a5e408715e749ff758474fa5ec1020040af0a259c601a000000c000b3a5417aa55c7ad53dde5c2bbd57217d502955d6265fc3b6ac07d721e3a52fef2fcd2c0d166e47555555feb9acaccc3f77456969f203545757aba4a4c44f0340ae22e402000000801c42c8050099315c11000000000000398f900b000000e8468c93e8ff6a18c609007d12c315010000804ea8aa9316ae9616954b4bd64bef57482b36257b596d72afa1ffda7598b4ef18e9b43da5af1f2815e5052f6c270c570480cc08b9000000800e786ea5f4d7f7a527964bafac0a1662c0facee1d2359fdabe411721170064c67045000000200b7f5f2e9d37573af301e9472f107021e9a72f4abf793d980100f42a422e000000a00d1f544a573c237df511694e99b47e6bf0021078f4dd600200d0ab08b90000008056cc7b4ffad6e3c9caadd535c142a085a5eb82090040af22e40200000032f8d56bd2b7ff960cba80b67cb829980000f42a422e000000a085db174a573d23bd57112c0000007d1e211700000090c62ab8aefe87b4aa3a580000007202211700000010b0a18937be286da0b93c00003987900b000000703ea8906e7e455ab63e58000000720a2117000000e0cc2993fef64130030000720e211700000006bca73e4cf6e2020000b98b900b00000003de1f96486b6a82190000909308b900000030a03dfb91f4c725c10c0000c859845c00000018d0e6bf2fd534043300002067117201000060c0aa8b497f5f1ecc0000809c46c80500008001eb8595d2abe5c14c272cbd52aa3827986987ad9b383f9869cf14b7dd8eac9f8d53ddf6dc369f74db6ea627f6d51382e35cea3e4787049fbbb5cf37c72db7d7e704f30080dc45c805000080016bf1ea60a297cd3a27086266b96937bff404a9fc35297467f2f527ddc26cc3b40e7b491a719db46c542702a41ed29d9f77e941d2534ff4adcf0700e819845c00000018b0de5c174c6c07fb5ed7145aa5b380ebc621ee35f7fa656bdcf495d20237bdef63c10acef8a260a207edfb84dbcf417da3a2a9bb3eaf55698d5f211dff52eb9f6fa6fb4eecdccf0ce60100b98b900b00000003d65b1b82895e34a9b229fc9afdfb64e0b2ace590c2ed2155d1d51bfbee21cb16bbcfe4cea9d70f3f1f00a039422e0000000c58ab3607135d95ea6b957a04c30ed3b5d6bf6bd9f0b4f7d9e37c69f64bc9d752c31827b9e9e1139bd669b7da2ad5872af5c8703cadf5b8b27ddb70c1f4f7a48ec3f6eb5f4bdb766bc7e27b90a53dac17587b3dccb2fdbc8dc33b83476bdb9c7654f3f5ec3359d895cef7e44afbac0080dc45c80500008001299190565507335db1a3dbd651d2b5d725abb07c255691746316c189052c374e94ee4e7fefa8a6d0a5b1b2cb4d57ae685aa7ada1753e003ac8bdc77a7a05ebfb61906e59579d6507f57cd3769faa95665cd922840ac2b3491b9ad60b3d214d3e21195eb5259bcf3b7eefa6e19df6b8ccad678158b3b02e3886e36a9ad6b3c753ee251b0eda6e480800c849845c00000018904221291a0f66ba60789174f76cc9fdd7c8fa3f55bae533da6a74ee5e9b312ad9143d3dc4d9f735f7877befb429c9f90e71eff9eec4644094ded3cbc2a3bbbb6368e69a647fab94e3df4e3e4f4dfb9c4f1ee5ce49ad74597aff311b2a689fab1b0c778ff46ddb67b3506cd2cec97993f1189ce3dd9764ebce383f39df5df2f85505007d02ff1c0300006040aa8b49c579c14c576cc85059f592b4a8b679f0d2d21c7bcdad33afc5f0393d960c6226ef999ced8859ee3d16023d98ea439566e6c7c144172c7a379848592755baa7f1b65333c51d77913bfeb79b877e5ef0b9baaa72cdb6db2e77e7518383cab9b68ec15960615f6add6e32383f980000f42a422e0000000c48851169445130d305956d0d796c234cd9cdbd66155b367cae59df28f7686f585f6b260d717fd4764f9894c9f296819c9b2f0f26bd31c990ad27955baad6c2f29a60c204c750deca9d3397d9f7e5ce7b67cf712656cd0700e87d845c00000018b076ebe944a626733551a3f4be552d1e8d7705cc41ad054cfdd5aec382090040af22e4020000c080b5c7c860a20b865bf55406e38bdaaef2f2d547dd3c6caead2aa559ad047a8d430dbb436af8e298e46c3353dcf260b247b5750c4e4f54bbed3e22980000f42a422e0000000c58fbb7128474c8a80c77eb3b351934651a5a97e27b6415b5d39c3e4d6b615abad9c1fed21bc1a74cdb31984809861a66daae05749d126c33532fb254bfb06c65f3793372c7e0fba1ed9d39409ceabeaf4c7dbdba62bfeeb88e00005d46c80500008001ebd06e2a2d9a312b2d509922551ce49e3734bfc3e136dc6b4f5918e3d67dd2bd27ddd2f4ed3959374b77dbb4bb28b6dce69cf3a5c9c174babb57b83f46355ff749b793aef4abf2778774dbac382739ef9d2addb863b2c22a1b5d6d0e7ffcf36e5f456e9f2deea2e83f9b3be7d776f350d0c9e382090040af22e4020000c080f5c912698a7b7445e50ae9b235690de44f700bddb2d09dc9d7db72fcec6428759c7b4f7ae379b5b833e04cb7ad6516da04af6f533996c6d66db9cdb3aaa5116e9b2dcdfefdb6eb8e77eb59f8d6698fb9cffe9a347c62d336137bbb73e43e50b326f56de8c8e7cde825f779af73db1895760cee715c8d3b36771cdd59c565d7d021845c00d02784124e300d0000000c38573c2dfd684130839e63156e2748e5afb553e19663ae3852baeed860663ba9aaaaf2cf656565feb92b4a4b4bfd737575b54a4aba98f802402fa3920b00000003da89bb4bc30a8319f498544fae05fd28e01a3d483af913c10c00a0d7117201000060403b76a274d63ec10cbaccfa7f2d6dd9f8de7a72b9f3bcec356966b0a83ff8dcded2d11382190040af23e4020000c08077f67e52c9d060065d62778db4c6f7e9bdb0126efea927fad730c57143a4cf77a5433f00a0dbd1930b00000070e8cd858ee88d5e5c29f4e40280cca8e4020000009c730f924eda3d9801da307d0f6966321b0200f421845c00000080b3e748e9d2c3a4bd47050b800cec3ab9e8506937eba20f00e85308b90000008080dd29ef3b874b6307070b80343b0d95fe67aa740a775404803e89900b0000004833a354fafed1045d686ef420e9caa392c35a01007d132117000000d0c2058748d71fcbd04524ed3746fac971eeba981c2c0000f449845c000000400656d175d3679243183170d9cd087e7a3c155c00900b08b9000000805658c075cb89d2154726fb3161e0183724f9bddf710a3db80020571072010000006db0bbe95d77acf4dbd392d55dc38b8217d02f0d2990ce3b58fac319c9ef9dbb280240ee08259c601a000000403bfef191f4b70fa4a73e945efc57b01039ef9325d267764b56ef1d3d2158d847555555f9e7b2b232ffdc15a5a5a5feb9baba5a2525ee2400400e23e4020000003a614b83f44ab9f4aa7bbcb9567aaf42faa052aaac4dbe86be292f9c1c7a5ae21efb8c92f61f231d3c4e3a7267a92012acd4c71172014066845c00000000904308b90020337a7201000000000020e7117201000000000020e7117201000000000020e7117201000000000020e7117201000000000020c749ff1f459dbbefa08585760000000049454e44ae426082, 20000, '2023-05-11 13:21:07', '2024-04-23 10:36:11'),
(36, 1, 'áo khác nam', 1233, 'áo khác dành cho nam', 0x52494646c60400005745425056503820ba040000b016009d012a6400640000000025a4035a34829befe67f8b5fa9fd51dea07eaaf268650fcc7f14bf663fe8743bb4fff32fc45fc88cc79fd3bf2175897f14fe7ff87fb401fc17f8fff6efc61fee9f213fb2fe2cff00fffff0f3e79ff21f933f40ffc7bf987f6bfc87fef5ffbbc27fa0a7eaaaa1f2d7a6635fe79f31de32aa4f3560c1251cf2cca92c7192a9ff1438a393d8e308f3c3e24a6a4d976f6eae204f0a25910a784aaadc29e128fa4d3cff1ffe552e72bf4ac5f01897b6bd3e618000feffd99497f749fa9fca002effffd0558d9f3428c3669b7682329b8c68adc07c04f94e9bafe401ab5c6cfdce2f41804f2abd2f6519fca73137c228dc3f5807f6289ffff732684fbd53e100a59007a3e0f85ed4ebc6c59b2fd21ab92636b0cfe96db11c0229e04de8610197f37c50d6ba9bf4f35018d8013ffff13144b8dbcadc61a5a9696265deaa042f1cd03f566c482a0907fffc70851f6cb3e2f56eb4cc954de971554f201fea67f9643fa005ef4cf5e792d5998c2856c6a86d0258bc66a199ae918dadd02d3782f866091a84676742c2699284c1c693a39dfb8a2c8448a0f9ce1fd9542a1245656e1fc570537b1d31f47ad778540f25f15f5a0dd15c1e5d8b91e4012418ebff9733015a45376fed147d38833a52a379fa65b2e5d5f832b143745de65d62e38581fe6e494630d81cdd4a05daeba55cb2e3df8303c6034e11b43d16736c5fea9f1765c8acdcfa502010979aa2b0edfa2b68b360a4698d61e96fb7273aef3babb04fbbf342b4bd19702db0ef910ea53e177d889a7b8a49d22a9192c756c1823a965b746f06996f8b721c051688bcbc2933f892c58b6b0892e5dedb91f84d4d797162350e97d48b0b53296d8ffe5a065f4f7801a585b91ad0fec8648a1d0137e18f276c36503907c889a5520a2c0cdfcca734261d2020067ecf051e76f33d3a717ad6660e35466d39d0c13551e6b8e19b1f047849dfa0672263d01a1727cab54379e19a30e1dfab78923982c4fcc25e484c09a92fa1b98f51cf6a4009d02ff536466bdb8010886bdd22cf5554398a7701d5173eb505c2d73bf5b11ea9b1e4575a1d128053b2e06408576b6ad48776f59a10b6bff3e82626f8b8071140269f140682acd6d76825fd295fe947972534d73bde4a59e95262e56fbccb203e20ec625fe8fb4675c0957dc6627e93c89f5ee5279e5d65a98fd1d45730ce9e2d5ee2f37e90bf900648bd04939d67741681c962b7a23f9f4efab4599b208d8bf61011950416f3b00e75bf91582bb9a15099e936d02ba15349f911dfe6821bd86424fc6868274e5ca54d40438e5fb9787f9ddd67cc0b428a3a48f04e285904604e65813b32e96aeea3f54bc03de1d4f5df263970516fea2ec7ce675be576ef691482d58d5e4090587df6a3fc843f9089b27a7bc50ee3ab92babc3117f071ba8cd3823dd99b7ff98889aee41b3d4022ac1ed02fcb29c8e3485585976e9d04f2538134effb43bfa6b01e294211f4a144ad988e8fd0bac74554fbf40f97a97686a53c4c7093990207c3ea011dc5557d5206e8dd1375093950fffeca7e394e20d2f05561ead772e655a4aeffffe451afffaf7f849580d9bfd49006bc1bb7c3c31f6bb26dec84561300deeb7e17922d31bf38b0bc2603cf2d0d4a6d13be9c2b7efffcf054f45c24b1860bf3e77ccb2ffc3d59978274980000000000, 100000, '2024-04-23 10:35:50', '2024-04-23 10:35:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20230406063434-create-user.js'),
('20230406065228-create-category.js'),
('20230406065900-create-product.js'),
('20230406070107-create-order.js'),
('20230406070340-create-order-detail.js'),
('20230406070526-create-product-comment.js'),
('20230406070906-create-favorite-list.js'),
('20230421072003-create-cart.js'),
('20230428025819-update-column-orderId.js');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `role` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `address`, `phoneNumber`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'Admin', 'Vo', 'admin@gmail.com', '$2y$10$oaTmmn.3RssRqxZNYmapWO2wgacMTPUdYBLuM8wDvK6bTLFRHDIOy', 'HCM', '01232132323', 1, '2023-04-14 02:58:28', '2023-04-14 02:58:28');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `favoritelists`
--
ALTER TABLE `favoritelists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `orderId` (`orderId`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Chỉ mục cho bảng `productcomments`
--
ALTER TABLE `productcomments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`);

--
-- Chỉ mục cho bảng `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `favoritelists`
--
ALTER TABLE `favoritelists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `productcomments`
--
ALTER TABLE `productcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `favoritelists`
--
ALTER TABLE `favoritelists`
  ADD CONSTRAINT `favoritelists_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favoritelists_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `orderdetails_ibfk_3` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `productcomments`
--
ALTER TABLE `productcomments`
  ADD CONSTRAINT `productcomments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `productcomments_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
