CREATE TABLE `tb_authorities` (
  `AUTH_IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `USER_ID` varchar(45) DEFAULT NULL COMMENT '사용자 아이디',
  `AUTHORITY` varchar(45) DEFAULT NULL COMMENT '권한',
  PRIMARY KEY (`AUTH_IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='권한테이블'


CREATE TABLE `tb_code` (
  `CODE_IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `CODE_NO` varchar(45) NOT NULL COMMENT '코드번호',
  `CODE_NAME` varchar(45) DEFAULT NULL,
  `CODE_EXP` varchar(45) DEFAULT NULL COMMENT '코드명',
  PRIMARY KEY (`CODE_IDX`,`CODE_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='코드 테이블'


CREATE TABLE `tb_grp_code` (
  `GRP_CODE_IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `GRP_CD_NO` varchar(20) DEFAULT NULL COMMENT '그룹코드 번호',
  `GRP_CD_EXP` varchar(45) DEFAULT NULL COMMENT '그룹 코드명',
  PRIMARY KEY (`GRP_CODE_IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='코드 그룹 테이블'

CREATE TABLE `tb_users` (
  `USER_IDX` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `USER_ID` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '사용자 아이디',
  `PASSWORD` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '패스워드',
  `USER_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '사용자 이름',
  `EMAIL` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '이메일',
  `HAND_PHONE_NO` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '핸드폰번호',
  `USE_YN` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '사용여부',
  PRIMARY KEY (`USER_IDX`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8