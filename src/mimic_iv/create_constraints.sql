ALTER TABLE admissions
ADD CONSTRAINT admissions_pk
  PRIMARY KEY (hadm_id);

ALTER TABLE d_hcpcs
ADD CONSTRAINT d_hcpcs_pk
  PRIMARY KEY (code);

ALTER TABLE diagnoses_icd
ADD CONSTRAINT diagnoses_icd_pk
  PRIMARY KEY (hadm_id, seq_num, icd_code, icd_version);

ALTER TABLE d_icd_diagnoses
ADD CONSTRAINT d_icd_diagnoses_pk
  PRIMARY KEY (icd_code, icd_version);

ALTER TABLE d_icd_procedures
ADD CONSTRAINT d_icd_procedures_pk
  PRIMARY KEY (icd_code, icd_version);

ALTER TABLE d_labitems
ADD CONSTRAINT d_labitems_pk
  PRIMARY KEY (itemid);

-- ALTER TABLE emar_detail ADD CONSTRAINT emar_detail_pk PRIMARY KEY (emar_id, parent_field_ordinal);

ALTER TABLE emar
ADD CONSTRAINT emar_pk
  PRIMARY KEY (emar_id);

ALTER TABLE hcpcsevents
ADD CONSTRAINT hcpcsevents_pk
  PRIMARY KEY (hadm_id, hcpcs_cd, seq_num);

ALTER TABLE labevents
ADD CONSTRAINT labevents_pk
  PRIMARY KEY (labevent_id);

ALTER TABLE microbiologyevents
ADD CONSTRAINT microbiologyevents_pk
  PRIMARY KEY (microevent_id);

ALTER TABLE patients
ADD CONSTRAINT patients_pk
  PRIMARY KEY (subject_id);

ALTER TABLE pharmacy
ADD CONSTRAINT pharmacy_pk
  PRIMARY KEY (pharmacy_id);

ALTER TABLE poe_detail
ADD CONSTRAINT poe_detail_pk
  PRIMARY KEY (poe_id, field_name);

ALTER TABLE poe
ADD CONSTRAINT poe_pk
  PRIMARY KEY (poe_id);

ALTER TABLE prescriptions
ADD CONSTRAINT prescriptions_pk
  PRIMARY KEY (pharmacy_id, drug_type, drug);

ALTER TABLE procedures_icd
ADD CONSTRAINT procedures_icd_pk
  PRIMARY KEY (hadm_id, seq_num, icd_code, icd_version);

ALTER TABLE services
ADD CONSTRAINT services_pk
  PRIMARY KEY (hadm_id, transfertime, curr_service);

ALTER TABLE datetimeevents
ADD CONSTRAINT datetimeevents_pk
  PRIMARY KEY (stay_id, itemid, charttime);

ALTER TABLE d_items
ADD CONSTRAINT d_items_pk
  PRIMARY KEY (itemid);

ALTER TABLE icustays
ADD CONSTRAINT icustays_pk
  PRIMARY KEY (stay_id);

ALTER TABLE inputevents
ADD CONSTRAINT inputevents_pk
  PRIMARY KEY (orderid, itemid);

ALTER TABLE outputevents
ADD CONSTRAINT outputevents_pk
  PRIMARY KEY (stay_id, charttime, itemid);

ALTER TABLE procedureevents
ADD CONSTRAINT procedureevents_pk
  PRIMARY KEY (orderid);


ALTER TABLE admissions
ADD CONSTRAINT admissions_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);

ALTER TABLE diagnoses_icd
ADD CONSTRAINT diagnoses_icd_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE diagnoses_icd
ADD CONSTRAINT diagnoses_icd_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);

ALTER TABLE drgcodes
ADD CONSTRAINT drgcodes_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE drgcodes
ADD CONSTRAINT drgcodes_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);

ALTER TABLE emar_detail
ADD CONSTRAINT emar_detail_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE emar_detail
ADD CONSTRAINT emar_detail_emar_fk
  FOREIGN KEY (emar_id)
  REFERENCES emar (emar_id);

ALTER TABLE emar
ADD CONSTRAINT emar_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE emar
ADD CONSTRAINT emar_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);

ALTER TABLE hcpcsevents
ADD CONSTRAINT hcpcsevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE hcpcsevents
ADD CONSTRAINT hcpcsevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);
ALTER TABLE hcpcsevents
ADD CONSTRAINT hcpcsevents_d_hcpcs_fk
  FOREIGN KEY (hcpcs_cd)
  REFERENCES d_hcpcs (code);

ALTER TABLE labevents
ADD CONSTRAINT labevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE labevents
ADD CONSTRAINT labevents_d_labitems_fk
  FOREIGN KEY (itemid)
  REFERENCES d_labitems (itemid);

ALTER TABLE microbiologyevents
ADD CONSTRAINT microbiologyevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE microbiologyevents
ADD CONSTRAINT microbiologyevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);

ALTER TABLE pharmacy
ADD CONSTRAINT pharmacy_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE pharmacy
ADD CONSTRAINT pharmacy_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);

ALTER TABLE poe_detail
ADD CONSTRAINT poe_detail_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE poe_detail
ADD CONSTRAINT poe_detail_poe_fk
  FOREIGN KEY (poe_id)
  REFERENCES poe (poe_id);

ALTER TABLE poe
ADD CONSTRAINT poe_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE poe
ADD CONSTRAINT poe_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);

ALTER TABLE prescriptions
ADD CONSTRAINT prescriptions_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE prescriptions
ADD CONSTRAINT prescriptions_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);

ALTER TABLE procedures_icd
ADD CONSTRAINT procedures_icd_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE procedures_icd
ADD CONSTRAINT procedures_icd_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);

ALTER TABLE services
ADD CONSTRAINT services_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE services
ADD CONSTRAINT services_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);

ALTER TABLE transfers
ADD CONSTRAINT transfers_pk
  PRIMARY KEY (transfer_id);

ALTER TABLE transfers
ADD CONSTRAINT transfers_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);


ALTER TABLE chartevents
ADD CONSTRAINT chartevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE chartevents
ADD CONSTRAINT chartevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);
ALTER TABLE chartevents
ADD CONSTRAINT chartevents_icustays_fk
  FOREIGN KEY (stay_id)
  REFERENCES icustays (stay_id);
ALTER TABLE chartevents
ADD CONSTRAINT chartevents_d_items_fk
  FOREIGN KEY (itemid)
  REFERENCES d_items (itemid);

ALTER TABLE datetimeevents
ADD CONSTRAINT datetimeevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE datetimeevents
ADD CONSTRAINT datetimeevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);
ALTER TABLE datetimeevents
ADD CONSTRAINT datetimeevents_icustays_fk
  FOREIGN KEY (stay_id)
  REFERENCES icustays (stay_id);
ALTER TABLE datetimeevents
ADD CONSTRAINT datetimeevents_d_items_fk
  FOREIGN KEY (itemid)
  REFERENCES d_items (itemid);

ALTER TABLE icustays
ADD CONSTRAINT icustays_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE icustays
ADD CONSTRAINT icustays_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);

ALTER TABLE inputevents
ADD CONSTRAINT inputevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE inputevents
ADD CONSTRAINT inputevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);
ALTER TABLE inputevents
ADD CONSTRAINT inputevents_icustays_fk
  FOREIGN KEY (stay_id)
  REFERENCES icustays (stay_id);
ALTER TABLE inputevents
ADD CONSTRAINT inputevents_d_items_fk
  FOREIGN KEY (itemid)
  REFERENCES d_items (itemid);

ALTER TABLE outputevents
ADD CONSTRAINT outputevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE outputevents
ADD CONSTRAINT outputevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);
ALTER TABLE outputevents
ADD CONSTRAINT outputevents_icustays_fk
  FOREIGN KEY (stay_id)
  REFERENCES icustays (stay_id);
ALTER TABLE outputevents
ADD CONSTRAINT outputevents_d_items_fk
  FOREIGN KEY (itemid)
  REFERENCES d_items (itemid);

ALTER TABLE procedureevents
ADD CONSTRAINT procedureevents_patients_fk
  FOREIGN KEY (subject_id)
  REFERENCES patients (subject_id);
ALTER TABLE procedureevents
ADD CONSTRAINT procedureevents_admissions_fk
  FOREIGN KEY (hadm_id)
  REFERENCES admissions (hadm_id);
ALTER TABLE procedureevents
ADD CONSTRAINT procedureevents_icustays_fk
  FOREIGN KEY (stay_id)
  REFERENCES icustays (stay_id);
ALTER TABLE procedureevents
ADD CONSTRAINT procedureevents_d_items_fk
  FOREIGN KEY (itemid)
  REFERENCES d_items (itemid);
