--
-- This program is licensed to you under the MIT License
-- Copyright (c) 2017 family•smarts. All rights reserved.
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal 
-- in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
-- of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS 
-- FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
-- IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-- Version: Each entry records results from a blood examination. Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/Blood_log.json
--
-- Authors:     Sergio Bogazzi
-- Copyright:   Copyright (c) 2017 family•smarts
-- License:     MIT License
CREATE TABLE [dbo].[Blood log]
(
	[id] INT NOT NULL,
	[calendar_date_id] INT NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[domain] NVARCHAR (15) NOT NULL,
	[person_id] INT NOT NULL,
	[blood_group] NVARCHAR(3),
	[white_blood_cells_mcl] FLOAT NULL, /* white blood cell count - measured as cells/mcL ; italian leucociti*/
	[red_blood_cells_mcl] FLOAT NULL, /* red blood cell count measured as million cells/mcL ; italian eritrociti */
	[hb_g_dl] FLOAT NULL, /* hemoglobin - this is the amount of hemoglobin in a volume of blood - measured as grams/dL */
	[hct_%] FLOAT NULL, /* Hematocrit - this is the percentage of the volume ofred cells to the volume of whole blood. */
	[mcv_fl] FLOAT NULL, /* Mean corpuscular volume  - is the average volume of a red blood cell. */
	[mch_pg] FLOAT NULL, /* Mean Corpuscular Hemoglobin (MCH) is the average amount of hemoglobin in the average red cell */
	[mchc_g_dl] FLOAT NULL, /* Mean Corpuscular Hemoglobin Concentration (MCHC) is the average concentration of hemoglobin in a given volume of red cells. */
	[mpv_fl] FLOAT NULL, /* Mean platelet volume (MPV). Mean platelet volume measures the average amount (volume) of platelets. */
	[rdw_cv_%] FLOAT NULL, /* Red Cell Distribution Width (RDW-CV), - this is RDW-CV (oefficient of variation), is a measurement of the variability of red cell size and shape */
	[pc_b_l] FLOAT NULL, /* Platelet count.  In italian called piastrine.  measured as billion/L */
	[neutrophils_%] FLOAT NULL, /* The five types of white blood cells include neutrophils, lymphocytes, monocytes, eosinophils, and basophils. */
	[neutrophils_cells_mcl] FLOAT NULL, /* The five types of white blood cells include neutrophils, lymphocytes, monocytes, eosinophils, and basophils. */
	[eosinophils_%] FLOAT NULL, /* The five types of white blood cells include neutrophils, lymphocytes, monocytes, eosinophils, and basophils. */
	[eosinophils_cells_mcl] FLOAT NULL, /* The five types of white blood cells include neutrophils, lymphocytes, monocytes, eosinophils, and basophils. */
	[basophils_%] FLOAT NULL, /* The five types of white blood cells include neutrophils, lymphocytes, monocytes, eosinophils, and basophils. */
	[basophils_cells_mcl] FLOAT NULL, /* The five types of white blood cells include neutrophils, lymphocytes, monocytes, eosinophils, and basophils. */
	[lymphocytes_%] FLOAT NULL, /* The five types of white blood cells include neutrophils, lymphocytes, monocytes, eosinophils, and basophils. */
	[lymphocytes_cells_mcl] FLOAT NULL, /* The five types of white blood cells include neutrophils, lymphocytes, monocytes, eosinophils, and basophils. */
	[monocytes_%] FLOAT NULL, /* The five types of white blood cells include neutrophils, lymphocytes, monocytes, eosinophils, and basophils. */
	[monocytes_cells_mcl] FLOAT NULL, /* The five types of white blood cells include neutrophils, lymphocytes, monocytes, eosinophils, and basophils. */
	[ferritin_ng_ml] FLOAT NULL, /* ng/ml */
	[sideremia_mcg_dl] FLOAT NULL, /* transports iron in the blood */
	[creatinine_mg_dl] FLOAT NULL, /* mg/dl */
	[albumin_g_dl] FLOAT NULL, /*  g/dl */
	[bile_acids_mcMoli_l] FLOAT NULL, /* mcMoli/l */
	[glucose_mg_dl] FLOAT NULL, /* glucose in the blood.  In italian it is Glicemia - mg/dl */
	[uricacid_mg_dl] FLOAT NULL, /* measure of uric acid in blood. In Italian it is Ac. Urico Ematico - mg/dl */
	[triglycerides] FLOAT NULL, /* measure of triglycerides in blood. In Italian it is Trigliceridi - mg/dl */
	[cholesterol_total] FLOAT NULL, /* cholesterol in blood. mg/dl */
	[cholesterol_hdl] FLOAT NULL, /* hdl cholesterol in blood. mg/dl */
	[cholesterol_ldl] FLOAT NULL, /* ldl cholesterol in blood. mg/dl */
	[ast_ui_l] FLOAT NULL, /* aspartate aminotransferase. Liver - In Italian GOT/AST  - UI/L */
	[alt_ui_l] FLOAT NULL, /* alanine aminotransferase. Liver - In Italian GPT/ALT - UI/L */
	[ggt_u_i] FLOAT NULL, /* gamma-glutamyl transferase. Liver U/I */
	[ldh_ul_l] FLOAT NULL, /* ldh lactic dehydrogenase Ul/l */
	[toxoplasma_igg] FLOAT NULL, /* Toxoplasma IgG antibody. */
	[toxoplasma_igm_ul_ml] FLOAT NULL, /* Toxoplasma IgM antibody. */
	[tsh_ulu_ml] FLOAT NULL, /* thyrotropin. Italian tireotropo.  ulU/ml */
	[t3_pmol_l] FLOAT NULL, /* triiodothyronine pmol/l */
	[t4_pmol_l] FLOAT NULL, /* thyroxine pmol/l */
	[potassium_meq_l] FLOAT NULL, /* potassium mEq/l */
	[sodium_meq_l] FLOAT NULL, /*sodium mEq/l */
	[calcium_mg_dl] FLOAT NULL, /* calcium mg/dl */
	[remarks] NVARCHAR(2056) NULL,
	CONSTRAINT [PK_Blood log] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_Blood log-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_Blood log-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CHECK ([blood_group]='A+' OR [blood_group]='A-' OR [blood_group]='B+' OR [blood_group]='B-' OR [blood_group]='O+' OR [blood_group]='O-' OR [blood_group]='AB+' OR [blood_group]='AB-'),
	CHECK ([domain] = 'spiritual' OR [domain] = 'social' OR [domain] = 'physical' OR [domain] = 'intellectual' OR [domain] = 'financial' OR [domain] = 'emotional' OR [domain] = 'environmental')
)
