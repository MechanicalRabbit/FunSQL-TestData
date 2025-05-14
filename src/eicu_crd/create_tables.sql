CREATE TABLE apacheapsvar(apacheapsvarid BIGINT, patientunitstayid BIGINT, intubated BIGINT, vent BIGINT, dialysis BIGINT, eyes BIGINT, motor BIGINT, verbal BIGINT, meds BIGINT, urine DOUBLE, wbc DOUBLE, temperature DOUBLE, respiratoryrate DOUBLE, sodium DOUBLE, heartrate DOUBLE, meanbp DOUBLE, ph DOUBLE, hematocrit DOUBLE, creatinine DOUBLE, albumin DOUBLE, pao2 DOUBLE, pco2 DOUBLE, bun DOUBLE, glucose DOUBLE, bilirubin DOUBLE, fio2 DOUBLE);

CREATE TABLE apachepatientresult(apachepatientresultsid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, physicianspeciality VARCHAR, physicianinterventioncategory VARCHAR, acutephysiologyscore BIGINT, apachescore BIGINT, apacheversion VARCHAR NOT NULL, predictedicumortality VARCHAR, actualicumortality VARCHAR, predictediculos DOUBLE, actualiculos DOUBLE, predictedhospitalmortality VARCHAR, actualhospitalmortality VARCHAR, predictedhospitallos DOUBLE, actualhospitallos DOUBLE, preopmi BIGINT, preopcardiaccath BIGINT, ptcawithin24h BIGINT, unabridgedunitlos DOUBLE, unabridgedhosplos DOUBLE, actualventdays DOUBLE, predventdays DOUBLE, unabridgedactualventdays DOUBLE);

CREATE TABLE apachepredvar(apachepredvarid BIGINT, patientunitstayid BIGINT, sicuday BIGINT, saps3day1 BIGINT, saps3today BIGINT, saps3yesterday BIGINT, gender BIGINT, teachtype BIGINT, region BIGINT, bedcount BIGINT, admitsource BIGINT, graftcount BIGINT, meds BIGINT, verbal BIGINT, motor BIGINT, eyes BIGINT, age BIGINT, admitdiagnosis VARCHAR, thrombolytics BIGINT, diedinhospital BIGINT, aids BIGINT, hepaticfailure BIGINT, lymphoma BIGINT, metastaticcancer BIGINT, leukemia BIGINT, immunosuppression BIGINT, cirrhosis BIGINT, electivesurgery BIGINT, activetx BIGINT, readmit BIGINT, ima BIGINT, midur BIGINT, ventday1 BIGINT, oobventday1 BIGINT, oobintubday1 BIGINT, diabetes BIGINT, managementsystem BIGINT, var03hspxlos DOUBLE, pao2 DOUBLE, fio2 DOUBLE, ejectfx DOUBLE, creatinine DOUBLE, dischargelocation BIGINT, visitnumber BIGINT, amilocation BIGINT, day1meds BIGINT, day1verbal BIGINT, day1motor BIGINT, day1eyes BIGINT, day1pao2 DOUBLE, day1fio2 DOUBLE);

CREATE TABLE careplancareprovider(cplcareprovderid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, careprovidersaveoffset BIGINT NOT NULL, providertype VARCHAR, specialty VARCHAR, interventioncategory VARCHAR, managingphysician VARCHAR, activeupondischarge VARCHAR NOT NULL);

CREATE TABLE careplaneol(cpleolid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, cpleolsaveoffset BIGINT NOT NULL, cpleoldiscussionoffset BIGINT, activeupondischarge VARCHAR);

CREATE TABLE careplangeneral(cplgeneralid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, activeupondischarge VARCHAR NOT NULL, cplitemoffset BIGINT NOT NULL, cplgroup VARCHAR NOT NULL, cplitemvalue VARCHAR);

CREATE TABLE careplangoal(cplgoalid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, CPLGOALoffset BIGINT NOT NULL, CPLGOALCATEGORY VARCHAR, CPLGOALVALUE VARCHAR, CPLGOALSTATUS VARCHAR, ACTIVEUPONDISCHARGE VARCHAR NOT NULL);

CREATE TABLE careplaninfectiousdisease(cplinfectid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, activeupondischarge VARCHAR NOT NULL, cplinfectdiseaseoffset BIGINT NOT NULL, infectdiseasesite VARCHAR, infectdiseaseassessment VARCHAR, responsetotherapy VARCHAR, treatment VARCHAR);

CREATE TABLE diagnosis(diagnosisid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, activeupondischarge VARCHAR, diagnosisoffset BIGINT NOT NULL, diagnosisstring VARCHAR NOT NULL, icd9code VARCHAR, diagnosispriority VARCHAR NOT NULL);

CREATE TABLE hospital(hospitalid BIGINT NOT NULL, numbedscategory VARCHAR, teachingstatus VARCHAR, region VARCHAR);

CREATE TABLE infusiondrug(infusiondrugid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, infusionoffset BIGINT NOT NULL, drugname VARCHAR NULL, drugrate VARCHAR, infusionrate VARCHAR, drugamount VARCHAR, volumeoffluid VARCHAR, patientweight VARCHAR);

CREATE TABLE intakeoutput(intakeoutputid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, intakeoutputoffset BIGINT NOT NULL, intaketotal DOUBLE, outputtotal DOUBLE, dialysistotal DOUBLE, nettotal DOUBLE, intakeoutputentryoffset BIGINT NOT NULL, cellpath VARCHAR, celllabel VARCHAR, cellvaluenumeric DOUBLE NOT NULL, cellvaluetext VARCHAR NOT NULL);

CREATE TABLE lab(labid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, labresultoffset BIGINT NOT NULL, labtypeid DOUBLE NOT NULL, labname VARCHAR, labresult DOUBLE, labresulttext VARCHAR, labmeasurenamesystem VARCHAR, labmeasurenameinterface VARCHAR, labresultrevisedoffset BIGINT);

CREATE TABLE medication(medicationid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, drugorderoffset BIGINT NOT NULL, drugstartoffset BIGINT NOT NULL, drugivadmixture VARCHAR NOT NULL, drugordercancelled VARCHAR NOT NULL, drugname VARCHAR, drughiclseqno BIGINT, dosage VARCHAR, routeadmin VARCHAR, frequency VARCHAR, loadingdose VARCHAR, prn VARCHAR, drugstopoffset BIGINT NOT NULL, gtc BIGINT NOT NULL);

CREATE TABLE microlab(microlabid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, culturetakenoffset BIGINT NOT NULL, culturesite VARCHAR NOT NULL, organism VARCHAR NOT NULL, antibiotic VARCHAR, sensitivitylevel VARCHAR);

CREATE TABLE note(NOTEID BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, NOTEOFFSET BIGINT NOT NULL, NOTEENTEREDOFFSET BIGINT NOT NULL, NOTETYPE VARCHAR NOT NULL, NOTEPATH VARCHAR NOT NULL, NOTEVALUE VARCHAR, NOTETEXT VARCHAR);

CREATE TABLE pasthistory(pasthistoryid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, pasthistoryoffset BIGINT NOT NULL, pasthistoryenteredoffset BIGINT NOT NULL, pasthistorynotetype VARCHAR, pasthistorypath VARCHAR NOT NULL, pasthistoryvalue VARCHAR, pasthistoryvaluetext VARCHAR);

CREATE TABLE patient(patientunitstayid BIGINT, patienthealthsystemstayid BIGINT, gender VARCHAR, age VARCHAR, ethnicity VARCHAR, hospitalid BIGINT, wardid BIGINT, apacheadmissiondx VARCHAR, admissionheight DOUBLE, hospitaladmittime24 VARCHAR, hospitaladmitoffset BIGINT, hospitaladmitsource VARCHAR, hospitaldischargeyear BIGINT, hospitaldischargetime24 VARCHAR, hospitaldischargeoffset BIGINT, hospitaldischargelocation VARCHAR, hospitaldischargestatus VARCHAR, unittype VARCHAR, unitadmittime24 VARCHAR, unitadmitsource VARCHAR, unitvisitnumber BIGINT, unitstaytype VARCHAR, admissionweight DOUBLE, dischargeweight DOUBLE, unitdischargetime24 VARCHAR, unitdischargeoffset BIGINT, unitdischargelocation VARCHAR, unitdischargestatus VARCHAR, uniquepid VARCHAR);

CREATE TABLE physicalexam(physicalexamid BIGINT, patientunitstayid BIGINT NOT NULL, physicalexamoffset BIGINT NOT NULL, physicalexampath VARCHAR NOT NULL, physicalexamvalue VARCHAR, physicalexamtext VARCHAR);

CREATE TABLE treatment(treatmentid BIGINT, patientunitstayid BIGINT, treatmentoffset BIGINT, treatmentstring VARCHAR, activeupondischarge VARCHAR);

CREATE TABLE vitalaperiodic(vitalaperiodicid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, observationoffset BIGINT NOT NULL, noninvasivesystolic DOUBLE, noninvasivediastolic DOUBLE, noninvasivemean DOUBLE, paop DOUBLE, cardiacoutput DOUBLE, cardiacinput DOUBLE, svr DOUBLE, svri DOUBLE, pvr DOUBLE, pvri DOUBLE);

CREATE TABLE vitalperiodic(vitalperiodicid BIGINT, patientunitstayid BIGINT, observationoffset BIGINT, temperature DOUBLE, sao2 BIGINT, heartrate BIGINT, respiration BIGINT, cvp BIGINT, etco2 BIGINT, systemicsystolic BIGINT, systemicdiastolic BIGINT, systemicmean BIGINT, pasystolic BIGINT, padiastolic BIGINT, pamean BIGINT, st1 DOUBLE, st2 DOUBLE, st3 DOUBLE, icp BIGINT);

CREATE TABLE nurseassessment(nurseassessid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, NURSEASSESSOFFSET BIGINT NOT NULL, NURSEASSESSENTRYOFFSET BIGINT NOT NULL, CELLATTRIBUTEPATH VARCHAR NOT NULL, CELLLABEL VARCHAR NOT NULL, CELLATTRIBUTE VARCHAR NOT NULL, CELLATTRIBUTEVALUE VARCHAR);

CREATE TABLE nursecare(nursecareid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, CELLLABEL VARCHAR NOT NULL, NURSECAREOFFSET BIGINT NOT NULL, NURSECAREENTRYOFFSET BIGINT NOT NULL, CELLATTRIBUTEPATH VARCHAR NOT NULL, CELLATTRIBUTE VARCHAR NOT NULL, CELLATTRIBUTEVALUE VARCHAR);

CREATE TABLE nursecharting(nursingchartid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, NURSINGCHARTOFFSET BIGINT NOT NULL, NURSINGCHARTENTRYOFFSET BIGINT NOT NULL, NURSINGCHARTCELLTYPECAT VARCHAR NOT NULL, NURSINGCHARTCELLTYPEVALLABEL VARCHAR, NURSINGCHARTCELLTYPEVALNAME VARCHAR, NURSINGCHARTVALUE VARCHAR);

CREATE TABLE respiratorycare(RESPCAREID BIGINT, PATIENTUNITSTAYID BIGINT, RESPCARESTATUSOFFSET BIGINT, CURRENTHISTORYSEQNUM BIGINT, AIRWAYTYPE VARCHAR, AIRWAYSIZE VARCHAR, AIRWAYPOSITION VARCHAR, CUFFPRESSURE DOUBLE, VENTSTARTOFFSET BIGINT, VENTENDOFFSET BIGINT, PRIORVENTSTARTOFFSET BIGINT, PRIORVENTENDOFFSET BIGINT, APNEAPARAMS VARCHAR, LOWEXHMVLIMIT DOUBLE, HIEXHMVLIMIT DOUBLE, LOWEXHTVLIMIT DOUBLE, HIPEAKPRESLIMIT DOUBLE, LOWPEAKPRESLIMIT DOUBLE, HIRESPRATELIMIT DOUBLE, LOWRESPRATELIMIT DOUBLE, SIGHPRESLIMIT DOUBLE, LOWIRONOXLIMIT DOUBLE, HIGHIRONOXLIMIT DOUBLE, MEANAIRWAYPRESLIMIT DOUBLE, PEEPLIMIT DOUBLE, CPAPLIMIT DOUBLE, SETAPNEAINTERVAL VARCHAR, SETAPNEATV VARCHAR, SETAPNEAIPPEEPHIGH VARCHAR, SETAPNEARR VARCHAR, SETAPNEAPEAKFLOW VARCHAR, SETAPNEAINSPTIME VARCHAR, SETAPNEAIE VARCHAR, SETAPNEAFIO2 VARCHAR);

CREATE TABLE respiratorycharting(RESPCHARTID BIGINT, PATIENTUNITSTAYID BIGINT, RESPCHARTOFFSET BIGINT, RESPCHARTENTRYOFFSET BIGINT, RESPCHARTTYPECAT VARCHAR, RESPCHARTVALUELABEL VARCHAR, RESPCHARTVALUE VARCHAR);

CREATE TABLE admissiondrug(admissiondrugid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, drugoffset BIGINT NOT NULL, drugenteredoffset BIGINT NOT NULL, drugnotetype VARCHAR, specialtytype VARCHAR, usertype VARCHAR NOT NULL, rxincluded VARCHAR, writtenineicu VARCHAR, drugname VARCHAR NOT NULL, drugdosage DOUBLE, drugunit VARCHAR, drugadmitfrequency VARCHAR NOT NULL, drughiclseqno BIGINT);

CREATE TABLE admissiondx(admissiondxid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, admitdxenteredoffset BIGINT NOT NULL, admitdxpath VARCHAR NOT NULL, admitdxname VARCHAR, admitdxtext VARCHAR);

CREATE TABLE allergy(allergyid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, allergyoffset BIGINT NOT NULL, allergyenteredoffset BIGINT NOT NULL, allergynotetype VARCHAR, specialtytype VARCHAR, usertype VARCHAR NOT NULL, rxincluded VARCHAR, writtenineicu VARCHAR, drugname VARCHAR, allergytype VARCHAR, allergyname VARCHAR, drughiclseqno BIGINT);

CREATE TABLE customlab(customlabid BIGINT NOT NULL, patientunitstayid BIGINT NOT NULL, labotheroffset BIGINT NOT NULL, labothertypeid BIGINT NOT NULL, labothername VARCHAR, labotherresult VARCHAR, labothervaluetext VARCHAR);
