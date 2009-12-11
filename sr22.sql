DROP TABLE IF EXISTS DATSRCLN, DERIV_CD, FD_GROUP, FOOD_DES, FOOTNOTE, NUT_DATA, NUTR_DEF, WEIGHT, ABBREV, SRC_CD, DATA_SRC;

CREATE TABLE DATSRCLN
 (
	NDB_No			INT, 
	Nutr_No			INT, 
	DataSrc_ID			VARCHAR(12)
);


CREATE TABLE DERIV_CD
 (
	Deriv_CD			VARCHAR(8), 
	Deriv_Desc			VARCHAR(240)
);


CREATE TABLE FD_GROUP
 (
	FdGrp_CD			VARCHAR(8), 
	FdGrp_Desc			VARCHAR(120)
);


CREATE TABLE FOOD_DES
 (
	NDB_No			INT, 
	FdGrp_Cd			VARCHAR(8), 
	Long_Desc			VARCHAR(400), 
	Shrt_Desc			VARCHAR(120), 
	ComName			VARCHAR(200), 
	ManufacName			VARCHAR(130), 
	Survey			VARCHAR(2), 
	Ref_Desc			VARCHAR(270), 
	Refuse			INTEGER, 
	SciName			VARCHAR(130), 
	N_Factor			FLOAT, 
	Pro_Factor			FLOAT, 
	Fat_Factor			FLOAT, 
	CHO_Factor			DOUBLE,
    INDEX (NDB_No)
);


CREATE TABLE FOOTNOTE
 (
	NDB_NO			INT, 
	Footnt_No			VARCHAR(8), 
	Footnot_Typ			VARCHAR(2), 
	Nutr_No			INT,
	Footnot_Txt			VARCHAR(400),
     INDEX (NDB_NO)
);


CREATE TABLE NUT_DATA
 (
	NDB_No			INT, 
	Nutr_No			INT, 
	Nutr_Val			DOUBLE, 
	Num_Data_Pts			INTEGER, 
	Std_Error			DOUBLE, 
	Src_Cd			VARCHAR(4), 
	Deriv_Cd			VARCHAR(8), 
	Ref_NDB_No			INT, 
	Add_Nutr_Mark			VARCHAR(2), 
	Num_Studies			INTEGER, 
	Min			DOUBLE, 
	Max			DOUBLE, 
	DF			DOUBLE, 
	Low_EB			DOUBLE, 
	Up_EB			DOUBLE, 
	Stat_Cmt			VARCHAR(20),
    INDEX (NDB_No)
);


CREATE TABLE NUTR_DEF
 (
	Nutr_No			INT, 
	Units			VARCHAR(14), 
	Tagname			VARCHAR(40), 
	NutrDesc			VARCHAR(120), 
	Num_Dec			VARCHAR(2), 
	SR_Order			FLOAT,
     INDEX (Nutr_No)
);


CREATE TABLE WEIGHT
 (
	NDB_No			INT, 
	Seq			VARCHAR(4), 
	Amount			DOUBLE, 
	Msre_Desc			VARCHAR(160), 
	Gm_Wgt			DOUBLE, 
	Num_Data_Pts			INTEGER, 
	Std_Dev			DOUBLE,
 INDEX (NDB_No)
);


CREATE TABLE ABBREV
 (
	NDB_No			INT, 
	Shrt_Desc			VARCHAR(120), 
	Water			DOUBLE, 
	Energ_Kcal			INTEGER, 
	Protein			DOUBLE, 
	Lipid_Tot			DOUBLE, 
	Ash			DOUBLE, 
	Carbohydrt			DOUBLE, 
	Fiber_TD			DOUBLE, 
	Sugar_Tot			DOUBLE, 
	Calcium			INTEGER, 
	Iron			DOUBLE, 
	Magnesium			DOUBLE, 
	Phosphorus			INTEGER, 
	Potassium			INTEGER, 
	Sodium			INTEGER, 
	Zinc			DOUBLE, 
	Copper			DOUBLE, 
	Manganese			DOUBLE, 
	Selenium			DOUBLE, 
	Vit_C			DOUBLE, 
	Thiamin			DOUBLE, 
	Riboflavin			DOUBLE, 
	Niacin			DOUBLE, 
	Panto_Acid			DOUBLE, 
	Vit_B6			DOUBLE, 
	Folate_Tot			DOUBLE, 
	Folic_Acid			DOUBLE, 
	Food_Folate			DOUBLE, 
	Folate_DFE			DOUBLE, 
	Choline_Tot			DOUBLE, 
	Vit_B12			DOUBLE, 
	Vit_A_IU			INTEGER, 
	Vit_A_RAE			DOUBLE, 
	Retinol			DOUBLE, 
	Alpha_Carot			DOUBLE, 
	Beta_Carot			DOUBLE, 
	Beta_Crypt			DOUBLE, 
	Lycopene			DOUBLE, 
	Lut_Zea			DOUBLE,  -- this was Lut+Zea
	Vit_E			DOUBLE, 
	Vit_D_mcg			DOUBLE, 
	ViVit_D_IU			DOUBLE, 
	Vit_K			DOUBLE, 
	FA_Sat			DOUBLE, 
	FA_Mono			DOUBLE, 
	FA_Poly			DOUBLE, 
	Cholestrl			INTEGER, 
	GmWt_1			DOUBLE, 
	GmWt_Desc1			VARCHAR(240), 
	GmWt_2			DOUBLE, 
	GmWt_Desc2			VARCHAR(240), 
	Refuse_Pct			INTEGER,
    INDEX (NDB_No)
);


CREATE TABLE SRC_CD
 (
	Src_Cd			VARCHAR(4), 
	SrcCd_Desc			VARCHAR(120)
);


CREATE TABLE DATA_SRC
 (
	DataSrc_ID			VARCHAR(12), 
	Authors			VARCHAR(510), 
	Title			VARCHAR(510), 
	Year			VARCHAR(8), 
	Journal			VARCHAR(270), 
	Vol_City			VARCHAR(32), 
	Issue_State			VARCHAR(10), 
	Start_Page			VARCHAR(10), 
	End_Page			VARCHAR(10)
);


-- this table is not part of the SR22 distribution but we like it because it
-- provides us with the ability to map commonly-used names for foods into their
-- exact equivalents in the nutrition database
CREATE TABLE ALIASES
(
    Alias       VARCHAR(255),  -- alias word or text
    NDB_No      INT,  -- pointer to existing record
    INDEX (Alias)
);
