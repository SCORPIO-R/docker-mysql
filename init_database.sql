-- 建库
CREATE DATABASE IF NOT EXISTS my_db default character set utf8 collate utf8_general_ci;

-- 切换数据库
use my_db;

ALTER USER 'root' IDENTIFIED WITH mysql_native_password BY '123456';

CREATE TABLE `m_activity_category` (
  `activity_category_large_code` varchar(2) NOT NULL COMMENT '大カテゴリコード',
  `activity_category_large_name` varchar(30) DEFAULT NULL,
  `activity_category_mid_code` varchar(2) NOT NULL,
  `activity_category_mid_name` varchar(30) DEFAULT NULL,
  `activity_category_small_code` varchar(2) NOT NULL,
  `activity_category_small_name` varchar(30) DEFAULT NULL,
  `activity_response_rate_flag` bit(1) DEFAULT NULL COMMENT '活動反応度処理フラグ',
  `valid_start_date` date NOT NULL DEFAULT '1900-01-01' COMMENT '適用開始日',
  `valid_end_date` date DEFAULT NULL COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`activity_category_large_code`,`activity_category_mid_code`,`activity_category_small_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_活動カテゴリ';
CREATE TABLE `m_alert_template` (
  `alert_scenario_code` varchar(2) NOT NULL,
  `alert_template_code` varchar(2) NOT NULL,
  `alert_type_class` varchar(2) NOT NULL,
  `alert_scenario_name` varchar(50) DEFAULT NULL,
  `alert_template_text` varchar(500) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`alert_scenario_code`,`alert_template_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_アラートテンプレート';
CREATE TABLE `m_amn_content` (
  `amn_content_id` varchar(13) NOT NULL,
  `record_class` smallint(2) unsigned NOT NULL,
  `del_flag` bit(1) DEFAULT b'0',
  `content_name` varchar(300) DEFAULT NULL,
  `recommend_name` varchar(300) DEFAULT NULL,
  `recommend_description` varchar(300) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`amn_content_id`,`record_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_AMNコンテンツ';
CREATE TABLE `m_amn_login_class` (
  `login_class` varchar(10) NOT NULL,
  `login_class_name` varchar(30) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`login_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_AMNログイン種別';
CREATE TABLE `m_amn_member` (
  `amn_member_code` int(10) unsigned NOT NULL,
  `customer_code` varchar(7) DEFAULT NULL,
  `facility_code` varchar(7) DEFAULT NULL,
  `amn_menber_id` varchar(100) DEFAULT NULL,
  `del_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`amn_member_code`),
  KEY `idx01_m_amn_member` (`customer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_AMN会員';
CREATE TABLE `m_aolkol` (
  `facility_code` varchar(7) NOT NULL,
  `customer_code` varchar(7) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `product_group_code` varchar(4) NOT NULL,
  `aol_flag` bit(1) DEFAULT b'0',
  `kol_flag` bit(1) DEFAULT b'0',
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`facility_code`,`customer_code`,`united_product_group_code`,`product_group_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_AOLKOL';
CREATE TABLE `m_api_medical_subject` (
  `api_medical_subject_code` varchar(2) NOT NULL,
  `api_medical_subject_name` varchar(50) DEFAULT NULL,
  `api_medical_subject_name_kana` varchar(30) DEFAULT NULL COMMENT 'API診療科目名称(カナ)',
  `api_medical_subject_display_order` smallint(2) DEFAULT NULL COMMENT 'API診療科目表示順',
  `valid_start_date` date NOT NULL COMMENT '適用開始日',
  `valid_end_date` date DEFAULT NULL COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`api_medical_subject_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_API診療科目';
CREATE TABLE `m_calendar` (
  `calendar_class` varchar(4) NOT NULL COMMENT 'カレンダー種類コード',
  `calendar_date` date NOT NULL COMMENT 'カレンダー年月日',
  `calendar_business_date_flag` bit(1) DEFAULT b'0',
  `calendar_weekday` varchar(1) DEFAULT NULL COMMENT 'カレンダー曜日',
  `holiday_flag` bit(1) DEFAULT b'0',
  `company_off_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`calendar_class`,`calendar_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_カレンダー';
CREATE TABLE `m_clm_material` (
  `material_code` varchar(30) NOT NULL COMMENT '資材コード',
  `material_revision_no` smallint(6) NOT NULL COMMENT '資材リビジョン番号',
  `material_management_code` varchar(30) DEFAULT NULL COMMENT '資材管理コード',
  `registration_datetime` datetime DEFAULT NULL COMMENT '登録日時',
  `account_code` varchar(8) DEFAULT NULL COMMENT '登録アカウントID',
  `material_name` varchar(250) DEFAULT NULL COMMENT '資材名称',
  `material_class` varchar(1) DEFAULT NULL COMMENT '資材種別コード',
  `planned_open_date` date DEFAULT NULL COMMENT '公開予定年月日',
  `open_material_storage_path` varchar(500) DEFAULT NULL COMMENT '公開資材格納パス',
  `open_material_file_name` varchar(500) DEFAULT NULL COMMENT '公開資材ファイル名称',
  `main_page_number` smallint(6) DEFAULT NULL COMMENT '代表ページ番号',
  `suspended_date` date DEFAULT NULL COMMENT '使用中止年月日',
  `material_description` varchar(500) DEFAULT NULL COMMENT '資材説明',
  `clm_recommend_start_date` date DEFAULT NULL COMMENT 'CLMリコメンド開始年月日',
  `clm_recommend_end_date` date DEFAULT NULL COMMENT 'CLMリコメンド終了年月日',
  `clm_recommend_type_code` varchar(1) DEFAULT NULL COMMENT 'CLMリコメンド種別コード',
  `clm_file_size` int(11) DEFAULT NULL COMMENT '資材ファイルサイズ',
  `clm_file_info` varchar(128) DEFAULT NULL COMMENT '資材ファイル情報',
  `minimum_update_flag` bit(1) DEFAULT NULL COMMENT 'ミニマム更新対象フラグ',
  `material_keyword` varchar(500) DEFAULT NULL COMMENT '資材キーワード',
  `material_contents_file_key` varchar(128) DEFAULT NULL COMMENT '資材コンテンツファイルキー',
  `material_thumbnail_file_key` varchar(128) DEFAULT NULL COMMENT '資材サムネイルファイルキー',
  `cover_material_code` varchar(30) DEFAULT NULL COMMENT '表紙資材CD',
  `di_material_flag` bit(1) DEFAULT NULL COMMENT 'DI資材フラグ',
  `cover_material_flag` bit(1) DEFAULT NULL COMMENT '表紙資材フラグ',
  `clm_url` varchar(250) DEFAULT NULL COMMENT 'CLM_URL',
  `clm_material_updated_date` datetime DEFAULT NULL COMMENT 'CLM資材更新日時',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`material_code`,`material_revision_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_CLM資材';
CREATE TABLE `m_common_name` (
  `common_type_code` varchar(16) NOT NULL COMMENT '汎用区分',
  `common_type_name` varchar(256) DEFAULT NULL COMMENT '汎用区分名称',
  `common_name_code` varchar(16) NOT NULL COMMENT '汎用コード',
  `common_name` varchar(256) DEFAULT NULL COMMENT '汎用名称',
  `common_name_kana` varchar(100) DEFAULT NULL COMMENT '汎用名称（カナ）',
  `common_name_english` varchar(256) DEFAULT NULL COMMENT '汎用名称（英語）',
  `common_short_name` varchar(256) DEFAULT NULL COMMENT '汎用略称',
  `common_short_name_kana` varchar(100) DEFAULT NULL COMMENT '汎用略称（カナ）',
  `common_short_name_english` varchar(256) DEFAULT NULL COMMENT '汎用略称（英語）',
  `common_char1` varchar(256) DEFAULT NULL COMMENT '汎用文字1',
  `common_char2` varchar(256) DEFAULT NULL COMMENT '汎用文字2',
  `common_char3` varchar(256) DEFAULT NULL COMMENT '汎用文字3',
  `common_num1` smallint(3) DEFAULT NULL COMMENT '汎用数値1',
  `common_num2` smallint(3) DEFAULT NULL COMMENT '汎用数値2',
  `common_num3` smallint(3) DEFAULT NULL COMMENT '汎用数値3',
  `del_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`common_type_code`,`common_name_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_汎用名称';
CREATE TABLE `m_conference` (
  `data_code` varchar(12) NOT NULL COMMENT 'データID',
  `event_code` varchar(12) DEFAULT NULL COMMENT '演題ID',
  `conference_name` varchar(255) DEFAULT NULL COMMENT '学会名称',
  `conference_code` varchar(8) DEFAULT NULL COMMENT '学会ID',
  `conference_class` varchar(255) DEFAULT NULL COMMENT '区分',
  `session_name` varchar(255) DEFAULT NULL COMMENT 'セッション名称',
  `conference_role` varchar(100) DEFAULT NULL COMMENT '役割',
  `event_name` varchar(255) DEFAULT NULL COMMENT '演題名称',
  `facility_code` varchar(7) DEFAULT NULL COMMENT '施設コード',
  `customer_code` varchar(7) DEFAULT NULL COMMENT '顧客コード',
  `dcf_facility_code` varchar(100) DEFAULT NULL COMMENT 'ULT施設コード',
  `dcf_personal_code` varchar(6) DEFAULT NULL COMMENT 'ULT個人コード',
  `area_name` varchar(100) DEFAULT NULL COMMENT '領域名称',
  `conference_title_name` varchar(200) DEFAULT NULL COMMENT '肩書',
  `coresponsor_flag` bit(1) DEFAULT NULL COMMENT '共催フラグ',
  `enterprise_name` varchar(100) DEFAULT NULL COMMENT '企業名称',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`data_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_学会演題';
CREATE TABLE `m_constructuration_dictionary` (
  `constructuration_dictionary_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facet_code` varchar(8) DEFAULT NULL COMMENT 'ファセットコード',
  `formal` varchar(50) DEFAULT NULL COMMENT 'フォーマル',
  `synonym_word` varchar(30) DEFAULT NULL COMMENT 'シノニム',
  `combination_type` varchar(5) DEFAULT NULL COMMENT 'コンビネーション',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`constructuration_dictionary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73926 DEFAULT CHARSET=utf8mb4 COMMENT='m_構造化辞書';
CREATE TABLE `m_customer` (
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `dcf_personal_code` varchar(8) DEFAULT NULL COMMENT 'ULT個人コード',
  `customer_full_name` varchar(50) DEFAULT NULL COMMENT '顧客ラストネーム＋顧客ファーストネーム',
  `customer_full_name_kana` varchar(25) DEFAULT NULL COMMENT '顧客ラストネーム(カナ)＋顧客ファーストネーム(カナ)',
  `customer_full_name_english` varchar(25) DEFAULT NULL COMMENT '顧客名称(英)',
  `customer_last_name` varchar(25) DEFAULT NULL,
  `customer_last_name_kana` varchar(25) DEFAULT NULL COMMENT '顧客ファーストネーム(カナ)',
  `customer_first_name` varchar(25) DEFAULT NULL COMMENT '顧客ファーストネーム',
  `customer_first_name_kana` varchar(50) DEFAULT NULL COMMENT '顧客ファーストネーム(カナ)',
  `customer_job_class` varchar(2) DEFAULT NULL COMMENT '医師薬剤師区分',
  `alma_mater_code` varchar(8) DEFAULT NULL,
  `graduation_year` varchar(4) DEFAULT NULL COMMENT '卒業年',
  `first_medical_office` varchar(7) DEFAULT NULL COMMENT '入局医局コード',
  `practice_facility_code` varchar(7) DEFAULT NULL COMMENT '臨床研修施設コード',
  `valid_start_date` date NOT NULL COMMENT '適用開始日',
  `valid_end_date` date DEFAULT NULL COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`customer_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_顧客';
CREATE TABLE `m_customer_current` (
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `dcf_personal_code` varchar(8) DEFAULT NULL COMMENT 'ULT個人コード',
  `customer_full_name` varchar(50) DEFAULT NULL COMMENT '顧客ラストネーム＋顧客ファーストネーム',
  `customer_full_name_kana` varchar(25) DEFAULT NULL COMMENT '顧客ラストネーム(カナ)＋顧客ファーストネーム(カナ)',
  `customer_full_name_english` varchar(25) DEFAULT NULL COMMENT '顧客名称(英)',
  `customer_last_name` varchar(25) DEFAULT NULL COMMENT '顧客ラストネーム',
  `customer_last_name_kana` varchar(25) DEFAULT NULL COMMENT '顧客ファーストネーム(カナ)',
  `customer_first_name` varchar(25) DEFAULT NULL COMMENT '顧客ファーストネーム',
  `customer_first_name_kana` varchar(50) DEFAULT NULL COMMENT '顧客ファーストネーム(カナ)',
  `customer_job_class` varchar(2) DEFAULT NULL COMMENT '医師薬剤師区分',
  `alma_mater_code` varchar(8) DEFAULT NULL COMMENT '卒校コード',
  `graduation_year` varchar(4) DEFAULT NULL COMMENT '卒業年',
  `first_medical_office` varchar(7) DEFAULT NULL COMMENT '入局医局コード',
  `practice_facility_code` varchar(7) DEFAULT NULL COMMENT '臨床研修施設コード',
  `valid_start_date` date NOT NULL COMMENT '適用開始日',
  `valid_end_date` date DEFAULT NULL COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`customer_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_顧客_直近履歴';
CREATE TABLE `m_customer_feature_amount` (
  `customer_feature_amount_code` varchar(2) NOT NULL COMMENT '顧客特徴量コード',
  `customer_feature_amount_name` varchar(100) DEFAULT NULL COMMENT '顧客特徴量名称',
  `diagnosis_code` varchar(2) DEFAULT NULL COMMENT '領域コード',
  `editable_flag` bit(1) DEFAULT b'0',
  `customer_feature_amount_display_order` smallint(2) DEFAULT NULL COMMENT '顧客特徴量表示順',
  `option_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  `customer_feature_amount_name_jp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`customer_feature_amount_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_顧客特徴量';
CREATE TABLE `m_customer_feature_amount_option` (
  `customer_feature_amount_code` varchar(2) NOT NULL COMMENT '顧客特徴量コード',
  `customer_feature_amount_option_code` varchar(2) NOT NULL COMMENT '顧客特徴量パラメータコード',
  `customer_feature_amount_option_desc` varchar(100) DEFAULT NULL COMMENT '顧客特徴量パラメータ説明',
  `customer_feature_amount_option_display_flag` bit(1) DEFAULT b'0',
  `customer_feature_amount_option_display_order` smallint(2) DEFAULT NULL COMMENT '顧客特徴量パラメータ表示順',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`customer_feature_amount_code`,`customer_feature_amount_option_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_顧客特徴量パラメータ';
CREATE TABLE `m_ddd_market` (
  `ddd_market_code` varchar(3) NOT NULL COMMENT '集計項目コード',
  `ddd_market_name` varchar(30) DEFAULT NULL COMMENT '集計項目名称',
  `united_product_group_code` varchar(4) NOT NULL COMMENT '統一品目グループコード',
  `ddd_market_display_order` smallint(3) DEFAULT NULL COMMENT '表示順',
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ddd_market_code`,`united_product_group_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_DDD市場';

CREATE TABLE `m_ddd_product` (
  `ddd_market_code` varchar(3) NOT NULL,
  `ddd_product_code` varchar(3) NOT NULL,
  `ddd_product_name` varchar(50) DEFAULT NULL COMMENT '明細項目名称',
  `display_flag` bit(1) DEFAULT b'0',
  `valid_start_date` date NOT NULL COMMENT '適用開始日',
  `valid_end_date` date DEFAULT NULL COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`ddd_market_code`,`ddd_product_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_DDD製品';

CREATE TABLE `m_decrepancy_pattern` (
  `decrepancy_pattern_id` varchar(4) NOT NULL,
  `customer_feature_amount_code` varchar(2) DEFAULT NULL,
  `keywords` varchar(50) DEFAULT NULL,
  `combination_rule_1` varchar(50) DEFAULT NULL,
  `combination_rule_2` varchar(50) DEFAULT NULL,
  `applicable_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`decrepancy_pattern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_係り受けパターン';

CREATE TABLE `m_employee_grade` (
  `employee_grade_class` varchar(3) NOT NULL,
  `employee_grade_name` varchar(30) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`employee_grade_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_従業員グレード';

CREATE TABLE `m_facility` (
  `facility_code` varchar(7) NOT NULL,
  `facility_name` varchar(40) DEFAULT NULL,
  `facility_name_kana` varchar(40) DEFAULT NULL,
  `facility_short_name` varchar(40) DEFAULT NULL,
  `dcf_facility_code` varchar(9) DEFAULT NULL,
  `jis_prefecture_code` varchar(2) DEFAULT NULL,
  `jis_city_code` varchar(5) DEFAULT NULL,
  `facility_address` varchar(75) DEFAULT NULL,
  `facility_class` varchar(2) DEFAULT NULL,
  `latitude` decimal(12,8) DEFAULT NULL,
  `longitude` decimal(12,8) DEFAULT NULL,
  `user_segment_code` varchar(5) DEFAULT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`facility_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_施設';

CREATE TABLE `m_facility_additional_info` (
  `facility_code` varchar(7) NOT NULL,
  `is_homecare_facility` bit(1) DEFAULT b'0',
  `is_dialysis_facility` bit(1) DEFAULT b'0',
  `is_pci_facility` bit(1) DEFAULT b'0',
  `is_rehabilitation_apply` bit(1) DEFAULT b'0',
  `is_self_leading_urination_facility` bit(1) DEFAULT b'0',
  `is_ct_facility` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`facility_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_施設追加情報';

CREATE TABLE `m_facility_current` (
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `facility_name` varchar(40) DEFAULT NULL COMMENT '施設自社名称',
  `facility_name_kana` varchar(40) DEFAULT NULL COMMENT '施設自社名称(カナ)',
  `facility_short_name` varchar(40) DEFAULT NULL COMMENT '施設自社略称',
  `dcf_facility_code` varchar(9) DEFAULT NULL COMMENT 'ULT施設コード',
  `jis_prefecture_code` varchar(2) DEFAULT NULL COMMENT '都道府県コード',
  `jis_city_code` varchar(5) DEFAULT NULL COMMENT '市町村コード',
  `facility_address` varchar(75) DEFAULT NULL COMMENT '施設住所',
  `facility_class` varchar(2) DEFAULT NULL COMMENT 'ユーザ施設種別コード',
  `latitude` decimal(12,8) DEFAULT NULL COMMENT '緯度',
  `longitude` decimal(12,8) DEFAULT NULL COMMENT '経度',
  `user_segment_code` varchar(5) DEFAULT NULL COMMENT 'セグメントコード',
  `valid_start_date` date NOT NULL COMMENT '適用開始日',
  `valid_end_date` date DEFAULT NULL COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`facility_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_施設_直近履歴';

CREATE TABLE `m_facility_group` (
  `facility_group_code` varchar(5) NOT NULL,
  `facility_group_name` varchar(100) DEFAULT NULL,
  `facility_group_display_order` smallint(3) DEFAULT NULL,
  `facility_group_rep_flag` bit(1) DEFAULT b'0',
  `facility_group_rep_code` varchar(5) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`facility_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_施設グループ基本';

CREATE TABLE `m_gvp_case` (
  `gvp_case_code` varchar(5) NOT NULL COMMENT '実施コード',
  `gvp_type_code` varchar(2) DEFAULT NULL COMMENT 'システムID',
  `gvp_case_name` varchar(128) DEFAULT NULL COMMENT '実施名称',
  `gvp_case_name_sub` varchar(128) DEFAULT NULL COMMENT '実施サブ名称',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `united_product_group_code` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード',
  `case_start_date` date DEFAULT NULL COMMENT '案件実施期間開始日',
  `case_end_date` date DEFAULT NULL COMMENT '案件実施期間終了日',
  `call_number` smallint(6) NOT NULL COMMENT '訪問回ナンバー',
  `gvp_start_date` date DEFAULT NULL COMMENT '開始日時',
  `gvp_end_date` date DEFAULT NULL COMMENT '終了日',
  `alert_display_date_1` date DEFAULT NULL COMMENT 'アラート表示日1',
  `alert_display_date_2` date DEFAULT NULL COMMENT 'アラート表示日2',
  `alert_display_date_3` date DEFAULT NULL COMMENT 'アラート表示日3',
  `detail_actual_date` date DEFAULT NULL COMMENT '実施日',
  `display_order` smallint(6) DEFAULT NULL COMMENT '実施表示順',
  `gvp_case_class_code` smallint(6) DEFAULT NULL COMMENT '実施案件区分',
  `gvp_detail_class_code` smallint(6) DEFAULT NULL COMMENT '実施方法区分',
  `max_call_num` smallint(6) DEFAULT NULL COMMENT '最高訪問回数',
  `date_num_nearest_deadline` smallint(6) DEFAULT NULL COMMENT '期限間近日数',
  `base_date_num_2_weeks` smallint(6) DEFAULT NULL COMMENT '2週間基準日数',
  `base_date_num_1_month` smallint(6) DEFAULT NULL COMMENT '1ヶ月基準日数',
  `base_date_num_last_2_weeks` smallint(6) DEFAULT NULL COMMENT '最終2週間基準日数',
  `base_date_num_last_1_month` smallint(6) DEFAULT NULL COMMENT '最終1ヶ月基準日数',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`gvp_case_code`,`facility_code`,`call_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_GVP案件';

CREATE TABLE `m_jis_city` (
  `jis_city_code` varchar(5) NOT NULL,
  `prefecture_name` varchar(10) DEFAULT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  `county_name` varchar(50) DEFAULT NULL,
  `jis_prefecture_code` varchar(2) DEFAULT NULL,
  `jis_county_code` varchar(5) DEFAULT NULL,
  `medical_area_code` varchar(5) DEFAULT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`jis_city_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_JIS市町村';

CREATE TABLE `m_jis_prefecture` (
  `jis_prefecture_code` varchar(2) NOT NULL COMMENT '都道府県コード',
  `prefecture_name` varchar(10) DEFAULT NULL COMMENT '都道府県名称',
  `prefecture_name_kana` varchar(15) DEFAULT NULL COMMENT '都道府県名称(カナ)',
  `prefecture_name_eng` varchar(30) DEFAULT NULL COMMENT '都道府県名称(英)',
  `ult_prefecture_code` varchar(2) DEFAULT NULL COMMENT 'ULT県コード',
  `del_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`jis_prefecture_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_JIS都道府県';

CREATE TABLE `m_job_ctrl` (
  `job_code` varchar(10) NOT NULL COMMENT 'ジョブコード',
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `batch_status_class` varchar(1) DEFAULT NULL,
  `job_class` varchar(1) DEFAULT NULL,
  `log_file` varchar(30) DEFAULT NULL,
  `log_file_path` varchar(50) DEFAULT NULL,
  `program_file` varchar(30) DEFAULT NULL,
  `program_file_path` varchar(75) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`job_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_ジョブ管理';

CREATE TABLE `m_medical_subject` (
  `ult_medical_subject_code` varchar(3) NOT NULL,
  `ult_medical_subject_short_name` varchar(64) DEFAULT NULL,
  `ult_medical_subject_name` varchar(50) DEFAULT NULL,
  `ult_medical_subject_name_kana` varchar(50) DEFAULT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`ult_medical_subject_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_診療科目';

CREATE TABLE `m_mr` (
  `account_code` varchar(8) NOT NULL,
  `mr_full_name` varchar(20) DEFAULT NULL,
  `mr_full_name_kana` varchar(20) DEFAULT NULL,
  `person_in_charge_code` varchar(5) DEFAULT NULL,
  `person_in_charge_class` varchar(2) DEFAULT NULL,
  `unit_code` varchar(5) DEFAULT NULL COMMENT 'ユニットコード',
  `sales_team_code` varchar(9) DEFAULT NULL COMMENT '統一営業チームコード',
  `sales_group_code` varchar(7) DEFAULT NULL,
  `sales_office_code` varchar(5) DEFAULT NULL,
  `branch_code` varchar(2) DEFAULT NULL,
  `employment_pattern_class` varchar(2) DEFAULT NULL,
  `assigned_area_class` varchar(2) DEFAULT NULL,
  `grade_class` varchar(3) DEFAULT NULL,
  `api_position_code` varchar(4) DEFAULT NULL COMMENT 'API職位コード',
  `pharmacist_qualification_flag` bit(1) DEFAULT b'0',
  `person_in_charge_display_order` smallint(4) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`account_code`),
  KEY `idx01_m_mr` (`branch_code`,`sales_office_code`,`sales_team_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_MR';

CREATE TABLE `m_org` (
  `branch_code` varchar(2) NOT NULL,
  `branch_class` varchar(2) DEFAULT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `branch_short_name` varchar(20) DEFAULT NULL,
  `branch_display_order` smallint(2) DEFAULT NULL,
  `sales_org_class_code` varchar(2) DEFAULT NULL COMMENT '営業組織分類コード',
  `sales_office_code` varchar(5) NOT NULL COMMENT '営業所コード',
  `sales_office_name` varchar(50) DEFAULT NULL COMMENT '営業所名称',
  `sales_office_short_name` varchar(20) DEFAULT NULL COMMENT '営業所略称',
  `sales_office_display_order` smallint(6) DEFAULT NULL COMMENT '営業所表示順',
  `sales_group_code` varchar(7) DEFAULT NULL COMMENT '統一営業グループコード',
  `sales_group_name` varchar(50) DEFAULT NULL COMMENT '営業グループ名称',
  `sales_group_short_name` varchar(30) DEFAULT NULL COMMENT '営業グループ略称',
  `sales_team_code` varchar(9) NOT NULL COMMENT '統一営業チームコード',
  `sales_team_belong_class` varchar(1) DEFAULT NULL COMMENT '営業チーム所属区分',
  `sales_team_flag` bit(1) DEFAULT NULL COMMENT '営業チーム対象フラグ',
  `sales_team_name` varchar(50) DEFAULT NULL COMMENT '営業チーム名称',
  `sales_team_short_name` varchar(30) DEFAULT NULL COMMENT '営業チーム略称',
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sales_team_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_営業組織';

CREATE TABLE `m_product_group` (
  `united_product_group_code` varchar(4) NOT NULL,
  `united_product_group_name` varchar(30) DEFAULT NULL,
  `united_product_group_short_name` varchar(30) DEFAULT NULL,
  `rmp_flag` bit(1) DEFAULT NULL COMMENT 'RMPフラグ',
  `product_diaplay_order` smallint(3) DEFAULT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`united_product_group_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_統一品目グループ';

CREATE TABLE `m_screen_ctrl` (
  `screen_item_code` varchar(8) DEFAULT NULL COMMENT '画面制御項目コード',
  `screen_ctrl_class` varchar(2) DEFAULT NULL COMMENT '画面制御区分',
  `screen_item_class` varchar(2) DEFAULT NULL COMMENT '画面制御項目種別',
  `conditional_value_1` varchar(25) DEFAULT NULL COMMENT '制御条件項目値１',
  `conditional_value_2` varchar(25) DEFAULT NULL COMMENT '制御条件項目値２',
  `conditional_value_3` varchar(25) DEFAULT NULL COMMENT '制御条件項目値３',
  `display_value_1` varchar(50) DEFAULT NULL COMMENT '表示項目値１',
  `display_value_2` varchar(50) DEFAULT NULL COMMENT '表示項目値２',
  `display_value_3` varchar(50) DEFAULT NULL COMMENT '表示項目値３',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  KEY `idx01_m_screen_ctrl` (`screen_item_code`,`screen_ctrl_class`,`screen_item_class`,`conditional_value_1`,`conditional_value_2`,`conditional_value_3`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_画面制御';

CREATE TABLE `m_secondary_medical_area` (
  `secondary_medical_area_code` varchar(5) NOT NULL,
  `secondary_medical_area_name` varchar(20) DEFAULT NULL,
  `jis_prefecture_code` varchar(2) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`secondary_medical_area_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_2次医療圏';

CREATE TABLE `m_spec` (
  `spec_code` varchar(5) NOT NULL COMMENT '規格固定コード',
  `united_product_code` varchar(9) DEFAULT NULL COMMENT '統一商品コード',
  `product_group_code` varchar(4) DEFAULT NULL COMMENT '品目グループコード',
  `spec_class` varchar(1) DEFAULT NULL COMMENT '規格種別',
  `spec_name` varchar(70) DEFAULT NULL COMMENT '規格名称',
  `spec_name_kana` varchar(60) DEFAULT NULL COMMENT '規格名称(カナ)',
  `biological_flag` bit(1) DEFAULT b'0',
  `specific_biological_flag` bit(1) DEFAULT b'0',
  `invoice_price` decimal(9,0) DEFAULT NULL,
  `unit_converted_amount` decimal(11,2) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`spec_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_販売規格';

CREATE TABLE `m_system_settled_month` (
  `system_class` varchar(4) NOT NULL,
  `business_identification_code` varchar(11) NOT NULL,
  `calendar_class` varchar(4) NOT NULL,
  `system_fy_year` smallint(4) DEFAULT NULL,
  `system_half_year` smallint(2) DEFAULT NULL,
  `system_year` smallint(4) DEFAULT NULL,
  `system_month` smallint(2) DEFAULT NULL,
  `system_day` smallint(2) DEFAULT NULL,
  `system_date` date DEFAULT NULL,
  `term_first_business_date` date DEFAULT NULL,
  `term_end_business_date` date DEFAULT NULL,
  `month_first_business_date` date DEFAULT NULL,
  `month_end_business_date` date DEFAULT NULL,
  `business_unit_code` varchar(5) DEFAULT NULL,
  `system_settled_month` date NOT NULL,
  `system_field` smallint(2) DEFAULT NULL,
  `system_settled_month_current` date DEFAULT NULL,
  `system_field_current` smallint(2) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`system_class`,`business_identification_code`,`calendar_class`,`system_settled_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_消化確定日';

CREATE TABLE `m_today` (
  `today_date` date NOT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`today_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='m_処理日付';

CREATE TABLE `r_customer_academy` (
  `customer_code` varchar(7) NOT NULL,
  `belong_conference_code` varchar(8) NOT NULL,
  `umin_society_certification_class` varchar(1) NOT NULL,
  `umin_society_name` varchar(60) DEFAULT NULL,
  `umin_society_certification_title` varchar(5) DEFAULT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_code`,`belong_conference_code`,`umin_society_certification_class`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_顧客_所属学会';

CREATE TABLE `r_customer_facility` (
  `customer_code` varchar(7) NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `job_title_code` varchar(3) DEFAULT NULL,
  `univ_position_code` varchar(3) DEFAULT NULL,
  `dm_facility_job_title_name` varchar(50) DEFAULT NULL,
  `other_department_name` varchar(50) DEFAULT NULL,
  `main_facility_flag` bit(1) DEFAULT b'0',
  `pharma_affairs_member_flag` bit(1) DEFAULT b'0',
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_code`,`facility_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_顧客_施設';

CREATE TABLE `r_customer_facility_consultation_attribute` (
  `customer_code` varchar(7) NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `outpatient_exam_hours` smallint(2) DEFAULT NULL,
  `clinical_operation_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_code`,`facility_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_顧客_施設診療属性';

CREATE TABLE `r_customer_facility_consultation_period` (
  `customer_code` varchar(7) NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `consultation_class` varchar(1) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_code`,`facility_code`,`consultation_class`,`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_顧客_施設診療情報_期間';

CREATE TABLE `r_customer_facility_consultation_time` (
  `customer_code` varchar(7) NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `consultation_class` varchar(1) NOT NULL,
  `weekday_class` varchar(1) NOT NULL,
  `week_number` varchar(1) NOT NULL,
  `ampm_class` varchar(1) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_code`,`facility_code`,`consultation_class`,`weekday_class`,`week_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_顧客_施設診療情報_時間帯';

CREATE TABLE `r_customer_facility_current` (
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `job_title_code` varchar(3) DEFAULT NULL COMMENT '役職コード',
  `univ_position_code` varchar(3) DEFAULT NULL COMMENT '大学職位コード',
  `dm_facility_job_title_name` varchar(50) DEFAULT NULL COMMENT 'DM勤務先役職名称',
  `other_department_name` varchar(50) DEFAULT NULL COMMENT 'その他所属部科名称',
  `main_facility_flag` bit(1) DEFAULT b'0' COMMENT '顧客主勤務先フラグ',
  `pharma_affairs_member_flag` bit(1) DEFAULT b'0' COMMENT '薬審メンバフラグ',
  `valid_start_date` date NOT NULL COMMENT '適用開始日',
  `valid_end_date` date DEFAULT NULL COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`customer_code`,`facility_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_顧客_施設_直近履歴';

CREATE TABLE `r_customer_medical_subject` (
  `customer_medical_subject_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(7) NOT NULL,
  `ult_medical_subject_code` varchar(3) DEFAULT NULL,
  `api_medical_subject_code` varchar(2) DEFAULT NULL,
  `valid_start_date` date DEFAULT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_medical_subject_id`,`customer_code`),
  KEY `idx01_r_customer_medical_subject` (`customer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=829762 DEFAULT CHARSET=utf8mb4 COMMENT='r_顧客_診療科目';

CREATE TABLE `r_employee_org` (
  `account_code` varchar(8) NOT NULL,
  `person_in_charge_code` varchar(5) DEFAULT NULL,
  `person_in_charge_class` varchar(2) DEFAULT NULL COMMENT '担当者区分',
  `branch_code` varchar(7) DEFAULT NULL,
  `sales_office_code` varchar(5) DEFAULT NULL,
  `sales_group_code` varchar(7) DEFAULT NULL,
  `sales_team_code` varchar(9) DEFAULT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`account_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_MR_営業組織';

CREATE TABLE `r_facility_brick` (
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `brick_code` varchar(10) NOT NULL COMMENT 'DDDブリックコード',
  `secondary_medical_area_code` varchar(5) DEFAULT NULL COMMENT '2次医療圏コード',
  `valid_start_date` date NOT NULL COMMENT '適用開始日',
  `valid_end_date` date DEFAULT NULL COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`facility_code`,`brick_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_施設_ブリック';

CREATE TABLE `r_facility_group` (
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `facility_group_code_1` varchar(5) DEFAULT NULL COMMENT 'グループ基本コード1',
  `facility_group_code_2` varchar(5) DEFAULT NULL COMMENT 'グループ基本コード2',
  `facility_group_code_3` varchar(5) DEFAULT NULL COMMENT 'グループ基本コード3',
  `facility_group_code_4` varchar(5) DEFAULT NULL COMMENT 'グループ基本コード4',
  `valid_start_date` date NOT NULL COMMENT '適用開始日',
  `valid_end_date` date DEFAULT NULL COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`facility_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_施設_施設グループ';

CREATE TABLE `r_mr_brick` (
  `account_code` varchar(8) NOT NULL COMMENT 'アカウントID',
  `brick_code` varchar(10) NOT NULL COMMENT 'DDDブリックコード',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`account_code`,`brick_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_MR_ブリック';

CREATE TABLE `r_mr_customer_facility` (
  `account_code` varchar(8) NOT NULL,
  `mr_full_name` varchar(20) DEFAULT NULL,
  `customer_code` varchar(7) NOT NULL,
  `customer_full_name` varchar(50) DEFAULT NULL,
  `customer_full_kana` varchar(30) DEFAULT NULL,
  `facility_code` varchar(7) NOT NULL,
  `facility_name` varchar(50) DEFAULT NULL,
  `facility_kana` varchar(50) DEFAULT NULL,
  `ult_medical_subject_code` varchar(20) NOT NULL,
  `ult_medical_subject_name` varchar(50) DEFAULT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `api_medical_subject_name_kana` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`account_code`,`customer_code`,`facility_code`,`valid_start_date`,`ult_medical_subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_MR_顧客_施設';

CREATE TABLE `r_mr_customer_facility_current` (
  `account_code` varchar(8) NOT NULL COMMENT 'アカウントID',
  `mr_full_name` varchar(20) DEFAULT NULL COMMENT '社員名称',
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `customer_full_name` varchar(50) DEFAULT NULL COMMENT '顧客名称',
  `customer_full_kana` varchar(30) DEFAULT NULL COMMENT '顧客氏名カナ',
  `customer_last_name` varchar(25) DEFAULT NULL COMMENT '顧客ラストネーム',
  `customer_last_name_kana` varchar(25) DEFAULT NULL COMMENT '顧客ラストネーム(カナ)',
  `customer_first_name` varchar(25) DEFAULT NULL COMMENT '顧客ファーストネーム',
  `customer_first_name_kana` varchar(50) DEFAULT NULL COMMENT '顧客ファーストネーム(カナ)',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `facility_name` varchar(50) DEFAULT NULL COMMENT '施設自社名称',
  `facility_kana` varchar(50) DEFAULT NULL COMMENT '施設名称カナ',
  `ult_medical_subject_code` varchar(20) NOT NULL COMMENT 'API診療科目コード',
  `ult_medical_subject_name` varchar(50) DEFAULT NULL COMMENT 'API診療科目名称',
  `api_medical_subject_name_kana` varchar(60) DEFAULT NULL COMMENT 'API診療科目名称(カナ)',
  `customer_job_class` varchar(2) DEFAULT NULL COMMENT '医師薬剤師区分',
  `valid_start_date` date NOT NULL DEFAULT '1970-01-01' COMMENT '適用開始日',
  `valid_end_date` date DEFAULT '9999-12-31' COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`account_code`,`customer_code`,`facility_code`,`ult_medical_subject_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_MR_顧客_施設_最新';

CREATE TABLE `r_mr_facility` (
  `facility_code` varchar(7) NOT NULL,
  `account_code` varchar(8) NOT NULL,
  `person_in_charge_code` varchar(5) NOT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`facility_code`,`account_code`,`person_in_charge_code`,`valid_start_date`),
  KEY `idx01_r_mr_facility` (`account_code`,`facility_code`,`valid_start_date`,`valid_end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_MR_施設';

CREATE TABLE `r_mr_facility_current` (
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `account_code` varchar(8) NOT NULL COMMENT 'アカウントID',
  `person_in_charge_code` varchar(5) NOT NULL COMMENT '担当者コード',
  `valid_start_date` date NOT NULL COMMENT '適用開始日',
  `valid_end_date` date DEFAULT NULL COMMENT '適用終了日',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`facility_code`,`account_code`),
  KEY `idx01_r_mr_facility_current` (`account_code`,`facility_code`,`valid_start_date`,`valid_end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_MR_施設_直近履歴';

CREATE TABLE `r_product_group_customer_feature_amount` (
  `united_product_group_code` varchar(4) NOT NULL,
  `customer_feature_amount_code` varchar(2) NOT NULL,
  `ddd_market_code` varchar(3) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`united_product_group_code`,`customer_feature_amount_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_統一品目グループ_顧客特徴量';

CREATE TABLE `r_transfer_facility` (
  `facility_code` varchar(7) NOT NULL,
  `issued_slip_transfer_facility_code` varchar(7) DEFAULT NULL,
  `transfer_facility_code` varchar(7) NOT NULL,
  `representative_user_transfer_facility_code` varchar(7) DEFAULT NULL,
  `representative_facility_flag` bit(1) DEFAULT b'0',
  `valid_start_date` date NOT NULL,
  `valid_end_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`facility_code`,`transfer_facility_code`,`valid_start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='r_消化振替先施設';

CREATE TABLE `t_3rd_party_audience_log` (
  `access_id` int(10) unsigned NOT NULL,
  `customer_code` varchar(7) NOT NULL,
  `symposium_content_name` varchar(250) DEFAULT NULL,
  `access_datetime` datetime DEFAULT NULL,
  `out_datetime` datetime DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`access_id`,`customer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_3rd party視聴ログ';

CREATE TABLE `t_activity_response_rate` (
  `customer_cluster_code` varchar(3) NOT NULL COMMENT '顧客クラスタコード',
  `parameter_class` varchar(2) NOT NULL COMMENT 'パラメータ種別',
  `parameter_value` decimal(14,6) DEFAULT NULL COMMENT 'パラメータ値',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`customer_cluster_code`,`parameter_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_活動反応度';

CREATE TABLE `t_alert_favorite` (
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `alert_scenario_code` varchar(2) NOT NULL COMMENT 'シナリオコード',
  `alert_template_code` varchar(2) NOT NULL COMMENT 'アラートテンプレートコード',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  `calendar_year_month` date NOT NULL,
  `market_code` varchar(3) NOT NULL,
  `product_code` varchar(4) NOT NULL,
  `analysis_datetime` datetime NOT NULL,
  `account_code` varchar(8) NOT NULL,
  PRIMARY KEY (`calendar_year_month`,`account_code`,`customer_code`,`facility_code`,`market_code`,`product_code`,`analysis_datetime`,`alert_scenario_code`,`alert_template_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_アラートお気に入り';

CREATE TABLE `t_alert_history` (
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `market_code` varchar(3) NOT NULL COMMENT '市場コード',
  `product_code` varchar(4) NOT NULL COMMENT '品目コード',
  `analysis_datetime` datetime NOT NULL COMMENT '分析年月日時',
  `diagnosis_code` varchar(2) DEFAULT NULL COMMENT '領域コード',
  `alert_scenario_code` varchar(2) NOT NULL COMMENT 'シナリオコード',
  `alert_template_code` varchar(2) NOT NULL COMMENT 'アラートテンプレートコード',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`facility_code`,`customer_code`,`market_code`,`product_code`,`analysis_datetime`,`alert_scenario_code`,`alert_template_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_アラート履歴';

CREATE TABLE `t_alert_read_log` (
  `alert_read_log_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'アラート参照状況ログID',
  `calendar_year_month` date NOT NULL COMMENT '年月',
  `account_code` varchar(8) NOT NULL COMMENT 'アカウントID',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `market_code` varchar(3) NOT NULL COMMENT '市場コード',
  `product_code` varchar(4) NOT NULL COMMENT '品目コード',
  `analysis_datetime` datetime NOT NULL COMMENT '分析年月日時',
  `alert_scenario_code` varchar(2) NOT NULL COMMENT 'シナリオコード',
  `alert_template_code` varchar(2) NOT NULL COMMENT 'アラートテンプレートコード',
  `log_type` varchar(1) NOT NULL COMMENT '参照状況種別',
  `log_datetime` datetime NOT NULL COMMENT '記録日時',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`alert_read_log_id`),
  KEY `idx01_t_alert_read_log` (`calendar_year_month`,`account_code`,`facility_code`,`customer_code`,`market_code`,`product_code`,`analysis_datetime`,`alert_scenario_code`,`alert_template_code`,`log_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=223570 DEFAULT CHARSET=utf8mb4 COMMENT='t_アラート参照状況ログ';

CREATE TABLE `t_alert_text` (
  `calendar_year_month` date NOT NULL COMMENT '年月',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `market_code` varchar(3) NOT NULL COMMENT '市場コード',
  `product_code` varchar(4) NOT NULL COMMENT '品目コード',
  `product_name` varchar(50) DEFAULT NULL COMMENT '品目名',
  `own_product_flag` bit(1) DEFAULT b'0',
  `own_product_short_name` varchar(10) DEFAULT NULL COMMENT '自社品目略称',
  `analysis_datetime` datetime NOT NULL COMMENT '分析年月日時',
  `diagnosis_code` varchar(2) DEFAULT NULL COMMENT '領域コード',
  `alert_template_code` varchar(2) NOT NULL COMMENT 'アラートテンプレートコード',
  `alert_scenario_code` varchar(2) NOT NULL COMMENT 'シナリオコード',
  `alert_text` varchar(300) DEFAULT NULL COMMENT 'アラートテキスト',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`calendar_year_month`,`facility_code`,`customer_code`,`market_code`,`product_code`,`analysis_datetime`,`alert_template_code`,`alert_scenario_code`),
  KEY `idx01_t_alert_text` (`facility_code`,`customer_code`,`analysis_datetime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_アラートテキスト';

CREATE TABLE `t_amn_acccess_log` (
  `amn_access_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amn_sequence` int(10) DEFAULT NULL COMMENT 'シーケンス',
  `customer_code` varchar(7) DEFAULT NULL COMMENT '顧客コード',
  `amn_content_id` varchar(13) DEFAULT NULL COMMENT 'コンテンツID',
  `content_name` varchar(300) DEFAULT NULL COMMENT 'コンテンツ名称',
  `united_product_group_code` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード',
  `access_datetime` datetime DEFAULT NULL COMMENT '日時',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`amn_access_log_id`),
  KEY `idx01_t_amn_acccess_log` (`amn_sequence`,`customer_code`,`amn_content_id`,`access_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=6893440 DEFAULT CHARSET=utf8mb4 COMMENT='t_AMNアクセスログ';

CREATE TABLE `t_clm_activity_log` (
  `device_code` varchar(40) NOT NULL COMMENT '端末コード',
  `account_code` varchar(8) NOT NULL COMMENT 'アカウントID',
  `start_datetime` datetime(6) NOT NULL COMMENT '開始日時',
  `end_datetime` datetime(6) DEFAULT NULL COMMENT '終了日時',
  `facility_code` varchar(7) DEFAULT NULL COMMENT '施設コード',
  `customer_code` varchar(7) DEFAULT NULL COMMENT '顧客コード',
  `material_play_type_code` varchar(1) DEFAULT NULL COMMENT '資材再生種別コード',
  `clm_log_type_code` varchar(2) DEFAULT NULL COMMENT 'CLMログ種別コード',
  `clm_product_code` varchar(256) DEFAULT NULL COMMENT 'CLM製品コード',
  `united_product_group_code` varchar(4) NOT NULL COMMENT '統一品目グループコード',
  `material_code` varchar(30) NOT NULL COMMENT '資材コード',
  `revision_no` smallint(6) DEFAULT NULL COMMENT 'リビジョン番号',
  `detail_actual_id` int(11) DEFAULT NULL COMMENT '活動実績ID',
  `sfa_unlink_flag` bit(1) DEFAULT NULL COMMENT 'SFA連携解除フラグ',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`device_code`,`account_code`,`start_datetime`,`united_product_group_code`,`material_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_CLM活動ログ';

CREATE TABLE `t_compliance_learning_source` (
  `source_record_class` varchar(2) NOT NULL COMMENT 'ソースレコード種別区分',
  `source_record_id` int(10) unsigned NOT NULL,
  `source_record_date` date DEFAULT NULL COMMENT 'ソースレコード日付',
  `compliance_learning_model_class` varchar(2) DEFAULT NULL COMMENT 'コンプライアンス学習モデル区分',
  `source_text` varchar(5000) DEFAULT NULL COMMENT 'ソーステキスト',
  `violation_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`source_record_class`,`source_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_コンプライアンス学習ソース';

CREATE TABLE `t_compliance_violation` (
  `source_record_id` int(10) unsigned NOT NULL,
  `source_record_class` varchar(2) NOT NULL COMMENT 'ソースレコード種別区分',
  `violation_flag_a` bit(1) DEFAULT b'0',
  `violation_flag_b` bit(1) DEFAULT b'0',
  `violation_flag_c` bit(1) DEFAULT b'0',
  `violation_flag_a_checked` bit(1) DEFAULT b'0',
  `violation_flag_b_checked` bit(1) DEFAULT b'0',
  `violation_flag_c_checked` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`source_record_id`,`source_record_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_コンプライアンス違反';

CREATE TABLE `t_compliance_violation_sentence` (
  `source_record_id` int(10) unsigned NOT NULL,
  `source_record_class` varchar(2) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `sentence_id` int(10) unsigned NOT NULL,
  `sentence_violation_class` varchar(2) NOT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`source_record_id`,`source_record_class`,`united_product_group_code`,`sentence_id`,`sentence_violation_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_コンプライアンス違反センテンス';

CREATE TABLE `t_conference` (
  `conference_code` varchar(8) NOT NULL COMMENT '学会ID',
  `conference_office` varchar(255) DEFAULT NULL COMMENT '学会事務局',
  `conference_office_code` varchar(4) DEFAULT NULL COMMENT '事務局ID',
  `conference_name` varchar(1000) DEFAULT NULL COMMENT '大会名称',
  `conference_name_kana` varchar(1000) DEFAULT NULL COMMENT '大会名称(ふりがな)',
  `diagnosis_name` varchar(256) DEFAULT NULL COMMENT '領域',
  `conference_fiscal_year` varchar(4) DEFAULT NULL COMMENT '開始年度',
  `conference_start_date` date DEFAULT NULL COMMENT '開始年月日',
  `conference_end_date` date DEFAULT NULL COMMENT '終了年月日',
  `site_name_1` varchar(1000) DEFAULT NULL COMMENT '会場名称1',
  `site_name_2` varchar(16) DEFAULT NULL COMMENT '会場2以降あり',
  `site_zip_code_1` varchar(8) DEFAULT NULL COMMENT '会場郵便番号1',
  `site_address_1` varchar(1000) DEFAULT NULL COMMENT '会場住所1',
  `chairman_name` varchar(128) DEFAULT NULL COMMENT '会長名称',
  `chairman_affiliate` varchar(128) DEFAULT NULL COMMENT '会長所属',
  `conference_url` varchar(1000) DEFAULT NULL COMMENT '大会URL',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`conference_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_学会開催';

CREATE TABLE `t_customer_cluster` (
  `customer_cluster_code` varchar(3) NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `customer_code` varchar(7) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_cluster_code`,`facility_code`,`customer_code`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_顧客クラスタ';

CREATE TABLE `t_customer_feature_amount` (
  `analysis_date` date NOT NULL COMMENT '分析年月日',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `diagnosis_code` varchar(2) NOT NULL COMMENT '領域コード',
  `customer_feature_amount_code` varchar(2) NOT NULL COMMENT '顧客特徴量コード',
  `customer_feature_amount_parameter` varchar(2) DEFAULT NULL COMMENT '特徴量パラメータ値',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`analysis_date`,`facility_code`,`customer_code`,`diagnosis_code`,`customer_feature_amount_code`),
  KEY `idx01_t_customer_feature_amount` (`customer_code`,`facility_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_顧客特徴量';

CREATE TABLE `t_customer_feature_amount_ai_analyzed_result` (
  `analysis_date` date NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `customer_code` varchar(7) NOT NULL,
  `diagnosis_code` varchar(2) NOT NULL,
  `customer_feature_amount_code` varchar(2) NOT NULL,
  `customer_feature_amount_parameter` varchar(2) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`analysis_date`,`facility_code`,`customer_code`,`diagnosis_code`,`customer_feature_amount_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_顧客特徴量AI分析結果';

CREATE TABLE `t_customer_feature_amount_modified` (
  `entry_date` date NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `customer_code` varchar(7) NOT NULL,
  `diagnosis_code` varchar(2) NOT NULL COMMENT '領域コード',
  `customer_feature_amount_code` varchar(2) NOT NULL COMMENT '顧客特徴量コード',
  `customer_feature_amount_parameter` varchar(2) DEFAULT NULL COMMENT '特徴量パラメータ値',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`entry_date`,`facility_code`,`customer_code`,`diagnosis_code`,`customer_feature_amount_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_顧客特徴量MR入力';

CREATE TABLE `t_customer_timeline` (
  `customer_timeline_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(7) NOT NULL,
  `facility_code` varchar(7) DEFAULT NULL,
  `multi_channel_id` varchar(6) NOT NULL,
  `timeline` datetime NOT NULL,
  `display_item_1` varchar(200) DEFAULT NULL,
  `display_item_2` varchar(200) DEFAULT NULL,
  `display_item_3` varchar(200) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `detail_actual_id` int(10) unsigned DEFAULT NULL,
  `timeline_category_class` varchar(2) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_timeline_id`,`customer_code`,`multi_channel_id`,`timeline`),
  KEY `idx01_t_customer_timeline` (`customer_code`,`facility_code`,`timeline`),
  KEY `idx02_t_customer_timeline` (`customer_code`,`facility_code`)
) ENGINE=InnoDB AUTO_INCREMENT=18681504 DEFAULT CHARSET=utf8mb4 COMMENT='t_顧客接点タイムライン';

CREATE TABLE `t_dafi_document` (
  `literature_code` varchar(9) NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `customer_code` varchar(7) NOT NULL,
  `dafi_title` varchar(500) DEFAULT NULL,
  `journal_name` varchar(100) DEFAULT NULL,
  `issued_year_month` varchar(6) DEFAULT NULL,
  `issued_research_class_code` varchar(1) DEFAULT NULL COMMENT '発表研究区分コード',
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`literature_code`,`facility_code`,`customer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_DAFI文献情報';

CREATE TABLE `t_ddd_sales_actual` (
  `calendar_year_month` date NOT NULL COMMENT 'データ月度',
  `brick_code` varchar(10) NOT NULL COMMENT 'DDDブリックコード',
  `ddd_product_code` varchar(3) NOT NULL COMMENT '明細アイテムコード',
  `ddd_market_code` varchar(3) NOT NULL COMMENT '集計アイテムコード',
  `ddd_sales_amount` decimal(15,0) DEFAULT NULL COMMENT '月別実績金額',
  `total_patient_number` decimal(15,0) DEFAULT NULL COMMENT '月別実績患者数延数',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`calendar_year_month`,`brick_code`,`ddd_product_code`,`ddd_market_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_DDD販売実績';

CREATE TABLE `t_detail_actual` (
  `detail_actual_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `detail_plan_id` int(10) unsigned DEFAULT NULL,
  `account_code` varchar(8) NOT NULL COMMENT 'アカウントID',
  `detail_type_class` varchar(2) DEFAULT NULL COMMENT '活動種別区分',
  `start_date` date NOT NULL COMMENT '開始年月日',
  `start_time` time DEFAULT NULL COMMENT '開始時刻',
  `end_date` date DEFAULT NULL COMMENT '終了年月日',
  `end_time` time DEFAULT NULL COMMENT '終了時刻',
  `whole_day_flag` bit(1) DEFAULT b'0',
  `go_directly_flag` bit(1) DEFAULT b'0',
  `return_directly_flag` bit(1) DEFAULT b'0',
  `detail_title` varchar(100) DEFAULT NULL COMMENT '活動タイトル',
  `companion` varchar(250) DEFAULT NULL COMMENT '同行者',
  `detail_memo` text,
  `detail_memo_contents` text,
  `detail_memo_response` text,
  `memorandum` text,
  `non_public_flag` bit(1) DEFAULT b'0',
  `public_status_class` varchar(1) DEFAULT NULL COMMENT '公開ステータス区分',
  `structuration_status_class` varchar(1) DEFAULT NULL COMMENT '構造化ステータス区分',
  `clm_link_class` varchar(1) DEFAULT NULL COMMENT 'CLM連携区分',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`detail_actual_id`,`start_date`),
  KEY `idx01_t_detail_actual` (`detail_plan_id`,`account_code`,`start_date`),
  KEY `idx02_t_detail_actual` (`account_code`,`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=30407326 DEFAULT CHARSET=utf8mb4 COMMENT='t_活動実績';

CREATE TABLE `t_detail_actual_clm_material` (
  `detail_actual_material_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活動実績詳細資材ID',
  `material_code` varchar(30) DEFAULT NULL COMMENT '資材コード',
  `material_revision_no` smallint(6) DEFAULT NULL COMMENT '資材リビジョン番号',
  `material_use_start_datetime` datetime DEFAULT NULL COMMENT '資材利用開始日時',
  `material_use_end_datetime` datetime DEFAULT NULL COMMENT '資材利用終了日時',
  `detail_actual_id` int(11) DEFAULT NULL COMMENT '活動実績ID',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`detail_actual_material_id`),
  KEY `idx01_t_detail_actual_clm_material` (`detail_actual_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_活動実績詳細_CLM資材';

CREATE TABLE `t_detail_actual_constructuration_log` (
  `detail_actual_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '活動実績ID',
  `account_code` varchar(8) NOT NULL COMMENT 'アカウントID',
  `start_date` date NOT NULL COMMENT '開始年月日',
  `detail_title` varchar(100) DEFAULT NULL COMMENT '活動タイトル',
  `companion` varchar(250) DEFAULT NULL COMMENT '同行者',
  `detail_memo_contents` text,
  `material_name` varchar(250) DEFAULT NULL COMMENT '資材名',
  `non_public_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`detail_actual_id`,`account_code`,`start_date`)
) ENGINE=InnoDB AUTO_INCREMENT=95745682 DEFAULT CHARSET=utf8mb4 COMMENT='t_活動実績_構造化ログ';

CREATE TABLE `t_detail_actual_customer` (
  `detail_actual_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility_code` varchar(7) DEFAULT NULL COMMENT '施設コード',
  `customer_code` varchar(7) DEFAULT NULL COMMENT '顧客コード',
  `detail_actual_id` int(10) unsigned DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`detail_actual_customer_id`),
  KEY `idx01_t_detail_actual_customer` (`detail_actual_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30530635 DEFAULT CHARSET=utf8mb4 COMMENT='t_活動実績詳細_顧客';

CREATE TABLE `t_detail_actual_product` (
  `detail_actual_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `united_product_group_code` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード',
  `material_flag` bit(1) DEFAULT b'0',
  `case_follow_flag` bit(1) DEFAULT b'0',
  `case_continuous_follow_flag` bit(1) DEFAULT b'0',
  `qa_flag` bit(1) DEFAULT b'0',
  `covigi_flag` bit(1) DEFAULT b'0',
  `detail_actual_id` int(10) unsigned DEFAULT NULL,
  `rmp_flag` bit(1) DEFAULT b'0',
  `fpd_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`detail_actual_product_id`),
  KEY `idx01_t_detail_actual_product` (`detail_actual_id`),
  KEY `idx02_t_detail_actual_product` (`united_product_group_code`)
) ENGINE=InnoDB AUTO_INCREMENT=81266387 DEFAULT CHARSET=utf8mb4 COMMENT='t_活動実績詳細_品目';

CREATE TABLE `t_detail_actual_product_constructuration_log` (
  `detail_actual_product_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '活動実績詳細品目ID',
  `united_product_group_code` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード',
  `material_flag` bit(1) DEFAULT NULL COMMENT '資材スライドフラグ',
  `case_follow_flag` bit(1) DEFAULT NULL COMMENT '症例フォローフラグ_新規',
  `case_continuous_follow_flag` bit(1) DEFAULT NULL COMMENT '症例フォローフラグ_継続',
  `qa_flag` bit(1) DEFAULT NULL COMMENT 'オフラベル問合せ対応フラグ',
  `covigi_flag` bit(1) DEFAULT NULL COMMENT 'オフラベル安全管理情報対応フラグ',
  `rmp_flag` bit(1) DEFAULT b'0',
  `fpd_flag` bit(1) DEFAULT b'0',
  `detail_actual_id` int(10) DEFAULT NULL COMMENT '活動実績ID',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`detail_actual_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=284095 DEFAULT CHARSET=utf8mb4 COMMENT='t_活動実績詳細_品目_構造化ログ';

CREATE TABLE `t_detail_plan` (
  `detail_plan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_code` varchar(8) NOT NULL COMMENT 'アカウントID',
  `detail_type_class` varchar(2) NOT NULL COMMENT '活動種別区分',
  `start_date` date NOT NULL COMMENT '開始年月日',
  `start_time` time DEFAULT NULL COMMENT '開始時刻',
  `end_date` date DEFAULT NULL COMMENT '終了年月日',
  `end_time` time DEFAULT NULL COMMENT '終了時刻',
  `whole_day_flag` bit(1) DEFAULT b'0',
  `go_directly_flag` bit(1) DEFAULT b'0',
  `return_directly_flag` bit(1) DEFAULT b'0',
  `repeat_class` varchar(1) DEFAULT NULL COMMENT '繰返し区分',
  `detail_plan_repeat_id` varchar(10) DEFAULT NULL COMMENT '活動計画繰り返しID',
  `detail_title` varchar(100) DEFAULT NULL COMMENT '活動タイトル',
  `companion` varchar(250) DEFAULT NULL COMMENT '同行者',
  `remark` varchar(5000) DEFAULT NULL COMMENT '備考',
  `detail_actual_id` int(10) unsigned DEFAULT NULL,
  `non_public_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`detail_plan_id`,`account_code`,`start_date`),
  KEY `idx01_t_detail_plan` (`account_code`,`start_date`,`detail_plan_id`),
  KEY `idx02_t_detail_plan` (`account_code`,`start_date`),
  KEY `idx03` (`detail_actual_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40152306 DEFAULT CHARSET=utf8mb4 COMMENT='t_活動計画';

CREATE TABLE `t_detail_plan_customer` (
  `detail_plan_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility_code` varchar(7) DEFAULT NULL COMMENT '施設コード',
  `customer_code` varchar(7) DEFAULT NULL COMMENT '顧客コード',
  `detail_plan_id` int(10) unsigned DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`detail_plan_customer_id`),
  KEY `idx01_t_detail_plan_customer` (`detail_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30146940 DEFAULT CHARSET=utf8mb4 COMMENT='t_活動計画詳細_顧客';

CREATE TABLE `t_detail_plan_product` (
  `detail_plan_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `united_product_group_code` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード',
  `material_flag` bit(1) DEFAULT b'0',
  `case_follow_flag` bit(1) DEFAULT b'0',
  `case_continuous_follow_flag` bit(1) DEFAULT b'0',
  `qa_flag` bit(1) DEFAULT b'0',
  `covigi_flag` bit(1) DEFAULT b'0',
  `detail_plan_id` int(10) unsigned DEFAULT NULL,
  `rmp_flag` bit(1) DEFAULT b'0',
  `fpd_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`detail_plan_product_id`),
  KEY `idx01_t_detail_plan_product` (`detail_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90146597 DEFAULT CHARSET=utf8mb4 COMMENT='t_活動計画詳細_品目';

CREATE TABLE `t_diabetes_info_facility` (
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `pcf_diabetes_num` int(11) DEFAULT NULL COMMENT 'PCF有り一型糖尿病算定件数',
  `non_pcf_diabetes_num` int(11) DEFAULT NULL COMMENT 'PCF無し一型糖尿病算定件数',
  `glucose_monitoring_flag` bit(1) DEFAULT NULL COMMENT '持続測定血糖器加算算定施設フラグ',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`facility_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_糖尿病算定施設';

CREATE TABLE `t_dmail_delivery_log` (
  `dmail_delivery_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dmail_id` varchar(10) NOT NULL,
  `delivery_datetime` datetime DEFAULT NULL,
  `account_code` varchar(8) NOT NULL,
  `customer_code` varchar(7) NOT NULL,
  `facility_code` varchar(7) DEFAULT NULL,
  `dmail_body_text` varchar(15000) DEFAULT NULL,
  `is_accessed` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `dmail_member_code` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`dmail_delivery_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73509 DEFAULT CHARSET=utf8mb4 COMMENT='t_Dメール配信履歴';

CREATE TABLE `t_explanation_actual` (
  `explanation_actual_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `united_product_group_code_main` varchar(4) NOT NULL COMMENT '統一品目グループコード_主',
  `united_product_group_code_sub1` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード_副1',
  `united_product_group_code_sub2` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード_副2',
  `united_product_group_code_sub3` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード_副3',
  `facility_code` varchar(7) DEFAULT NULL COMMENT '施設コード',
  `place` varchar(100) DEFAULT NULL COMMENT '実施場所',
  `speaker_name` varchar(100) DEFAULT NULL COMMENT '講師名称',
  `participant_number` smallint(3) DEFAULT NULL COMMENT '合計人数',
  `attendee` varchar(300) DEFAULT NULL COMMENT '参加者',
  `detail_actual_id` int(10) unsigned DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`explanation_actual_id`),
  KEY `idx01_t_explanation_actual` (`detail_actual_id`),
  KEY `idx02_t_explanation_actual` (`explanation_actual_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122164 DEFAULT CHARSET=utf8mb4 COMMENT='t_説明会実績';

CREATE TABLE `t_explanation_actual_attendee` (
  `explanation_actual_id` int(10) unsigned NOT NULL,
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `detail_actual_id` int(10) unsigned DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`explanation_actual_id`,`customer_code`,`facility_code`),
  KEY `idx01_t_explanation_actual_attendee` (`detail_actual_id`),
  KEY `idx02_t_explanation_actual_attendee` (`explanation_actual_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_説明会実績参加者';

CREATE TABLE `t_explanation_actual_expense` (
  `explanation_actual_expense_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `expense_class` varchar(1) NOT NULL COMMENT '経費種別区分',
  `expense_amount` mediumint(7) DEFAULT NULL COMMENT '合計金額',
  `attendance_number` smallint(3) DEFAULT NULL COMMENT '合計参加人数',
  `payee_name` varchar(50) DEFAULT NULL COMMENT '支払先',
  `unit_price` decimal(7,2) DEFAULT NULL COMMENT '単価',
  `purchase_number` smallint(3) DEFAULT NULL COMMENT '購入個数',
  `actual_number` smallint(3) DEFAULT NULL COMMENT '実食個数',
  `explanation_actual_id` int(10) unsigned NOT NULL,
  `detail_actual_id` int(10) unsigned NOT NULL,
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`explanation_actual_expense_id`,`expense_class`),
  KEY `idx01_t_explanation_actual_expense` (`explanation_actual_id`),
  KEY `idx02_t_explanation_actual_expense` (`detail_actual_id`),
  KEY `idx03_t_explanation_actual_expense` (`explanation_actual_expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20160 DEFAULT CHARSET=utf8mb4 COMMENT='t_説明会実績経費';

CREATE TABLE `t_explanation_plan` (
  `explanation_plan_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `united_product_group_code_main` varchar(4) NOT NULL COMMENT '統一品目グループコード_主',
  `united_product_group_code_sub1` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード_副1',
  `united_product_group_code_sub2` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード_副2',
  `united_product_group_code_sub3` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード_副3',
  `facility_code` varchar(7) DEFAULT NULL COMMENT '施設コード',
  `place` varchar(100) DEFAULT NULL COMMENT '実施場所',
  `speaker_name` varchar(100) DEFAULT NULL COMMENT '講師名称',
  `participant_number` smallint(3) DEFAULT NULL COMMENT '合計人数',
  `attendee` varchar(300) DEFAULT NULL COMMENT '参加者',
  `detail_plan_id` int(10) unsigned DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`explanation_plan_id`),
  KEY `idx01_t_explanation_plan` (`detail_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104750 DEFAULT CHARSET=utf8mb4 COMMENT='t_説明会計画';

CREATE TABLE `t_explanation_plan_attendee` (
  `explanation_plan_id` int(10) unsigned NOT NULL,
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `detail_plan_id` int(10) unsigned DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`explanation_plan_id`,`customer_code`,`facility_code`),
  KEY `idx01_t_explanation_plan_attendee` (`detail_plan_id`),
  KEY `idx02_t_explanation_plan_attendee` (`explanation_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_説明会計画参加者';

CREATE TABLE `t_explanation_plan_expense` (
  `explanation_plan_expense_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `expense_class` varchar(1) NOT NULL COMMENT '経費種別区分',
  `expense_amount` mediumint(7) DEFAULT NULL COMMENT '合計金額',
  `attendance_number` smallint(3) DEFAULT NULL COMMENT '合計参加人数',
  `payee_name` varchar(50) DEFAULT NULL COMMENT '支払先名称',
  `unit_price` decimal(7,2) DEFAULT NULL COMMENT '単価',
  `purchase_number` smallint(3) DEFAULT NULL COMMENT '購入個数',
  `actual_number` smallint(3) DEFAULT NULL COMMENT '実食個数',
  `explanation_plan_id` int(10) unsigned NOT NULL,
  `detail_plan_id` int(10) unsigned NOT NULL,
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`explanation_plan_expense_id`,`expense_class`),
  KEY `idx01_t_explanation_plan_expense` (`detail_plan_id`),
  KEY `idx02_t_explanation_plan_expense` (`explanation_plan_expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3542 DEFAULT CHARSET=utf8mb4 COMMENT='t_説明会計画_経費';

CREATE TABLE `t_gpat_facility` (
  `data_period_summary_month` varchar(6) NOT NULL COMMENT 'データ期間_集計月',
  `data_period_start_month` varchar(6) NOT NULL COMMENT 'データ期間_開始月',
  `data_period_end_month` varchar(6) NOT NULL COMMENT 'データ期間_終了月',
  `data_period_class` varchar(2) DEFAULT NULL COMMENT 'データ期間区分',
  `branch_code` varchar(2) NOT NULL COMMENT '支店コード',
  `sales_office_code` varchar(5) NOT NULL COMMENT '営業所コード',
  `sales_group_code` varchar(7) DEFAULT NULL COMMENT '統一営業グループコード',
  `sales_team_code` varchar(9) DEFAULT NULL COMMENT '統一営業チームコード',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `dcf_facility_code` varchar(9) DEFAULT NULL COMMENT 'ULT施設コード',
  `market_name` varchar(50) NOT NULL COMMENT '市場名称',
  `person_in_charge_code1` varchar(5) DEFAULT NULL COMMENT '担当者コード1',
  `person_in_charge_code2` varchar(5) DEFAULT NULL COMMENT '担当者コード2',
  `ats_flag` bit(1) DEFAULT NULL COMMENT 'ATS対象フラグ',
  `united_product_group_code` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード',
  `qt_market` varchar(2) DEFAULT NULL COMMENT 'QT市場',
  `share_expand_degree` varchar(20) DEFAULT NULL COMMENT '市場成長率',
  `therapeutic_area_on_site_share` varchar(10) DEFAULT NULL COMMENT 'API製品シェア(QT)',
  `total_patients_share_expand_degree` varchar(20) DEFAULT NULL COMMENT '延患者シェア伸長度',
  `qt_share` varchar(10) DEFAULT NULL COMMENT '前回API製品シェア(QT)',
  `qt_total_patients_number` varchar(20) DEFAULT NULL COMMENT 'API製品延患者数(QT)',
  `unused_flag` bit(1) DEFAULT NULL COMMENT '不使用フラグ',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`data_period_summary_month`,`data_period_start_month`,`data_period_end_month`,`branch_code`,`sales_office_code`,`facility_code`,`market_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_GPAT施設';

CREATE TABLE `t_gpat_product` (
  `data_period_summary_month` varchar(6) NOT NULL COMMENT 'データ期間',
  `data_period_start_month` varchar(6) NOT NULL COMMENT 'データ期間_開始月',
  `data_period_end_month` varchar(6) NOT NULL COMMENT 'データ期間_終了月',
  `data_period_class` varchar(2) DEFAULT NULL COMMENT 'データ期間区分',
  `branch_code` varchar(2) NOT NULL COMMENT '支店コード',
  `sales_office_code` varchar(5) NOT NULL COMMENT '営業所コード',
  `sales_group_code` varchar(7) DEFAULT NULL COMMENT '統一営業グループコード',
  `sales_team_code` varchar(9) DEFAULT NULL COMMENT '統一営業チームコード',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `dcf_facility_code` varchar(9) DEFAULT NULL COMMENT 'ULT施設コード',
  `united_product_group_code` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード',
  `product_name` varchar(50) NOT NULL COMMENT '製品名称',
  `person_in_charge_code_1` varchar(5) DEFAULT NULL COMMENT '担当者コード1',
  `person_in_charge_code_2` varchar(5) DEFAULT NULL COMMENT '担当者コード2',
  `therapeutic_area_qt_market` varchar(2) DEFAULT NULL COMMENT '参入疾患領域市場_QT市場',
  `therapeutic_area_market_growth_rate` varchar(20) DEFAULT NULL COMMENT '参入疾患領域市場_市場成長率',
  `therapeutic_area_on_site_share` varchar(10) DEFAULT NULL COMMENT '参入疾患領域市場_施設内シェア',
  `therapeutic_area_on_site_share_expand_degree` varchar(20) DEFAULT NULL COMMENT '参入疾患領域市場_施設内シェア伸長度',
  `therapeutic_area_qt_share` varchar(10) DEFAULT NULL COMMENT '参入疾患領域市場_API製品シェア(QT)',
  `therapeutic_area_total_patients_share_expand_degree` varchar(20) DEFAULT NULL COMMENT '参入疾患領域市場_延患者シェア伸長度',
  `therapeutic_area_last_qt_share` varchar(10) DEFAULT NULL COMMENT '参入疾患領域市場_前回API製品シェア(QT)',
  `therapeutic_area_qt_total_patients_number` varchar(2) DEFAULT NULL COMMENT '参入疾患領域市場_API製品延患者数(QT)',
  `competitive_products_qt_market` varchar(2) DEFAULT NULL COMMENT '競合品市場_QT市場',
  `competitive_products_market_growth_rate` varchar(20) DEFAULT NULL COMMENT '競合品市場_市場成長率',
  `competitive_products_on_site_share` varchar(10) DEFAULT NULL COMMENT '競合品市場_施設内シェア',
  `competitive_products_on_site_share_expand_degree` varchar(20) DEFAULT NULL COMMENT '競合品市場_施設内シェア伸長度',
  `competitive_products_qt_share` varchar(10) DEFAULT NULL COMMENT '競合品市場_API製品シェア(QT)',
  `competitive_products_total_patients_share_expand_degree` varchar(20) DEFAULT NULL COMMENT '競合品市場_延患者シェア伸長度',
  `competitive_products_last_qt_share` varchar(10) DEFAULT NULL COMMENT '競合品市場_前回API製品シェア(QT)',
  `competitive_products_qt_total_patients_number` varchar(2) DEFAULT NULL COMMENT '競合品市場_API製品延患者数(QT)',
  `therapeutic_area_market_name` varchar(50) DEFAULT NULL COMMENT '参入疾患領域市場名称',
  `competitive_products_market_name` varchar(50) DEFAULT NULL COMMENT '競合品市場名称',
  `unused_flag` bit(1) DEFAULT NULL COMMENT '不使用フラグ',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`data_period_summary_month`,`data_period_start_month`,`data_period_end_month`,`branch_code`,`sales_office_code`,`facility_code`,`product_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_GPAT製品';

CREATE TABLE `t_info_report` (
  `information_report_id` varchar(9) NOT NULL COMMENT '文書管理番号',
  `account_code` varchar(8) NOT NULL COMMENT 'アカウントID',
  `facility_code` varchar(7) DEFAULT NULL COMMENT '施設コード',
  `customer_code` varchar(7) DEFAULT NULL COMMENT '顧客コード',
  `united_product_group_code` varchar(4) NOT NULL COMMENT '統一品目グループコード',
  `report_publish_date` date DEFAULT NULL COMMENT 'レポート公開日',
  `body_text` varchar(5000) DEFAULT NULL COMMENT '本文',
  `non_public_flag` bit(1) DEFAULT NULL COMMENT '非公開フラグ',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`information_report_id`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_情報レポート';

CREATE TABLE `t_keyword_match_result` (
  `keyword_match_result_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_record_class` varchar(2) DEFAULT NULL,
  `customer_code` varchar(7) DEFAULT NULL,
  `facility_code` varchar(7) DEFAULT NULL,
  `keywords` varchar(50) DEFAULT NULL,
  `combination_rule_1` varchar(50) DEFAULT NULL,
  `combination_rule_2` varchar(50) DEFAULT NULL,
  `text_release_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`keyword_match_result_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120321 DEFAULT CHARSET=utf8mb4 COMMENT='t_キーワードマッチ結果';

CREATE TABLE `t_knowledge_favorite` (
  `knowledgemap_candidate_id` int(10) unsigned NOT NULL,
  `account_code` varchar(8) NOT NULL,
  `customer_code` varchar(7) NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `united_product_group_code` varchar(4) DEFAULT NULL,
  `favorite_date` date DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`knowledgemap_candidate_id`,`account_code`,`customer_code`,`facility_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_ナレッジお気に入り';

CREATE TABLE `t_knowledgemap` (
  `knowledge_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `knowledgemap_candidate_id` int(10) unsigned DEFAULT NULL,
  `account_code` varchar(8) DEFAULT NULL COMMENT 'アカウントID',
  `facility_code` varchar(7) DEFAULT NULL COMMENT '施設コード',
  `customer_code` varchar(7) DEFAULT NULL COMMENT '顧客コード',
  `united_product_group_code` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード',
  `recommended_order` smallint(3) DEFAULT NULL COMMENT 'お勧め順',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`knowledge_id`),
  KEY `idx01_t_knowledgemap` (`account_code`,`customer_code`,`facility_code`),
  KEY `idx02_t_knowledgemap` (`account_code`,`customer_code`),
  KEY `idx03_t_knowledgemap` (`knowledgemap_candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82246426 DEFAULT CHARSET=utf8mb4 COMMENT='t_ナレッジマップ';

CREATE TABLE `t_knowledgemap_candidate` (
  `knowledgemap_candidate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_code` varchar(8) DEFAULT NULL COMMENT 'アカウントID',
  `facility_code` varchar(7) DEFAULT NULL COMMENT '施設コード',
  `customer_code` varchar(7) DEFAULT NULL COMMENT '顧客コード',
  `united_product_group_code` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード',
  `activity_category_mid` varchar(2) DEFAULT NULL COMMENT '活動中カテゴリ',
  `activity_category_small` varchar(2) DEFAULT NULL COMMENT '活動小カテゴリ',
  `source_record_class` varchar(2) DEFAULT NULL COMMENT 'ソースレコード種別区分',
  `source_record_id` int(10) unsigned DEFAULT NULL,
  `source_record_date` date DEFAULT NULL COMMENT 'ソースレコード日付',
  `text_summary` varchar(1000) DEFAULT NULL COMMENT '要約テキスト',
  `text_full` varchar(5000) DEFAULT NULL COMMENT 'テキスト全文',
  `ranking_model_score` decimal(6,3) DEFAULT NULL COMMENT 'ランキングモデルスコア',
  `class_assurance_rate` decimal(5,2) DEFAULT NULL COMMENT '分類確信度',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`knowledgemap_candidate_id`),
  KEY `idx01_t_knowledgemap_candidate` (`activity_category_mid`,`activity_category_small`)
) ENGINE=InnoDB AUTO_INCREMENT=302432 DEFAULT CHARSET=utf8mb4 COMMENT='t_ナレッジ候補';

CREATE TABLE `t_knowledgemap_classification_result` (
  `source_record_id` int(10) unsigned NOT NULL,
  `source_record_class` varchar(2) NOT NULL,
  `classification` varchar(2) NOT NULL,
  `knowledge_class` varchar(2) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `text_summary` varchar(300) DEFAULT NULL,
  `class_assurance_rate` decimal(5,2) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`source_record_id`,`source_record_class`,`classification`,`knowledge_class`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_ナレッジ分類結果';

CREATE TABLE `t_knowledgemap_train` (
  `source_record_id` int(10) unsigned NOT NULL,
  `source_record_class` varchar(2) NOT NULL,
  `classification` varchar(2) NOT NULL,
  `knowledge_class` varchar(2) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `knowledgemap_source_text` varchar(300) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`source_record_id`,`source_record_class`,`classification`,`knowledge_class`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_ナレッジマップ学習ソース';

CREATE TABLE `t_m3` (
  `m3_access_log_id` bigint(18) DEFAULT NULL,
  `content_id` varchar(13) DEFAULT NULL,
  `customer_code` varchar(7) DEFAULT NULL,
  `united_product_group_code` varchar(4) DEFAULT NULL COMMENT '統一品目グループコード',
  `m3_content_name` varchar(300) DEFAULT NULL,
  `access_datetime` datetime DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `m3_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`m3_id`),
  KEY `idx01_t_m3` (`m3_access_log_id`,`content_id`,`customer_code`,`access_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=48065 DEFAULT CHARSET=utf8mb4 COMMENT='t_M3';

CREATE TABLE `t_market_size` (
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `united_product_group_code` varchar(4) NOT NULL COMMENT '統一品目グループコード',
  `market_size` decimal(10,0) DEFAULT NULL COMMENT '市場規模',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`customer_code`,`facility_code`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_市場規模';

CREATE TABLE `t_masked_knowledge` (
  `source_record_class` varchar(2) NOT NULL,
  `source_record_id` int(10) unsigned NOT NULL,
  `masked_text` varchar(5000) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`source_record_class`,`source_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_マスキング済ナレッジ';

CREATE TABLE `t_memo_log` (
  `memo_log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(7) DEFAULT NULL,
  `facility_code` varchar(7) DEFAULT NULL,
  `united_product_group_code` varchar(4) DEFAULT NULL,
  `activity_category_mid_code` varchar(2) DEFAULT NULL,
  `source_func` varchar(100) DEFAULT NULL,
  `log_value` varchar(100) DEFAULT NULL,
  `page_id` int(11) unsigned DEFAULT NULL,
  `log_type` varchar(1) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `account_code` varchar(8) DEFAULT NULL,
  `device` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`memo_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19270 DEFAULT CHARSET=utf8mb4 COMMENT='t_メモログ';

CREATE TABLE `t_mr_attended_training` (
  `mr_attended_training_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_code` varchar(8) DEFAULT NULL COMMENT 'アカウントID',
  `training_fiscal_year` varchar(4) DEFAULT NULL COMMENT '研修年度',
  `training_fiscal_term` varchar(1) DEFAULT NULL COMMENT '研修年度期',
  `training_large_class` varchar(4) DEFAULT NULL COMMENT '大分類ID',
  `training_evaluation_item` varchar(4) DEFAULT NULL COMMENT '研修評価項目ID',
  `participate_training_date` date DEFAULT NULL COMMENT '受講終了日時',
  `training_code` varchar(5) DEFAULT NULL COMMENT '親研修評価項目ID',
  `training_name` varchar(50) DEFAULT NULL COMMENT '親研修評価項目名称',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`mr_attended_training_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15183 DEFAULT CHARSET=utf8mb4 COMMENT='t_MR受講研修';

CREATE TABLE `t_mr_test_info` (
  `account_code` varchar(8) NOT NULL,
  `test_fiscal_year` varchar(4) DEFAULT NULL,
  `test_fiscal_term` varchar(1) DEFAULT NULL,
  `test_large_class` varchar(4) DEFAULT NULL,
  `test_code` varchar(4) NOT NULL,
  `subject_code` varchar(4) NOT NULL,
  `take_test_date` date NOT NULL,
  `test_score` decimal(9,2) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`account_code`,`test_code`,`subject_code`,`take_test_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_MR受験テスト';

CREATE TABLE `t_organization` (
  `sequence` mediumint(7) unsigned NOT NULL,
  `seminar_id` int(10) unsigned NOT NULL,
  `organization_type` varchar(3) DEFAULT NULL,
  `united_product_group_code` varchar(4) DEFAULT NULL,
  `promotion_united_product_group_code` varchar(4) DEFAULT NULL,
  `event_start_date` date DEFAULT NULL,
  `event_end_date` date DEFAULT NULL,
  `event_name` varchar(250) DEFAULT NULL,
  `event_title` varchar(700) DEFAULT NULL,
  `chairman_customer_code` varchar(7) DEFAULT NULL,
  `chairman_facility_code` varchar(7) DEFAULT NULL,
  `speaker_customer_code` varchar(7) DEFAULT NULL,
  `speaker_facility_code` varchar(7) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`,`seminar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_組織化';

CREATE TABLE `t_organization_attendee` (
  `seminar_id` int(10) unsigned NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `customer_code` varchar(7) NOT NULL,
  `attended_flag` bit(1) DEFAULT b'0',
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`seminar_id`,`facility_code`,`customer_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_組織化参加者';

CREATE TABLE `t_performance_score` (
  `account_code` varchar(8) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `performance_score` decimal(5,2) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`account_code`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_パフォーマンススコア';

CREATE TABLE `t_population_by_age` (
  `jis_prefecture_code` varchar(2) NOT NULL,
  `sex_class` varchar(1) NOT NULL,
  `age_class` varchar(6) NOT NULL,
  `total_population` int(8) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`jis_prefecture_code`,`sex_class`,`age_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_年代別階級人口';

CREATE TABLE `t_population_density_per_district` (
  `jis_city_code` varchar(5) NOT NULL,
  `population_density` decimal(10,0) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`jis_city_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_市区町村別人口密度';

CREATE TABLE `t_population_secondary_medical_area` (
  `secondary_medical_area_code` varchar(5) NOT NULL,
  `population_by_medical_area` int(9) DEFAULT NULL,
  `over_65_population_by_medical_area` int(9) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`secondary_medical_area_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_2次医療圏別人口';

CREATE TABLE `t_product_score` (
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `customer_code` varchar(7) NOT NULL COMMENT '顧客コード',
  `united_product_group_code` varchar(4) NOT NULL COMMENT '統一品目グループコード',
  `account_code` varchar(8) NOT NULL,
  `product_score` decimal(6,2) DEFAULT NULL,
  `latest_detail_date` date DEFAULT NULL,
  `opt_call_num` double(10,8) DEFAULT NULL,
  `est_sales_amount` double(25,10) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`facility_code`,`customer_code`,`united_product_group_code`,`account_code`),
  KEY `idx01_t_product_score` (`latest_detail_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_品目スコア';

CREATE TABLE `t_quintile` (
  `facility_code` varchar(7) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `quintile_value` varchar(5) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`facility_code`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_クインタイル';

CREATE TABLE `t_role_model_mr_activity_rate` (
  `account_code` varchar(8) NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `customer_code` varchar(7) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `activity_category_mid` varchar(2) NOT NULL,
  `role_model_activity_rate` decimal(6,2) DEFAULT NULL,
  `login_mr_activity_rate` decimal(6,2) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`account_code`,`facility_code`,`customer_code`,`united_product_group_code`,`activity_category_mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_ロールモデルMR活動比率';

CREATE TABLE `t_role_model_score` (
  `account_code` varchar(8) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `role_model_candidate_account_code` varchar(8) NOT NULL,
  `performance_value` decimal(6,2) DEFAULT NULL,
  `similality_value` decimal(6,2) DEFAULT NULL,
  `role_model_score` decimal(6,2) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`account_code`,`united_product_group_code`,`role_model_candidate_account_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_ロールモデルスコア';

CREATE TABLE `t_sales_actual_daily` (
  `sales_journal_number` varchar(15) NOT NULL COMMENT '消化伝票管理番号',
  `delivery_date` date DEFAULT NULL COMMENT '納入年月日',
  `sales_date` date NOT NULL COMMENT '消化処理日',
  `calendar_year_month` date DEFAULT NULL COMMENT '消化月度',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `transfer_facility_code` varchar(7) DEFAULT NULL COMMENT '調剤振替先施設コード',
  `spec_code` varchar(5) DEFAULT NULL COMMENT '規格固定コード',
  `united_product_group_code` varchar(4) NOT NULL COMMENT '統一品目グループコード',
  `account_code` varchar(8) NOT NULL COMMENT 'アカウントID',
  `data_code` varchar(1) DEFAULT NULL COMMENT 'データコード',
  `sales_class` varchar(3) DEFAULT NULL COMMENT '売上区分',
  `converted_quantity` decimal(11,2) DEFAULT NULL COMMENT '換算数量',
  `sales_amount_act` int(10) DEFAULT NULL COMMENT '仕切金額',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`sales_journal_number`,`sales_date`,`facility_code`,`united_product_group_code`,`account_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_消化実績_日次';

CREATE TABLE `t_sales_actual_daily_api_product_alert` (
  `sales_date` date NOT NULL COMMENT '消化年月日',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `united_product_group_code` varchar(4) NOT NULL COMMENT '統一品目グループコード',
  `converted_quantity` decimal(9,2) DEFAULT NULL COMMENT '換算数量',
  `sales_amount_act` int(10) DEFAULT NULL COMMENT '消化実績金額',
  `analysis_date` date NOT NULL COMMENT '分析年月日',
  `alert_flag` bit(1) DEFAULT b'0',
  `alert_text` varchar(300) DEFAULT NULL COMMENT 'アラートテキスト',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`sales_date`,`facility_code`,`united_product_group_code`,`analysis_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_消化実績_日次__自社品アラート';

CREATE TABLE `t_sales_actual_monthly_api_product_alert` (
  `calendar_year_month` date NOT NULL COMMENT '年月',
  `facility_code` varchar(7) NOT NULL COMMENT '施設コード',
  `united_product_group_code` varchar(4) NOT NULL COMMENT '統一品目グループコード',
  `converted_quantity` decimal(11,2) DEFAULT NULL COMMENT '換算数量',
  `sales_amount_act` int(11) DEFAULT NULL COMMENT '仕切金額',
  `alert_flag` bit(1) DEFAULT b'0',
  `alert_text` varchar(300) DEFAULT NULL COMMENT 'アラートテキスト',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`calendar_year_month`,`facility_code`,`united_product_group_code`),
  KEY `idx01_t_sales_actual_monthly_api_product_alert` (`facility_code`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_消化実績_月次_自社品アラート';

CREATE TABLE `t_sales_actual_monthly_compe_alert` (
  `sales_actual_monthly_compe_alert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_year_month` date NOT NULL COMMENT '年月',
  `brick_code` varchar(10) NOT NULL COMMENT 'ブリックコード',
  `ddd_product_code` varchar(3) NOT NULL COMMENT '明細項目コード',
  `ddd_market_code` varchar(3) NOT NULL COMMENT '集計項目コード',
  `sales_amount_act` int(11) DEFAULT NULL COMMENT '消化実績金額',
  `alert_flag` bit(1) DEFAULT b'0',
  `alert_text` varchar(300) DEFAULT NULL COMMENT 'アラートテキスト',
  `created_by` varchar(10) DEFAULT NULL COMMENT '作成者コード',
  `created_date` datetime DEFAULT NULL COMMENT '作成年月日',
  `updated_by` varchar(10) DEFAULT NULL COMMENT '更新者コード',
  `updated_date` datetime DEFAULT NULL COMMENT '更新年月日',
  PRIMARY KEY (`sales_actual_monthly_compe_alert_id`,`calendar_year_month`,`brick_code`,`ddd_product_code`,`ddd_market_code`),
  KEY `idx01_t_sales_actual_monthly_compe_alert` (`ddd_market_code`,`ddd_product_code`),
  KEY `idx02_t_sales_actual_monthly_compe_alert` (`ddd_product_code`),
  KEY `idx03_t_sales_actual_monthly_compe_alert` (`brick_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9219059 DEFAULT CHARSET=utf8mb4 COMMENT='t_消化実績_月次_他社品アラート';

CREATE TABLE `t_sales_actual_term` (
  `tran_year` varchar(4) NOT NULL,
  `term` varchar(1) NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `person_in_charge_code` varchar(5) DEFAULT NULL,
  `account_code` varchar(8) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `sales_amount_budget` int(11) DEFAULT NULL,
  `sales_amount_act` int(11) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`tran_year`,`term`,`facility_code`,`account_code`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_消化計画実績_期';

CREATE TABLE `t_sales_budget_term` (
  `tran_year` varchar(4) NOT NULL,
  `term` varchar(1) NOT NULL,
  `facility_code` varchar(7) NOT NULL,
  `person_in_charge_code` varchar(5) DEFAULT NULL,
  `account_code` varchar(8) NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `sales_amount_budget` int(11) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`tran_year`,`term`,`facility_code`,`account_code`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_消化計画_期';

CREATE TABLE `t_summary_text` (
  `source_record_class` varchar(2) NOT NULL,
  `source_record_id` int(10) unsigned NOT NULL,
  `united_product_group_code` varchar(4) NOT NULL,
  `text_summary` varchar(300) DEFAULT NULL,
  `created_by` varchar(10) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`source_record_class`,`source_record_id`,`united_product_group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='t_要約テキスト';
