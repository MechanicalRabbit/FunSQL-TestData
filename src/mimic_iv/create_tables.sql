CREATE TABLE admissions
(
  subject_id           INTEGER NOT NULL,
  hadm_id              INTEGER NOT NULL,
  admittime            TIMESTAMP NOT NULL,
  dischtime            TIMESTAMP,
  deathtime            TIMESTAMP,
  admission_type       VARCHAR NOT NULL,
  admit_provider_id    VARCHAR,
  admission_location   VARCHAR,
  discharge_location   VARCHAR,
  insurance            VARCHAR,
  "language"           VARCHAR,
  marital_status       VARCHAR,
  race                 VARCHAR,
  edregtime            TIMESTAMP,
  edouttime            TIMESTAMP,
  hospital_expire_flag SMALLINT
);

CREATE TABLE caregiver
(
   caregiver_id INTEGER NOT NULL
);

CREATE TABLE chartevents
(
   subject_id   INTEGER NOT NULL,
   hadm_id      INTEGER NOT NULL,
   stay_id      INTEGER NOT NULL,
   caregiver_id INTEGER,
   charttime    TIMESTAMP NOT NULL,
   storetime    TIMESTAMP,
   itemid       INTEGER NOT NULL,
   "value"      VARCHAR,
   valuenum     FLOAT,
   valueuom     VARCHAR,
   warning      SMALLINT
);

CREATE TABLE datetimeevents
(
   subject_id   INTEGER NOT NULL,
   hadm_id      INTEGER NOT NULL,
   stay_id      INTEGER NOT NULL,
   caregiver_id INTEGER,
   charttime    TIMESTAMP NOT NULL,
   storetime    TIMESTAMP,
   itemid       INTEGER NOT NULL,
   "value"      TIMESTAMP NOT NULL,
   valueuom     VARCHAR,
   warning      SMALLINT
);

CREATE TABLE diagnoses_icd
(
   subject_id  INTEGER NOT NULL,
   hadm_id     INTEGER NOT NULL,
   seq_num     INTEGER NOT NULL,
   icd_code    VARCHAR,
   icd_version SMALLINT
);

CREATE TABLE drgcodes
(
   subject_id    INTEGER NOT NULL,
   hadm_id       INTEGER NOT NULL,
   drg_type      VARCHAR,
   drg_code      VARCHAR NOT NULL,
   description   VARCHAR,
   drg_severity  SMALLINT,
   drg_mortality SMALLINT
);

CREATE TABLE d_hcpcs
(
   code              VARCHAR NOT NULL,
   category          SMALLINT,
   long_description  VARCHAR,
   short_description VARCHAR
);

CREATE TABLE d_icd_diagnoses
(
   icd_code    VARCHAR NOT NULL,
   icd_version SMALLINT NOT NULL,
   long_title  VARCHAR
);

CREATE TABLE d_icd_procedures
(
   icd_code    VARCHAR NOT NULL,
   icd_version SMALLINT NOT NULL,
   long_title  VARCHAR
);

CREATE TABLE d_items
(
   itemid          INTEGER NOT NULL,
   "label"         VARCHAR NOT NULL,
   abbreviation    VARCHAR NOT NULL,
   linksto         VARCHAR NOT NULL,
   category        VARCHAR NOT NULL,
   unitname        VARCHAR,
   param_type      VARCHAR NOT NULL,
   lownormalvalue  FLOAT,
   highnormalvalue FLOAT
);

CREATE TABLE d_labitems
(
   itemid   INTEGER NOT NULL,
   "label"  VARCHAR,
   fluid    VARCHAR,
   category VARCHAR
);

CREATE TABLE emar
(
   subject_id        INTEGER NOT NULL,
   hadm_id           INTEGER,
   emar_id           VARCHAR NOT NULL,
   emar_seq          INTEGER NOT NULL,
   poe_id            VARCHAR NOT NULL,
   pharmacy_id       INTEGER,
   enter_provider_id VARCHAR,
   charttime         TIMESTAMP NOT NULL,
   medication        VARCHAR,
   event_txt         VARCHAR,
   scheduletime      TIMESTAMP,
   storetime         TIMESTAMP NOT NULL
);

CREATE TABLE emar_detail
(
   subject_id                           INTEGER NOT NULL,
   emar_id                              VARCHAR NOT NULL,
   emar_seq                             INTEGER NOT NULL,
   parent_field_ordinal                 VARCHAR,
   administration_type                  VARCHAR,
   pharmacy_id                          INTEGER,
   barcode_type                         VARCHAR,
   reason_for_no_barcode                VARCHAR,
   complete_dose_not_given              VARCHAR,
   dose_due                             VARCHAR,
   dose_due_unit                        VARCHAR,
   dose_given                           VARCHAR,
   dose_given_unit                      VARCHAR,
   will_remainder_of_dose_be_given      VARCHAR,
   product_amount_given                 VARCHAR,
   product_unit                         VARCHAR,
   product_code                         VARCHAR,
   product_description                  VARCHAR,
   product_description_other            VARCHAR,
   prior_infusion_rate                  VARCHAR,
   infusion_rate                        VARCHAR,
   infusion_rate_adjustment             VARCHAR,
   infusion_rate_adjustment_amount      VARCHAR,
   infusion_rate_unit                   VARCHAR,
   route                                VARCHAR,
   infusion_complete                    VARCHAR,
   completion_interval                  VARCHAR,
   new_iv_bag_hung                      VARCHAR,
   continued_infusion_in_other_location VARCHAR,
   restart_interval                     VARCHAR,
   side                                 VARCHAR,
   site                                 VARCHAR,
   non_formulary_visual_verification    VARCHAR
);

CREATE TABLE hcpcsevents
(
   subject_id        INTEGER NOT NULL,
   hadm_id           INTEGER NOT NULL,
   chartdate         DATE,
   hcpcs_cd          VARCHAR NOT NULL,
   seq_num           INTEGER NOT NULL,
   short_description VARCHAR
);

CREATE TABLE icustays
(
   subject_id     INTEGER NOT NULL,
   hadm_id        INTEGER NOT NULL,
   stay_id        INTEGER NOT NULL,
   first_careunit VARCHAR,
   last_careunit  VARCHAR,
   intime         TIMESTAMP,
   outtime        TIMESTAMP,
   los            FLOAT
);

CREATE TABLE ingredientevents
(
   subject_id        INTEGER NOT NULL,
   hadm_id           INTEGER NOT NULL,
   stay_id           INTEGER,
   caregiver_id      INTEGER,
   starttime         TIMESTAMP NOT NULL,
   endtime           TIMESTAMP NOT NULL,
   storetime         TIMESTAMP,
   itemid            INTEGER NOT NULL,
   amount            FLOAT,
   amountuom         VARCHAR,
   rate              FLOAT,
   rateuom           VARCHAR,
   orderid           INTEGER NOT NULL,
   linkorderid       INTEGER,
   statusdescription VARCHAR,
   originalamount    FLOAT,
   originalrate      FLOAT
);

CREATE TABLE inputevents
(
   subject_id                    INTEGER NOT NULL,
   hadm_id                       INTEGER NOT NULL,
   stay_id                       INTEGER,
   caregiver_id                  INTEGER,
   starttime                     TIMESTAMP NOT NULL,
   endtime                       TIMESTAMP NOT NULL,
   storetime                     TIMESTAMP,
   itemid                        INTEGER NOT NULL,
   amount                        FLOAT,
   amountuom                     VARCHAR,
   rate                          FLOAT,
   rateuom                       VARCHAR,
   orderid                       INTEGER NOT NULL,
   linkorderid                   INTEGER,
   ordercategoryname             VARCHAR,
   secondaryordercategoryname    VARCHAR,
   ordercomponenttypedescription VARCHAR,
   ordercategorydescription      VARCHAR,
   patientweight                 FLOAT,
   totalamount                   FLOAT,
   totalamountuom                VARCHAR,
   isopenbag                     SMALLINT,
   continueinnextdept            SMALLINT,
   statusdescription             VARCHAR,
   originalamount                FLOAT,
   originalrate                  FLOAT
);

CREATE TABLE labevents
(
   labevent_id       INTEGER NOT NULL,
   subject_id        INTEGER NOT NULL,
   hadm_id           INTEGER,
   specimen_id       INTEGER NOT NULL,
   itemid            INTEGER NOT NULL,
   order_provider_id VARCHAR,
   charttime         TIMESTAMP,
   storetime         TIMESTAMP,
   "value"           VARCHAR,
   valuenum          DOUBLE,
   valueuom          VARCHAR,
   ref_range_lower   DOUBLE,
   ref_range_upper   DOUBLE,
   flag              VARCHAR,
   priority          VARCHAR,
   "comments"        VARCHAR
);

CREATE TABLE microbiologyevents
(
   microevent_id       INTEGER NOT NULL,
   subject_id          INTEGER NOT NULL,
   hadm_id             INTEGER,
   micro_specimen_id   INTEGER NOT NULL,
   order_provider_id   VARCHAR,
   chartdate           TIMESTAMP NOT NULL,
   charttime           TIMESTAMP,
   spec_itemid         INTEGER NOT NULL,
   spec_type_desc      VARCHAR,
   test_seq            INTEGER NOT NULL,
   storedate           TIMESTAMP,
   storetime           TIMESTAMP,
   test_itemid         INTEGER,
   test_name           VARCHAR,
   org_itemid          INTEGER,
   org_name            VARCHAR,
   isolate_num         SMALLINT,
   quantity            VARCHAR,
   ab_itemid           INTEGER,
   ab_name             VARCHAR,
   dilution_text       VARCHAR,
   dilution_comparison VARCHAR,
   dilution_value      DOUBLE,
   interpretation      VARCHAR,
   "comments"          VARCHAR
);

CREATE TABLE omr
(
   subject_id   INTEGER NOT NULL,
   chartdate    DATE NOT NULL,
   seq_num      INTEGER NOT NULL,
   result_name  VARCHAR NOT NULL,
   result_value VARCHAR NOT NULL
);

CREATE TABLE outputevents
(
   subject_id   INTEGER NOT NULL,
   hadm_id      INTEGER NOT NULL,
   stay_id      INTEGER NOT NULL,
   caregiver_id INTEGER,
   charttime    TIMESTAMP NOT NULL,
   storetime    TIMESTAMP NOT NULL,
   itemid       INTEGER NOT NULL,
   "value"      FLOAT NOT NULL,
   valueuom     VARCHAR
);

CREATE TABLE patients
(
   subject_id        INTEGER NOT NULL,
   gender            VARCHAR NOT NULL,
   anchor_age        SMALLINT,
   anchor_year       SMALLINT NOT NULL,
   anchor_year_group VARCHAR NOT NULL,
   dod               DATE
);

CREATE TABLE pharmacy
(
   subject_id        INTEGER NOT NULL,
   hadm_id           INTEGER NOT NULL,
   pharmacy_id       INTEGER NOT NULL,
   poe_id            VARCHAR,
   starttime         TIMESTAMP,
   stoptime          TIMESTAMP,
   medication        VARCHAR,
   proc_type         VARCHAR NOT NULL,
   status            VARCHAR,
   entertime         TIMESTAMP NOT NULL,
   verifiedtime      TIMESTAMP,
   route             VARCHAR,
   frequency         VARCHAR,
   disp_sched        VARCHAR,
   infusion_type     VARCHAR,
   sliding_scale     VARCHAR,
   lockout_interval  VARCHAR,
   basal_rate        FLOAT,
   one_hr_max        VARCHAR,
   doses_per_24_hrs  FLOAT,
   duration          FLOAT,
   duration_interval VARCHAR,
   expiration_value  INTEGER,
   expiration_unit   VARCHAR,
   expirationdate    TIMESTAMP,
   dispensation      VARCHAR,
   fill_quantity     VARCHAR
);

CREATE TABLE poe
(
   poe_id                 VARCHAR NOT NULL,
   poe_seq                INTEGER NOT NULL,
   subject_id             INTEGER NOT NULL,
   hadm_id                INTEGER,
   ordertime              TIMESTAMP NOT NULL,
   order_type             VARCHAR NOT NULL,
   order_subtype          VARCHAR,
   transaction_type       VARCHAR,
   discontinue_of_poe_id  VARCHAR,
   discontinued_by_poe_id VARCHAR,
   order_provider_id      VARCHAR,
   order_status           VARCHAR
);

CREATE TABLE poe_detail
(
   poe_id      VARCHAR NOT NULL,
   poe_seq     INTEGER NOT NULL,
   subject_id  INTEGER NOT NULL,
   field_name  VARCHAR NOT NULL,
   field_value VARCHAR
);

CREATE TABLE prescriptions
(
   subject_id        INTEGER NOT NULL,
   hadm_id           INTEGER NOT NULL,
   pharmacy_id       INTEGER NOT NULL,
   poe_id            VARCHAR,
   poe_seq           INTEGER,
   order_provider_id VARCHAR,
   starttime         TIMESTAMP,
   stoptime          TIMESTAMP,
   drug_type         VARCHAR NOT NULL,
   drug              VARCHAR,
   formulary_drug_cd VARCHAR,
   gsn               VARCHAR,
   ndc               VARCHAR,
   prod_strength     VARCHAR,
   form_rx           VARCHAR,
   dose_val_rx       VARCHAR,
   dose_unit_rx      VARCHAR,
   form_val_disp     VARCHAR,
   form_unit_disp    VARCHAR,
   doses_per_24_hrs  FLOAT,
   route             VARCHAR
);

CREATE TABLE procedureevents
(
   subject_id               INTEGER NOT NULL,
   hadm_id                  INTEGER NOT NULL,
   stay_id                  INTEGER NOT NULL,
   caregiver_id             INTEGER,
   starttime                TIMESTAMP NOT NULL,
   endtime                  TIMESTAMP NOT NULL,
   storetime                TIMESTAMP NOT NULL,
   itemid                   INTEGER NOT NULL,
   "value"                  FLOAT,
   valueuom                 VARCHAR,
   "location"               VARCHAR,
   locationcategory         VARCHAR,
   orderid                  INTEGER,
   linkorderid              INTEGER,
   ordercategoryname        VARCHAR,
   ordercategorydescription VARCHAR,
   patientweight            FLOAT,
   isopenbag                SMALLINT,
   continueinnextdept       SMALLINT,
   statusdescription        VARCHAR,
   originalamount           FLOAT,
   originalrate             FLOAT
);

CREATE TABLE procedures_icd
(
   subject_id  INTEGER NOT NULL,
   hadm_id     INTEGER NOT NULL,
   seq_num     INTEGER NOT NULL,
   chartdate   DATE NOT NULL,
   icd_code    VARCHAR,
   icd_version SMALLINT
);

CREATE TABLE provider
(
   provider_id VARCHAR NOT NULL
);

CREATE TABLE services
(
   subject_id   INTEGER NOT NULL,
   hadm_id      INTEGER NOT NULL,
   transfertime TIMESTAMP NOT NULL,
   prev_service VARCHAR,
   curr_service VARCHAR
);

CREATE TABLE transfers
(
   subject_id  INTEGER NOT NULL,
   hadm_id     INTEGER,
   transfer_id INTEGER NOT NULL,
   eventtype   VARCHAR,
   careunit    VARCHAR,
   intime      TIMESTAMP,
   outtime     TIMESTAMP
);