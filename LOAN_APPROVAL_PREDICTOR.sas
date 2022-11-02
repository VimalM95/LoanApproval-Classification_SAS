/**********************************************
Name of DS: Mr.VIMAL MOTHI (TP067206)
Name of SAS program: mydapassignment_ft_tp067206.sas
Description: Loan approval prediction
Date first written: Thur, 23-Jun-2022
Date last updated: Tues, 05-Aug-2022

Project Folder name: DAP_FT_MAY_2022_TP067206
Permanent Library name: MYLIB06
***********************************************/

/***************************
Data Dictionary
****************************/

TITLE1 "Data dictionary of the Dataset - MYLIB06.TRAINING_DS";
PROC CONTENTS DATA = MYLIB06.TRAINING_DS;
RUN;

/***************************************************************************************************************************************
											TRAINING_DS EXPLORATORY DATA ANALYSIS
****************************************************************************************************************************************/

/***************************
Univariate Analysis
****************************/

/* 
This section outlines a series of codes written to generate univariate analysis 
of each categorical and continuous variable
*/

/*Categorical*/


/*MARITAL_STATUS*/

TITLE "Univariate Analysis of the categorical variable: MARITAL_STATUS";

PROC FREQ DATA = MYLIB06.TRAINING_DS;

TABLE MARITAL_STATUS;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

VBAR MARITAL_STATUS;
RUN;


/*QUALIFICATION*/

TITLE "Univariate Analysis of the categorical variable: QUALIFICATION";

PROC FREQ DATA = MYLIB06.TRAINING_DS;

TABLE QUALIFICATION;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

VBAR QUALIFICATION;
RUN;


/*FAMILY_MEMBERS*/

TITLE "Univariate Analysis of the categorical variable: FAMILY_MEMBERS";

PROC FREQ DATA = MYLIB06.TRAINING_DS;

TABLE FAMILY_MEMBERS;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

VBAR FAMILY_MEMBERS;
RUN;


/*GENDER*/

TITLE "Univariate Analysis of the categorical variable: GENDER";

PROC FREQ DATA = MYLIB06.TRAINING_DS;

TABLE GENDER;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

VBAR GENDER;
RUN;


/*EMPLOYMENT*/

TITLE "Univariate Analysis of the categorical variable: EMPLOYMENT";

PROC FREQ DATA = MYLIB06.TRAINING_DS;

TABLE EMPLOYMENT;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

VBAR EMPLOYMENT;
RUN;


/*LOAN_LOCATION*/

TITLE "Univariate Analysis of the categorical variable: LOAN_LOCATION";

PROC FREQ DATA = MYLIB06.TRAINING_DS;

TABLE LOAN_LOCATION;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

VBAR LOAN_LOCATION;
RUN;


/*LOAN_HISTORY*/

TITLE "Univariate Analysis of the categorical variable: LOAN_HISTORY";

PROC FREQ DATA = MYLIB06.TRAINING_DS;

TABLE LOAN_HISTORY;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

VBAR LOAN_HISTORY;
RUN;


/*Continuous*/

/*CANDIDATE_INCOME*/

TITLE "Univariate Analysis of the continuous variable: CANDIDATE_INCOME";

PROC MEANS DATA = MYLIB06.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR CANDIDATE_INCOME;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

HISTOGRAM CANDIDATE_INCOME;

TITLE "Histogram distribution of the continuous variable: CANDIDATE_INCOME";

RUN;


/*LOAN_AMOUNT*/

TITLE "Univariate Analysis of the continuous variable: LOAN_AMOUNT";

PROC MEANS DATA = MYLIB06.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR LOAN_AMOUNT;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

HISTOGRAM LOAN_AMOUNT;

TITLE "Histogram distribution of the continuous variable: LOAN_AMOUNT";

RUN;


/*LOAN_DURATION*/

TITLE "Univariate Analysis of the continuous variable: LOAN_DURATION";

PROC MEANS DATA = MYLIB06.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR LOAN_DURATION;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

HISTOGRAM LOAN_DURATION;

TITLE "Histogram distribution of the continuous variable: LOAN_DURATION";

RUN;


/*GUARANTEE_INCOME*/

TITLE "Univariate Analysis of the continuous variable: GUARANTEE_INCOME";

PROC MEANS DATA = MYLIB06.TRAINING_DS N NMISS MIN MAX MEAN MEDIAN STD;

VAR GUARANTEE_INCOME;

RUN;

ODS GRAPHICS / RESET WIDTH = 6.0 IN HEIGHT = 3.0 IN IMAGEMAP;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

HISTOGRAM GUARANTEE_INCOME;

TITLE "Histogram distribution of the continuous variable: GUARANTEE_INCOME";

RUN;


/***************************
Bivariate Analysis
****************************/

/* 
This section outlines a series of codes written to generate bivariate analysis 
of variables - categorical vs categorical & categorical vs continuous
*/

/*MARITAL_STATUS (Categorical) vs LOAN_APPROVAL_STATUS (Categorical) */

TITLE1 "Bivariate Analysis of variables";
TITLE2 "MARITAL_STATUS (Categorical) vs LOAN_APPROVAL_STATUS (Categorical)";
FOOTNOTE "------END------";

PROC FREQ DATA = MYLIB06.TRAINING_DS;

TABLE marital_status * loan_approval_status /
PLOTS = FREQPLOT ( TWOWAY = STACKED SCALE = GROUPPCT );

RUN;


/*QUALIFICATION (Categorical) vs LOAN_APPROVAL_STATUS (Categorical) */

TITLE1 "Bivariate Analysis of variables";
TITLE2 "QUALIFICATION (Categorical) vs LOAN_APPROVAL_STATUS (Categorical)";
FOOTNOTE "------END------";

PROC FREQ DATA = MYLIB06.TRAINING_DS;

TABLE qualification * loan_approval_status /
PLOTS = FREQPLOT ( TWOWAY = STACKED SCALE = GROUPPCT );

RUN;


/* LOAN_LOCATION (Categorical) vs CANDIDATE_INCOME (Continuous) */

TITLE1 "Bivariate Analysis of variables:";
TITLE2 "LOAN_LOCATION (Categorical) vs CANDIDATE_INCOME (Continuous)";

PROC MEANS DATA = MYLIB06.TRAINING_DS;

CLASS loan_location; /* It is a Categorical variable */
VAR candidate_income; /* It is a Continuous variable */

RUN;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

VBOX candidate_income / CATEGORY = loan_location;
/* LOAN_LOCATION -> X-AXIS ; CANDIDATE_INCOME -> Y-AXIS */
TITLE "Bivariate analysis of variables: LOAN_LOCATION (Categorical) vs CANDIDATE_INCOME (Continuous)";

RUN;


/* EMPLOYMENT (Categorical) vs LOAN_AMOUNT (Continuous) */

TITLE1 "Bivariate Analysis of variables:";
TITLE2 "EMPLOYMENT (Categorical) vs LOAN_AMOUNT (Continuous)";

PROC MEANS DATA = MYLIB06.TRAINING_DS;

CLASS employment; /* It is a Categorical variable */
VAR loan_amount; /* It is a Continuous variable */

RUN;

PROC SGPLOT DATA = MYLIB06.TRAINING_DS;

VBOX loan_amount / CATEGORY = employment;
/* EMPLOYMENT -> X-AXIS ; LOAN_AMOUNT -> Y-AXIS */
TITLE "Bivariate analysis of variables: EMPLOYMENT (Categorical) vs LOAN_AMOUNT (Continuous)";

RUN;


/***************************************************************************************************************************************
											TRAINING_DS IMPUTATIONS
****************************************************************************************************************************************/

/*
As part of data pre-processing, the dataset has to be cleansed prior to model building.
This section outlines missing value treatment in both categorical and continuous variable
*/

/**********************
Categorical Variables
***********************/

/* Create a copy of the dataset */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_BK AS
SELECT *
FROM MYLIB06.TRAINING_DS;

QUIT;

/************************************
 Imputation of MARITAL_STATUS 
*************************************/

/* STEP 1: Find the number of observations with missing values in the variable - MARITAL_STATUS */

TITLE1 "Observations with missing values in the variable - MARITAL_STATUS";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.marital_status IS MISSING ) OR
	    ( t.marital_status EQ '' ) OR
	    ( t.marital_status IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - MARITAL_STATUS */

TITLE1 "Details of the observations with missing values in the variable - MARITAL_STATUS";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.marital_status IS MISSING ) OR
		( t.marital_status EQ '' ) OR
		( t.marital_status IS NULL ) );
		
QUIT;

/* STEP 3: Create temporary dataset to hold data on MARITAL_STATUS and Number of Applicants */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_FI_MARITAL_STATUS AS
SELECT t.marital_status AS marital_status,
			   COUNT(*) AS COUNTS
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.marital_status IS NOT MISSING ) OR
		( t.marital_status NE '' ) OR
		( t.marital_status IS NOT NULL ) )
GROUP BY t.marital_status;

QUIT;

/* STEP 4: Find the mode and impute the missing values in the variable - MARITAL_STATUS */

PROC SQL;

UPDATE MYLIB06.TRAINING_DS
SET marital_status = ( SELECT to.marital_status Label = "Marital Status"
					   FROM MYLIB06.TRAINING_DS_FI_MARITAL_STATUS to
					   WHERE to.COUNTS EQ ( SELECT MAX(ti.COUNTS) Label = 'Highest Count'
					   						FROM MYLIB06.TRAINING_DS_FI_MARITAL_STATUS ti ) )
WHERE ( ( marital_status IS MISSING ) OR
		( marital_status EQ '' ) OR
		( marital_status IS NULL ) );
		
QUIT;

/* STEP 5: (After Imputation) Find the details of the observations with missing values in the variable - MARITAL_STATUS */

TITLE1 "Observations with missing values in the variable - MARITAL_STATUS";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.marital_status IS MISSING ) OR
	    ( t.marital_status EQ '' ) OR
	    ( t.marital_status IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - MARITAL_STATUS";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.marital_status IS MISSING ) OR
		( t.marital_status EQ '' ) OR
		( t.marital_status IS NULL ) );
		
QUIT;

/***********************************
 Imputation of FAMILY_MEMBERS 
************************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_BK AS
SELECT *
FROM MYLIB06.TRAINING_DS;

QUIT;

/* STEP 1: Find the number of observations with missing values in the variable - FAMILY_MEMBERS */

TITLE1 "Observations with missing values in the variable - FAMILY_MEMBERS";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.family_members IS MISSING ) OR
	    ( t.family_members EQ '' ) OR
	    ( t.family_members IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - FAMILY_MEMBERS */

TITLE1 "Details of the observations with missing values in the variable - FAMILY_MEMBERS";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.family_members IS MISSING ) OR
		( t.family_members EQ '' ) OR
		( t.family_members IS NULL ) );

QUIT;	
		
/* STEP 3: Remove the '+' found in FAMILY_MEMBERS variable */

PROC SQL;

UPDATE MYLIB06.TRAINING_DS
SET family_members = SUBSTR(family_members,1,1)
WHERE SUBSTR(family_members,2,1) EQ '+';

QUIT;

/* STEP 4: Create a temporary dataset to hold family_members and counts */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_FI_FAMILY_MEMBERS AS
SELECT t.family_members AS FAMILY_MEMBERS,
			   COUNT(*) AS COUNTS
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.family_members NE '' ) OR
		( t.family_members IS NOT NULL ) )
GROUP BY t.family_members;

QUIT;

/* STEP 5: Find the MODE and impute the missing values found in the variable - family_members */

PROC SQL;

UPDATE MYLIB06.TRAINING_DS
SET family_members = ( SELECT to.family_members Label = "Category of Family Member with Highest Count"
					   FROM MYLIB06.TRAINING_DS_FI_FAMILY_MEMBERS to
					   WHERE to.counts EQ ( SELECT MAX(ti.counts) Label = 'Highest Counts'
  										    FROM MYLIB06.TRAINING_DS_FI_FAMILY_MEMBERS ti ) )
  										    /* Above is subprogram to find the highest count */
WHERE ( ( family_members IS MISSING ) OR
		( family_members EQ '' ) OR
		( family_members IS NULL ) );

QUIT;

/* STEP 6: After Imputation - Observations with missing values in the variable - FAMILY_MEMBERS */

TITLE1 "Observations with missing values in the variable - FAMILY_MEMBERS";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.family_members IS MISSING ) OR
	    ( t.family_members EQ '' ) OR
	    ( t.family_members IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - FAMILY_MEMBERS";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.family_members IS MISSING ) OR
		( t.family_members EQ '' ) OR
		( t.family_members IS NULL ) );
		
QUIT;

/***********************************
 Imputation of GENDER
************************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_BK AS
SELECT *
FROM MYLIB06.TRAINING_DS;

QUIT;


/* STEP 1: Find the number of observations with missing values in the variable - GENDER */

TITLE1 "Observations with missing values in the variable - GENDER";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.gender IS MISSING ) OR
	    ( t.gender EQ '' ) OR
	    ( t.gender IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - GENDER */

TITLE1 "Details of the observations with missing values in the variable - GENDER";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.gender IS MISSING ) OR
		( t.gender EQ '' ) OR
		( t.gender IS NULL ) );
		
QUIT;

/* STEP 3: Create temporary dataset to hold data on GENDER and Number of Applicants */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_FI_GENDER AS
SELECT t.gender AS gender,
	   COUNT(*) AS COUNTS
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.gender IS NOT MISSING ) OR
		( t.gender NE '' ) OR
		( t.gender IS NOT NULL ) )
GROUP BY t.gender;

QUIT;

/* STEP 4: Find the MODE and impute the missing values found in the variable - GENDER */

PROC SQL;

UPDATE MYLIB06.TRAINING_DS
SET gender = ( SELECT to.gender Label = "Category of Gender with Highest Count"
			   FROM MYLIB06.TRAINING_DS_FI_GENDER to
			   WHERE to.counts EQ ( SELECT MAX(ti.counts) Label = 'Highest Counts'
  									FROM MYLIB06.TRAINING_DS_FI_GENDER ti ) )
  								   /* Above is subprogram to find the highest count */
WHERE ( ( gender IS MISSING ) OR
		( gender EQ '' ) OR
		( gender IS NULL ) );

QUIT;

/* STEP 5: After imputation - Observations with missing values in the variable - GENDER */

TITLE1 "Observations with missing values in the variable - GENDER";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.gender IS MISSING ) OR
	    ( t.gender EQ '' ) OR
	    ( t.gender IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - GENDER";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.gender IS MISSING ) OR
		( t.gender EQ '' ) OR
		( t.gender IS NULL ) );

QUIT;

/***********************************
 Imputation of EMPLOYMENT
***********************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_BK AS
SELECT *
FROM MYLIB06.TRAINING_DS;

QUIT;

/* STEP 1: Find the number of observations with missing values in the variable - EMPLOYMENT */

TITLE1 "Observations with missing values in the variable - EMPLOYMENT";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.employment IS MISSING ) OR
	    ( t.employment EQ '' ) OR
	    ( t.employment IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - EMPLOYMENT */

TITLE1 "Details of the observations with missing values in the variable - EMPLOYMENT";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.employment IS MISSING ) OR
		( t.employment EQ '' ) OR
		( t.employment IS NULL ) );
		
QUIT;

/* STEP 3: Create temporary dataset to hold data on EMPLOYMENT and Number of Applicants */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_FI_EMPLOYMENT AS
SELECT t.employment AS employment,
	       COUNT(*) AS COUNTS
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.employment IS NOT MISSING ) OR
		( t.employment NE '' ) OR
		( t.employment IS NOT NULL ) )
GROUP BY t.employment;

QUIT;

/* STEP 4: Find the MODE and impute the missing values found in the variable - EMPLOYMENT */

PROC SQL;

UPDATE MYLIB06.TRAINING_DS
SET employment = ( SELECT to.employment Label = "Category of EMPLOYMENT with Highest Count"
				   FROM MYLIB06.TRAINING_DS_FI_EMPLOYMENT to
				   WHERE to.counts EQ ( SELECT MAX(ti.counts) Label = 'Highest Counts'
  										FROM MYLIB06.TRAINING_DS_FI_EMPLOYMENT ti ) )
  										   /* Above is subprogram to find the highest count */
WHERE ( ( employment IS MISSING ) OR
		( employment EQ '' ) OR
		( employment IS NULL ) );

QUIT;

/* STEP 5: After imputation - Observations with missing values in the variable - EMPLOYMENT */

TITLE1 "Observations with missing values in the variable - EMPLOYMENT";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.employment IS MISSING ) OR
	    ( t.employment EQ '' ) OR
	    ( t.employment IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - EMPLOYMENT";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.employment IS MISSING ) OR
		( t.employment EQ '' ) OR
		( t.employment IS NULL ) );

QUIT;

/***********************************
 Imputation of LOAN_HISTORY
************************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_BK AS
SELECT *
FROM MYLIB06.TRAINING_DS;

QUIT;

/* STEP 1: Find the number of observations with missing values in the variable - LOAN_HISTORY */

TITLE1 "Observations with missing values in the variable - LOAN_HISTORY";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_history IS MISSING ) OR
	    ( t.loan_history EQ . ) OR
	    ( t.loan_history IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - LOAN_HISTORY */

TITLE1 "Details of the observations with missing values in the variable - LOAN_HISTORY";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_history IS MISSING ) OR
		( t.loan_history EQ . ) OR
		( t.loan_history IS NULL ) );
		
QUIT;

/* STEP 3: Create temporary dataset to hold data on LOAN_HISTORY and Number of Applicants */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_FI_LOAN_HISTORY AS
SELECT t.loan_history AS loan_history,
	       COUNT(*) AS COUNTS
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_history IS NOT MISSING ) OR
		( t.loan_history NE . ) OR
		( t.loan_history IS NOT NULL ) )
GROUP BY t.loan_history;

QUIT;

/* STEP 4: Find the MOD and impute the missing values found in the variable - LOAN_HISTORY */

PROC SQL;

UPDATE MYLIB06.TRAINING_DS
SET loan_history = ( SELECT to.loan_history Label = "Category of LOAN_HISTORY with Highest Count"
				     FROM MYLIB06.TRAINING_DS_FI_LOAN_HISTORY to
				     WHERE to.counts EQ ( SELECT MAX(ti.counts) Label = 'Highest Counts'
  										  FROM MYLIB06.TRAINING_DS_FI_LOAN_HISTORY ti ) )
  										   /* Above is subprogram to find the highest count */
WHERE ( ( loan_history IS MISSING ) OR
		( loan_history EQ . ) OR
		( loan_history IS NULL ) );

QUIT;

/* STEP 5: After imputation - Observations with missing values in the variable - LOAN_HISTORY */

TITLE1 "Observations with missing values in the variable - LOAN_HISTORY";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_history IS MISSING ) OR
	    ( t.loan_history EQ . ) OR
	    ( t.loan_history IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - LOAN_HISTORY";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_history IS MISSING ) OR
		( t.loan_history EQ . ) OR
		( t.loan_history IS NULL ) );
		
QUIT;

/*********************
Numerical Variables
**********************/

/******************************
Imputation of LOAN_AMOUNT
*******************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_BK AS
SELECT *
FROM MYLIB06.TRAINING_DS;

QUIT;

/* STEP 1: Find the number of observations with missing values in the variable - LOAN_AMOUNT */

TITLE1 "Observations with missing values in the variable - LOAN_AMOUNT";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_amount IS MISSING ) OR
	    ( t.loan_amount EQ . ) OR
	    ( t.loan_amount IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - LOAN_AMOUNT */

TITLE1 "Details of the observations with missing values in the variable - LOAN_AMOUNT";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_amount IS MISSING ) OR
		( t.loan_amount EQ . ) OR
		( t.loan_amount IS NULL ) );
		
QUIT;

/* STEP 3: Find the MEAN and impute the missing values found in the continuous variable - LOAN_AMOUNT */

PROC STDIZE DATA = MYLIB06.TRAINING_DS REPONLY

METHOD = MEAN OUT = MYLIB06.TRAINING_DS;
VAR loan_amount;

QUIT;

/* STEP 4: After imputation - Observations with missing values in the continouos variable - LOAN_AMOUNT */

TITLE1 "Observations with missing values in the variable - LOAN_AMOUNT";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_amount IS MISSING ) OR
	    ( t.loan_amount EQ . ) OR
	    ( t.loan_amount IS NULL ) );
	    

TITLE1 "Details of the observations with missing values in the variable - LOAN_AMOUNT";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_amount IS MISSING ) OR
		( t.loan_amount EQ . ) OR
		( t.loan_amount IS NULL ) );
		
QUIT;

/******************************
 Imputation of LOAN_DURATION
*******************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TRAINING_DS_BK AS
SELECT *
FROM MYLIB06.TRAINING_DS;

QUIT;

/* STEP 1: Find the number of observations with missing values in the variable - LOAN_DURATION */

TITLE1 "Observations with missing values in the variable - LOAN_DURATION";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
	    ( t.loan_duration EQ . ) OR
	    ( t.loan_duration IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - LOAN_DURATION */

TITLE1 "Details of the observations with missing values in the variable - LOAN_DURATION";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
		( t.loan_duration EQ . ) OR
		( t.loan_duration IS NULL ) );
		
QUIT;

/* STEP 3: Find the MEAN and impute the missing values found in the continouos variable - LOAN_DURATION */

PROC STDIZE DATA = MYLIB06.TRAINING_DS REPONLY

METHOD = MEAN OUT = MYLIB06.TRAINING_DS;
VAR loan_duration;

QUIT;

/* STEP 4: After imputation - Observations with missing values in the continouos variable - LOAN_DURATION */

TITLE1 "Observations with missing values in the variable - LOAN_DURATION";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
	    ( t.loan_duration EQ . ) OR
	    ( t.loan_duration IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - LOAN_DURATION";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TRAINING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
		( t.loan_duration EQ . ) OR
		( t.loan_duration IS NULL ) );
		
QUIT;


/***************************************************************************************************************************************
											TESTING_DS EXPLORATORY DATA ANALYSIS
****************************************************************************************************************************************/

/***********************
 Univariate Analysis
************************/

/*MACRO creation for univariate analysis of categorical variables in MYLIB06.TESTING_DS*/

/*
MACRO's help improve process efficiency as a task can be performed just by calling in
the function name as defined during macro creation 
*/

/*MACRO begins here*/

%MACRO MACRO_UVACATE_VARI067206(PDS_NAME, PVARI_NAME, PTITLE_NAME);

PROC FREQ DATA = &PDS_NAME;
TABLE &PVARI_NAME;
TITLE &PTITLE_NAME;
QUIT;

%MEND MACRO_UVACATE_VARI067206;

/*MACRO ends here*/

/*MACRO - Univariate analysis of Categorical variables in MYLIB06.TESTING_DS */
%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, MARITAL_STATUS, "Univariate Analysis of the categorical variables - MARITAL_STATUS")
%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, QUALIFICATION, "Univariate Analysis of the categorical variables - QUALIFICATION")
%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, FAMILY_MEMBERS, "Univariate Analysis of the categorical variables - FAMILY_MEMBERS")
%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, GENDER, "Univariate Analysis of the categorical variables - GENDER")
%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, LOAN_LOCATION, "Univariate Analysis of the categorical variables - LOAN_LOCATION")
%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, EMPLOYMENT, "Univariate Analysis of the categorical variables - EMPLOYMENT")
%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, LOAN_HISTORY, "Univariate Analysis of the categorical variables - LOAN_HISTORY")

/*MACRO - Univariate analysis of Continuous variables in MYLIB06.TESTING_DS */

%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, CANDIDATE_INCOME, "Univariate Analysis of the continuous variables - CANDIDATE_INCOME")
%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, LOAN_AMOUNT, "Univariate Analysis of the continuous variables - LOAN_AMOUNT")
%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, LOAN_DURATION, "Univariate Analysis of the continuous variables - LOAN_DURATION")
%MACRO_UVACATE_VARI067206(MYLIB06.TESTING_DS, GUARANTEE_INCOME, "Univariate Analysis of the continuous variables - GUARANTEE_INCOME")

/***********************
 Bivariate Analysis
************************/

/* MACRO creation for bivariate analysis of categorical variables in MYLIB06.TESTING_DS */

/* MACRO begins here */

%MACRO MACRO_BVA_CATE_VARI067206(PDS_NAME, PVARI_1, PVARI_2, PTITLE_1);

PROC FREQ DATA = &PDS_NAME;
TABLE &PVARI_1 * &PVARI_2 /
PLOTS = FREQPLOT (TWOWAY = STACKED SCALE = GROUPPCT);
TITLE1 &PTITLE_1;

RUN;

%MEND MACRO_BVA_CATE_VARI067206;

/* MACRO ends here */

/* To Call the Macro - MACRO_BVA_CATE_VARI */

%MACRO_BVA_CATE_VARI067206(MYLIB06.TESTING_DS, MARITAL_STATUS, LOAN_LOCATION, "Bivariate Analysis of the Categorical variables - MARITAL_STATUS,LOAN_LOCATION")
%MACRO_BVA_CATE_VARI067206(MYLIB06.TESTING_DS, GENDER, FAMILY_MEMBERS, "Bivariate Analysis of the Categorical variables - GENDER,FAMILY_MEMBERS")


/* Create MACRO to do Bivariate Analysis of the variables (Categorical vs Numeric) */

/* MACRO begins here */			 

%MACRO MACRO_BVA_CATE_NUM_VARI067206(PDS_NAME, CATE_VARI, NUM_VARI, PTITLE1, PTITLE2);
TITLE1 &PTITLE1;
PROC MEANS DATA = &PDS_NAME;
CLASS &CATE_VARI;
VAR &NUM_VARI;
RUN;
PROC SGPLOT DATA = &PDS_NAME;
VBOX &NUM_VARI / CATEGORY = &CATE_VARI;
TITLE &PTITLE2;
RUN;

%MEND MACRO_BVA_CATE_NUM_VARI067206;

/* MACRO ends here */			

/*MACRO - Bivariate analysis of Categorical variables and Continuous variables in MYLIB06.TESTING_DS */
%MACRO_BVA_CATE_NUM_VARI067206(MYLIB06.TESTING_DS, GENDER, CANDIDATE_INCOME, "Bivariate Analysis of the variables", "GENDER vs CANDIDATE_INCOME")
%MACRO_BVA_CATE_NUM_VARI067206(MYLIB06.TESTING_DS, GENDER, LOAN_AMOUNT, "Bivariate Analysis of the variables", "GENDER vs LOAN_AMOUNT");

/***************************************************************************************************************************************
											TESTING_DS IMPUTATIONS
****************************************************************************************************************************************/

/***********************
Categorical Variables
***********************/

/***********************************
 Imputation of GENDER
************************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TESTING_DS_BK AS
SELECT *
FROM MYLIB06.TESTING_DS;

QUIT;	

/* STEP 1: Find the number of observations with missing values in the variable - GENDER */

TITLE1 "Observations with missing values in the variable - GENDER";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.gender IS MISSING ) OR
	    ( t.gender EQ "" ) OR
	    ( t.gender IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - GENDER */

TITLE1 "Details of the observations with missing values in the variable - GENDER";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.gender IS MISSING ) OR
		( t.gender EQ "" ) OR
		( t.gender IS NULL ) );
		
QUIT;	

/* STEP 3: Create temporary dataset to hold data on GENDER and Number of Applicants */

PROC SQL;

CREATE TABLE MYLIB06.TESTING_DS_FI_GENDER AS
SELECT t.gender AS gender,
       COUNT(*) AS COUNTS
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.gender IS NOT MISSING ) OR
		( t.gender NE '' ) OR
		( t.gender IS NOT NULL ) )
GROUP BY t.gender;

QUIT;

/* STEP 4: Find the MODE and impute the missing values found in the variable - GENDER */

PROC SQL;

UPDATE MYLIB06.TESTING_DS
SET gender = ( SELECT to.gender Label = "Category of GENDER with Highest Count"
				     FROM MYLIB06.TESTING_DS_FI_GENDER to
				     WHERE to.counts EQ ( SELECT MAX(ti.counts) Label = 'Highest Counts'
  										  FROM MYLIB06.TESTING_DS_FI_GENDER ti ) )
  										   /* Above is subprogram to find the highest count */
WHERE ( ( gender IS MISSING ) OR
		( gender EQ "" ) OR
		( gender IS NULL ) );

QUIT;

/* STEP 5: After imputation - Observations with missing values in the Categorical variable - GENDER */

TITLE1 "Observations with missing values in the variable - GENDER";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.gender IS MISSING ) OR
	    ( t.gender EQ '' ) OR
	    ( t.gender IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - GENDER";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.gender IS MISSING ) OR
		( t.gender EQ '' ) OR
		( t.gender IS NULL ) );
		
QUIT;

/***********************************
 Imputation of EMPLOYMENT
***********************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TESTING_DS_BK AS
SELECT *
FROM MYLIB06.TESTING_DS;

QUIT;

/* STEP 1: Find the number of observations with missing values in the variable - EMPLOYMENT */

TITLE1 "Observations with missing values in the variable - EMPLOYMENT";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.employment IS MISSING ) OR
	    ( t.employment EQ '' ) OR
	    ( t.employment IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - EMPLOYMENT */

TITLE1 "Details of the observations with missing values in the variable - EMPLOYMENT";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.employment IS MISSING ) OR
		( t.employment EQ '' ) OR
		( t.employment IS NULL ) );
		
QUIT;

/* STEP 3: Create temporary dataset to hold data on EMPLOYMENT and Number of Applicants */

PROC SQL;

CREATE TABLE MYLIB06.TESTING_DS_FI_EMPLOYMENT AS
SELECT t.employment AS employment,
	       COUNT(*) AS COUNTS
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.employment IS NOT MISSING ) OR
		( t.employment NE '' ) OR
		( t.employment IS NOT NULL ) )
GROUP BY t.employment;

QUIT;

/* STEP 4: Find the MODE and impute the missing values found in the variable - EMPLOYMENT */

PROC SQL;

UPDATE MYLIB06.TESTING_DS
SET employment = ( SELECT to.employment Label = "Category of EMPLOYMENT with Highest Count"
				   FROM MYLIB06.TESTING_DS_FI_EMPLOYMENT to
				   WHERE to.counts EQ ( SELECT MAX(ti.counts) Label = 'Highest Counts'
  										FROM MYLIB06.TESTING_DS_FI_EMPLOYMENT ti ) )
  										   /* Above is subprogram to find the highest count */
WHERE ( ( employment IS MISSING ) OR
		( employment EQ '' ) OR
		( employment IS NULL ) );

QUIT;

/* STEP 5: After imputation - Observations with missing values in the variable - EMPLOYMENT */

TITLE1 "Observations with missing values in the variable - EMPLOYMENT";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.employment IS MISSING ) OR
	    ( t.employment EQ '' ) OR
	    ( t.employment IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - EMPLOYMENT";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.employment IS MISSING ) OR
		( t.employment EQ '' ) OR
		( t.employment IS NULL ) );

QUIT;

/***********************************
 Imputation of FAMILY_MEMBERS 
************************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TESTING_DS_BK AS
SELECT *
FROM MYLIB06.TESTING_DS;

QUIT;

/* STEP 1: Find the number of observations with missing values in the variable - FAMILY_MEMBERS */

TITLE1 "Observations with missing values in the variable - FAMILY_MEMBERS";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.family_members IS MISSING ) OR
	    ( t.family_members EQ '' ) OR
	    ( t.family_members IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - FAMILY_MEMBERS */

TITLE1 "Details of the observations with missing values in the variable - FAMILY_MEMBERS";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.family_members IS MISSING ) OR
		( t.family_members EQ '' ) OR
		( t.family_members IS NULL ) );

QUIT;	
		
/* STEP 3: Remove the '+' found in FAMILY_MEMBERS variable */

PROC SQL;

UPDATE MYLIB06.TESTING_DS
SET family_members = SUBSTR(family_members,1,1)
WHERE SUBSTR(family_members,2,1) EQ '+';

QUIT;

/* STEP 4: Create a temporary dataset to hold family_members and counts */

PROC SQL;

CREATE TABLE MYLIB06.TESTING_DS_FI_FAMILY_MEMBERS AS
SELECT t.family_members AS FAMILY_MEMBERS,
			   COUNT(*) AS COUNTS
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.family_members NE '' ) OR
		( t.family_members IS NOT NULL ) )
GROUP BY t.family_members;

QUIT;

/* STEP 5: Find the MODE and impute the missing values found in the variable - family_members */

PROC SQL;

UPDATE MYLIB06.TESTING_DS
SET family_members = ( SELECT to.family_members Label = "Category of Family Member with Highest Count"
					   FROM MYLIB06.TESTING_DS_FI_FAMILY_MEMBERS to
					   WHERE to.counts EQ ( SELECT MAX(ti.counts) Label = 'Highest Counts'
  										    FROM MYLIB06.TESTING_DS_FI_FAMILY_MEMBERS ti ) )
  										    /* Above is subprogram to find the highest count */
WHERE ( ( family_members IS MISSING ) OR
		( family_members EQ '' ) OR
		( family_members IS NULL ) );

QUIT;

/* STEP 6: After Imputation - Observations with missing values in the variable - FAMILY_MEMBERS */

TITLE1 "Observations with missing values in the variable - FAMILY_MEMBERS";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.family_members IS MISSING ) OR
	    ( t.family_members EQ '' ) OR
	    ( t.family_members IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - FAMILY_MEMBERS";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.family_members IS MISSING ) OR
		( t.family_members EQ '' ) OR
		( t.family_members IS NULL ) );
		
QUIT;

/***********************************
 Imputation of LOAN_HISTORY
************************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TESTING_DS_BK AS
SELECT *
FROM MYLIB06.TESTING_DS;

QUIT;

/* STEP 1: Find the number of observations with missing values in the variable - LOAN_HISTORY */

TITLE1 "Observations with missing values in the variable - LOAN_HISTORY";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_history IS MISSING ) OR
	    ( t.loan_history EQ . ) OR
	    ( t.loan_history IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - LOAN_HISTORY */

TITLE1 "Details of the observations with missing values in the variable - LOAN_HISTORY";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_history IS MISSING ) OR
		( t.loan_history EQ . ) OR
		( t.loan_history IS NULL ) );
		
QUIT;

/* STEP 3: Create temporary dataset to hold data on LOAN_HISTORY and Number of Applicants */

PROC SQL;

CREATE TABLE MYLIB06.TESTING_DS_FI_LOAN_HISTORY AS
SELECT t.loan_history AS loan_history,
	       COUNT(*) AS COUNTS
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_history IS NOT MISSING ) OR
		( t.loan_history NE . ) OR
		( t.loan_history IS NOT NULL ) )
GROUP BY t.loan_history;

QUIT;

/* STEP 4: Find the MODE and impute the missing values found in the variable - LOAN_HISTORY */

PROC SQL;

UPDATE MYLIB06.TESTING_DS
SET loan_history = ( SELECT to.loan_history Label = "Category of LOAN_HISTORY with Highest Count"
				     FROM MYLIB06.TESTING_DS_FI_LOAN_HISTORY to
				     WHERE to.counts EQ ( SELECT MAX(ti.counts) Label = 'Highest Counts'
  										  FROM MYLIB06.TESTING_DS_FI_LOAN_HISTORY ti ) )
  										   /* Above is subprogram to find the highest count */
WHERE ( ( loan_history IS MISSING ) OR
		( loan_history EQ . ) OR
		( loan_history IS NULL ) );

QUIT;

/* STEP 5: After imputation - Observations with missing values in the variable - LOAN_HISTORY */

TITLE1 "Observations with missing values in the variable - LOAN_HISTORY";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_history IS MISSING ) OR
	    ( t.loan_history EQ . ) OR
	    ( t.loan_history IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - LOAN_HISTORY";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_history IS MISSING ) OR
		( t.loan_history EQ . ) OR
		( t.loan_history IS NULL ) );
		
QUIT;

/**********************
Continuous Variables
***********************/

/******************************
Imputation of LOAN_AMOUNT
*******************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TESTING_DS_BK AS
SELECT *
FROM MYLIB06.TESTING_DS;

QUIT;

/* STEP 1: Find the number of observations with missing values in the variable - LOAN_AMOUNT */

TITLE1 "Observations with missing values in the variable - LOAN_AMOUNT";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_amount IS MISSING ) OR
	    ( t.loan_amount EQ . ) OR
	    ( t.loan_amount IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - LOAN_AMOUNT */

TITLE1 "Details of the observations with missing values in the variable - LOAN_AMOUNT";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_amount IS MISSING ) OR
		( t.loan_amount EQ . ) OR
		( t.loan_amount IS NULL ) );
		
QUIT;

/* STEP 3: Find the MEAN and impute the missing values found in the continuous variable - LOAN_AMOUNT */

PROC STDIZE DATA = MYLIB06.TESTING_DS REPONLY

METHOD = MEAN OUT = MYLIB06.TESTING_DS;
VAR loan_amount;

QUIT;

/* STEP 4: After imputation - Observations with missing values in the continouos variable - LOAN_AMOUNT */

TITLE1 "Observations with missing values in the variable - LOAN_AMOUNT";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_amount IS MISSING ) OR
	    ( t.loan_amount EQ . ) OR
	    ( t.loan_amount IS NULL ) );
	    

TITLE1 "Details of the observations with missing values in the variable - LOAN_AMOUNT";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_amount IS MISSING ) OR
		( t.loan_amount EQ . ) OR
		( t.loan_amount IS NULL ) );
		
QUIT;

/******************************
 Imputation of LOAN_DURATION
*******************************/

/* Create Backup */

PROC SQL;

CREATE TABLE MYLIB06.TESTING_DS_BK AS
SELECT *
FROM MYLIB06.TESTING_DS;

QUIT;

/* STEP 1: Find the number of observations with missing values in the variable - LOAN_DURATION */

TITLE1 "Observations with missing values in the variable - LOAN_DURATION";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
	    ( t.loan_duration EQ . ) OR
	    ( t.loan_duration IS NULL ) );
	    
QUIT;

/* STEP 2: Find the details of the observations with missing values in the variable - LOAN_DURATION */

TITLE1 "Details of the observations with missing values in the variable - LOAN_DURATION";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
		( t.loan_duration EQ . ) OR
		( t.loan_duration IS NULL ) );
		
QUIT;

/* STEP 3: Find the MEAN and impute the missing values found in the continouos variable - LOAN_DURATION */

PROC STDIZE DATA = MYLIB06.TESTING_DS REPONLY

METHOD = MEAN OUT = MYLIB06.TESTING_DS;
VAR loan_duration;

QUIT;

/* STEP 4: After imputation - Observations with missing values in the continouos variable - LOAN_DURATION */

TITLE1 "Observations with missing values in the variable - LOAN_DURATION";
FOOTNOTE "----END----";

PROC SQL;

SELECT COUNT(*) Label = "Number of observation"
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
	    ( t.loan_duration EQ . ) OR
	    ( t.loan_duration IS NULL ) );
	    
QUIT;

TITLE1 "Details of the observations with missing values in the variable - LOAN_DURATION";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS t
WHERE ( ( t.loan_duration IS MISSING ) OR
		( t.loan_duration EQ . ) OR
		( t.loan_duration IS NULL ) );
		
QUIT;


/***************************************************************************************************************************************
											MODELLING
****************************************************************************************************************************************/

/*****************
Training Model
******************/

/* Create a model using Logistic Regression Algorithm */

PROC LOGISTIC DATA = MYLIB06.TRAINING_DS OUTMODEL = MYLIB06.TRAINING_DS_MODEL_TP067206;

CLASS
/* Below are categorical variables */
GENDER
FAMILY_MEMBERS
LOAN_LOCATION
LOAN_HISTORY
MARITAL_STATUS
QUALIFICATION
EMPLOYMENT;

/* Format below - MODEL Dependent Variable = Independent Variables */
MODEL LOAN_APPROVAL_STATUS =
GENDER
FAMILY_MEMBERS
LOAN_LOCATION
LOAN_HISTORY
MARITAL_STATUS
QUALIFICATION
EMPLOYMENT
LOAN_AMOUNT
LOAN_DURATION;

OUTPUT OUT = MYLIB06.TRAINING_OUTPUT_DS_TP067206 P = PRED_PROB;
/* PRED_PROB -> Predicted Probability - variable to hold predicted probability */
/* OUT -> Used to store output in a dataset */
/* Akaike Information Criterion must (AIC) < SC (Schwarz Criterion) */
RUN;

/* If Pr > ChiSq is <=0.05, it indicates that the independent variables is 
   imporant and is truely contributing to predict the dependent variable */

/*****************
Testing Model
******************/

PROC LOGISTIC INMODEL = MYLIB06.TRAINING_DS_MODEL_TP067206;

SCORE DATA = MYLIB06.TESTING_DS /* TESTING Dataset */
OUT = MYLIB06.TESTING_DS_LAS_PREDICTED; /* Location of Output */

QUIT;

TITLE1 "Loan Approval Status";
TITLE2 "Lasiandra Finance Inc. (LFI)";
FOOTNOTE "----END----";

PROC SQL;

SELECT *
FROM MYLIB06.TESTING_DS_LAS_PREDICTED;

QUIT;

/***************************************************************************************************************************************
											Library of Datasets
****************************************************************************************************************************************/

PROC datasets library=MYLIB06 memtype=DATA;
RUN;


/***************************************************************************************************************************************
											ODL - Output Delivery System
****************************************************************************************************************************************/

ODS HTML CLOSE;
ODS PDF CLOSE;

/* Set the Physical location of pdf generate */
ODS PDF FILE = '/home/u60775583/DAP_FT_MAY_2022_TP067206/REPORT.pdf';
OPTIONS NOBYLINE NODATE;
TITLE1 "Predicted Loan Approval Status";
TITLE2 "APU,TPM";

PROC REPORT DATA = MYLIB06.TESTING_DS_LAS_PREDICTED NOWINDOWS;

BY SME_LOAN_ID_NO; /* To seperate each application by SME_LOAN_ID_NO */
/* Column SME_LOAN_ID_NO I_LOAN_APPROVAL_STATUS */
DEFINE SME_LOAN_ID_NO / GROUP "LOAN ID";
DEFINE I_LOAN_APPROVAL_STATUS / GROUP "APPROVAL STATUS";
FOOTNOTE "-----Eend of Report-----";

RUN;
OPTIONS BYLINE;


/***************************************************************************************************************************************
												END OF PROGRAM
/***************************************************************************************************************************************/												