/*
 Navicat Premium Data Transfer

 Source Server         : 7.181_cjbgd2021
 Source Server Type    : Oracle
 Source Server Version : 110200
 Source Host           : 192.168.7.181:1521
 Source Schema         : CJBGD_HL

 Target Server Type    : Oracle
 Target Server Version : 110200
 File Encoding         : 65001

 Date: 13/05/2022 09:22:52
*/


-- ----------------------------
-- Table structure for C_BGD_GFJC_TJ
-- ----------------------------
DROP TABLE "CJBGD_HL"."C_BGD_GFJC_TJ";
CREATE TABLE "CJBGD_HL"."C_BGD_GFJC_TJ" (
  "ORG_NO" VARCHAR2(16 BYTE) NOT NULL,
  "TQSL" VARCHAR2(16 BYTE),
  "YHSL" VARCHAR2(16 BYTE),
  "KGDZ" VARCHAR2(16 BYTE),
  "CNDZ" VARCHAR2(16 BYTE),
  "ORG_NAME" VARCHAR2(16 BYTE),
  "GFTDJC" VARCHAR2(16 BYTE),
  "SYB" VARCHAR2(16 BYTE),
  "NBFZ" VARCHAR2(16 BYTE),
  "NBJH" VARCHAR2(16 BYTE),
  "TDSL" VARCHAR2(16 BYTE),
  "TDWTSL" VARCHAR2(16 BYTE),
  "TDYTSL" VARCHAR2(16 BYTE),
  "XBGJ" VARCHAR2(16 BYTE),
  "BHXH" VARCHAR2(16 BYTE),
  "YCSL" VARCHAR2(16 BYTE),
  "GDYHS" VARCHAR2(16 BYTE),
  "WW" VARCHAR2(16 BYTE)
)
LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536 
  NEXT 8192 
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."ORG_NO" IS '地区编号';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."TQSL" IS '台区数量';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."YHSL" IS '用户数量';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."KGDZ" IS '开关动作';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."CNDZ" IS '储能动作';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."ORG_NAME" IS '地区名称';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."GFTDJC" IS '光伏停电监测（安措巡检、防孤岛）';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."SYB" IS '升压变';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."NBFZ" IS '逆变辅助';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."NBJH" IS '逆变交互';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."TDSL" IS '停电数量';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."TDWTSL" IS '停电未跳数量';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."TDYTSL" IS '停电已跳数量';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."XBGJ" IS '谐波告警';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."BHXH" IS '保护信号';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."YCSL" IS '异常告警';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."GDYHS" IS '过电压';
COMMENT ON COLUMN "CJBGD_HL"."C_BGD_GFJC_TJ"."WW" IS '微网';

-- ----------------------------
-- Records of C_BGD_GFJC_TJ
-- ----------------------------
INSERT INTO "CJBGD_HL"."C_BGD_GFJC_TJ" VALUES ('3740724', '223', NULL, '1', '0', '诸城县', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL);
INSERT INTO "CJBGD_HL"."C_BGD_GFJC_TJ" VALUES ('37403', '5833', '22651', '0', '0', '淄博市', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', NULL, NULL);
INSERT INTO "CJBGD_HL"."C_BGD_GFJC_TJ" VALUES ('3741327', '2306', '10070', '0', '1', '蒙阴县', '0', '1', '0', '39', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO "CJBGD_HL"."C_BGD_GFJC_TJ" VALUES ('37401', NULL, NULL, NULL, '0', '济南市', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO "CJBGD_HL"."C_BGD_GFJC_TJ" VALUES ('37101', NULL, NULL, '0', NULL, '山东省', '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '2');
INSERT INTO "CJBGD_HL"."C_BGD_GFJC_TJ" VALUES ('37413', NULL, NULL, '0', NULL, '临沂市', '0', NULL, '0', NULL, '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO "CJBGD_HL"."C_BGD_GFJC_TJ" VALUES ('37404', NULL, NULL, '0', '0', '枣庄市', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');