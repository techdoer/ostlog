--
-- Version: Each entry records results from a blood lab. Supports Azure SQL Server.
-- URL: http://ostlog.org/schema/log_Blood.json
--
CREATE TABLE [dbo].[log_Blood]
(
	[id] INT IDENTITY (1,1) NOT NULL,
	[calendar_date_id] INT DEFAULT CONVERT (char(8), GETDATE(), 112) NOT NULL,
	[timestamp] TIME(0) NOT NULL,
	[location_id] INT NULL,
	[person_id] INT NOT NULL,

	[blood_group] NVARCHAR(3),

	-- blood cells
	[blood_cells_white_uL] FLOAT NULL,
	[blood_cells_red_M_uL] FLOAT NULL,
	[blood_cells_hematocrit_%] FLOAT NULL, 
	[blood_cells_mcv_fL] FLOAT NULL, 
	[blood_cells_mch_pg] FLOAT NULL, 
	[blood_cells_mchc_g_dL] FLOAT NULL, 
	[blood_cells_mpv_fL] FLOAT NULL, 
	[blood_cells_rdw_%] FLOAT NULL, 
	[blood_cells_platelet_k_uL] FLOAT NULL, 
	[blood_cells_neutrophils_%] FLOAT NULL, 
	[blood_cells_neutrophils_cells_k_uL] FLOAT NULL, 
	[blood_cells_eosinophils_%] FLOAT NULL, 
	[blood_cells_eosinophils_cells_k_uL] FLOAT NULL, 
	[blood_cells_basophils_%] FLOAT NULL, 
	[blood_cells_basophils_cells_k_uL] FLOAT NULL, 
	[blood_cells_lymphocytes_%] FLOAT NULL, 
	[blood_cells_lymphocytes_cells_k_uL] FLOAT NULL, 
	[blood_cells_monocytes_%] FLOAT NULL, 
	[blood_cells_monocytes_cells_k_uL] FLOAT NULL, 
	[blood_cells_erythroblasts_NRBC_%] FLOAT NULL,
	[blood_cells_erythroblasts_NRBC_k_uL] FLOAT NULL,

	-- acids
	[acids_bile_umol_L] FLOAT NULL,  
	[acids_bilirubin_direct_mg_dL] FLOAT NULL,
	[acids_bilirubin_indirect_mg_dL] FLOAT NULL,
	[acids_bilirubin_total_mg_dL] FLOAT NULL,
	[acids_folic_ng_dL] FLOAT NULL,
	[acids_uric_mg_dL] FLOAT NULL,

	-- antibodies
	[antibodies_anti_tissue_transglutaminase_iga_U_ml] FLOAT NULL,
	[antibodies_helicobacter_pylori_iga_index] FLOAT NULL,
	[antibodies_helicobacter_pylori_igg_AU_ml] FLOAT NULL,
	[antibodies_sars_cov_2_igg_index] FLOAT NULL,
	[antibodies_sars_cov_2_igm_index] FLOAT NULL,
	[antibodies_total_iga_antibodies_mg_dL] FLOAT NULL,
	[antibodies_toxoplasma_igg_U_mL] FLOAT NULL, 
	[antibodies_toxoplasma_igm_U_mL] FLOAT NULL, 
	[antibodies_transglutaminase_iga_U_ml] FLOAT NULL,
	[antibodies_vca_igg_U_mL] FLOAT NULL,
	[antibodies_vca_igm_U_mL] FLOAT NULL,
	
	-- antigens
	[antigens_psa_ng_mL] FLOAT NULL, 
	[antigens_psa_free_ng_mL] FLOAT NULL, 

	-- carbohydrates
	[carbohydrates_glucose_mg_dL] FLOAT NULL,
	[carbohydrates_glycosylated_hemoglobin_%] FLOAT NULL,
	[carbohydrates_glycosylated_hemoglobin_mmol_mol] FLOAT NULL,

	-- enzymes
	[enzymes_alt_U_L] FLOAT NULL, 
	[enzymes_alp_U_L] FLOAT NULL,
	[enzymes_amylase_U_L] FLOAT NULL,
	[enzymes_ast_U_L] FLOAT NULL, 
	[enzymes_ggt_U_L] FLOAT NULL, 
	[enzymes_ldh_uL_L] FLOAT NULL,	

	-- fats
	[fats_cholesterol_hdl_mg_dL] FLOAT NULL, 
	[fats_cholesterol_ldl_mg_dL] FLOAT NULL, 
	[fats_cholesterol_total_mg_dL] FLOAT NULL,
	[fats_triglycerides_mg_dL] FLOAT NULL, 

	-- hormones
	[hormones_beta_hcg_mu_mL] FLOAT NULL, 
	[hormones_creatinine_mg_dL] FLOAT NULL,
	[hormones_t3_pmol_L] FLOAT NULL, 
	[hormones_t4_pmol_L] FLOAT NULL,
	[hormones_t4_free_ng_dL] FLOAT NULL,
	[hormones_tsh_uu_mL] FLOAT NULL,
	
	-- indicies
	[indicies_azotemia_mg_%] FLOAT NULL,
	[indicies_eGFR_mL_min] FLOAT NULL,
	[indicies_esr_mm_hr] FLOAT NULL, 
	[indicies_hemolysis_index_mg_dL] FLOAT NULL,
	[indicies_icterus_index_mg_dL] FLOAT NULL,
	[indicies_lipemic_index] FLOAT NULL,
	[indicies_urea_mg_dL] FLOAT NULL, 

	-- minerals
	[minerals_calcium_mEq_L] FLOAT NULL, 
	[minerals_chloride_mEq_L] FLOAT NULL,
	[minerals_magnesium_mEq_L] FLOAT NULL,
	[minerals_potassium_mEq_L] FLOAT NULL, 
	[minerals_sideremia_ug_dL] FLOAT NULL, 
	[minerals_sodium_mEq_L] FLOAT NULL, 

	-- proteins 
	[proteins_albumin_g_dL] FLOAT NULL, 
	[proteins_albumin_%] FLOAT NULL, 
	[proteins_crp_mg_L] FLOAT NULL, 
	[proteins_ferritin_ug_L] FLOAT NULL, 
	[proteins_hemoglobin_g_dL] FLOAT NULL,
	[proteins_total_g_%] FLOAT NULL,	
	[proteins_transferrin_mg_dL] FLOAT NULL,
	[proteins_transferrin_saturation_%] FLOAT NULL,
	
	-- protidogram
	[protidogram_alpha1_%] FLOAT NULL,
	[protidogram_alpha2_%] FLOAT NULL,
	[protidogram_beta1_%] FLOAT NULL,
	[protidogram_beta2_%] FLOAT NULL,
	[protidogram_gamma_%] FLOAT NULL,
	[protidogram_A-G_ratio] FLOAT NULL,
	[protidogram_alpha1_g_dL] FLOAT NULL,
	[protidogram_alpha2_g_dL] FLOAT NULL,
	[protidogram_beta1_g_dL] FLOAT NULL,
	[protidogram_beta2_g_dL] FLOAT NULL,
	[protidogram_gamma_g_dL] FLOAT NULL,

	-- vitamins
	[vitamins_b12_pg_mL] FLOAT NULL,
	[vitamins_d3_ng_ml] FLOAT NULL,

	[exam_results_url] NVARCHAR(512) NULL, 
	[remarks] NVARCHAR(2056) NULL,

	CONSTRAINT [PK_log_Blood] PRIMARY KEY CLUSTERED ([id] ASC),
	CONSTRAINT [FK_log_Blood-Calendar_date] FOREIGN KEY ([calendar_date_id]) REFERENCES [dbo].[Calendar dates] ([date_id]),
	CONSTRAINT [FK_log_Blood-Locations] FOREIGN KEY ([location_id]) REFERENCES [dbo].[Locations] ([location_id]),
	CONSTRAINT [FK_log_Blood-People] FOREIGN KEY ([person_id]) REFERENCES [dbo].[People] ([id]),
	CHECK ([blood_group]='A+' OR [blood_group]='A-' OR [blood_group]='B+' OR [blood_group]='B-' OR [blood_group]='O+' OR [blood_group]='O-' OR [blood_group]='AB+' OR [blood_group]='AB-')
)
