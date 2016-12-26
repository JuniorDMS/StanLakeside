#include <macro.h>
/*
	File: fn_clothing_sert.sqf


	Description:
	Master config file for sert clothing store.
*/
private["_filter","_ret"];
_filter = param [0,0,[0]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Umundurowanie SERT"];


_ret = [];
switch (_filter) do
{
	case 0: //Mundury
	{
		_ret =
		[
			
			["KombinezonPOL",nil,15],
			["herpSERT1",nil,15],
			["herpSERT2",nil,15],
			["herpSERT3",nil,15],
			["A3L_EC_SERT",nil,15],
			["CG_SERT1",nil,15],
			["CG_SERT2",nil,15],
			["CG_SERT3",nil,15],
			["CG_SERT4",nil,15],
			["CG_SERT5",nil,15],
			["CG_SERT6",nil,15],
			["CG_SERT7",nil,15],
			["A3L_EC_SERTK","SERT V2",50],
			["U_C_DDE","Kombinezon HazMat / Uran",50],
			["RR_SWAT_UNIFORM_obj","Kombinezon SWAT",15],
			["TCG_SWAT","Komendant",15],
			["TRYK_U_B_BLK","Mundur Pilota",15],
			["LS_Marshal_Jacket3",nil,15],
			["TRYK_U_B_OD_OD_CombatUniform",nil,15],
			["TRYK_U_B_Snow_CombatUniform",nil,15],
			["TRYK_U_B_Snowt",nil,15]
		];
	};

	case 1: //Czapki
	{
		_ret =
		[
			["jamie_blackhelmet","Czarny Helm Swat",5],
			["TRYK_H_PASGT_BLK","SERT Standard Helmet",5],
			["TCG_pdav_helmet","Helm Pilota",5],
			["TRYK_H_PASGT_OD",nil,5],
			["CG_sert_H7",nil,5],
			["CG_sert_H6",nil,5],
			["CG_sert_H5",nil,5],
			["CG_sert_H4",nil,5],
			["CG_sert_H3",nil,5],
			["CG_sert_H2",nil,5],
			["CG_sert_H1",nil,5],
			["H_HelmetSpecO_blk","Dowodca SERT",15],
			["H_HelmetSpecB","Helm SWAT",5],
			["TRYK_H_PASGT_OD","SERT Helmet OD",5],
			["policia_geo_boina_azul",nil,500],
			["policia_geo_boina_negra",nil,500],
			["policia_geo_boina_roja",nil,500],
			["BHD_Protec_helmet",nil,500],
			["BHD_Protec_helmet2",nil,500],
			["BHD_Protec_helmet3",nil,500],
			["TRYK_H_WH",nil,500],
			["TRYK_H_Helmet_Snow",nil,500]
		];
	};

	case 2: //Okulary
	{
		_ret =
		[
			["G_Combat",nil,5],
			["G_Balaclava_blk",nil,5],
			["G_Balaclava_combat",nil,5],
			["G_Balaclava_lowprofile",nil,5],
			["G_Balaclava_TI_tna_F",nil,5],
			["G_Balaclava_TI_blk_F",nil,5],
			["A3L_Balaclava",nil,6],
			["TRYK_kio_balaclava_WH",nil,6],
			["TRYK_kio_balaclava_ESS",nil,6],
			["TRYK_H_PASGT_BLK",nil,6],
			["TRYK_SPGEAR_Glasses","Negotiator Glasses",6],
			["TRYK_Shemagh_EAR_G",nil,5],
			["TRYK_Shemagh_EAR_TAN",nil,5],
			["TRYK_Shemagh_EAR_WH",nil,5],
			["TRYK_Shemagh_shade_MH",nil,5],
			["TRYK_Shemagh_shade_G",nil,5],
			["TRYK_Shemagh_shade_WH",nil,5],
			["TRYK_TAC_SET_MESH_2",nil,5],
			["TRYK_TAC_SET_OD_2",nil,5],
			["TRYK_TAC_SET_TAN_2",nil,5],
			["TRYK_TAC_SET_WH_2",nil,5],
			["TRYK_TAC_SET_MESH",nil,5],
			["TRYK_TAC_SET_OD",nil,5],
			["TRYK_TAC_SET_TAN",nil,5],
			["TRYK_TAC_SET_WH",nil,5],
			["M04Mask","Maska M04 z kapturem HazMat",5],
			["M04Mask1","Maska M04 HazMat",5],
			["Mask_M40","Gas Mask Black",5],
			["Mask_M40_OD","Gas Mask Olive",5]
		];
	};

	case 3: //Kamizelki
	{
		_ret =
		[
			
			["KamizelkaCBRN",nil,15],
			["SERT_FULL_VESTGRN",nil,15],
			["SERTvest1",nil,15],
			["TRYK_V_PlateCarrier_blk",nil,15],
			["TRYK_V_PlateCarrier_blk_L",nil,15],
			["TCG_sertvest1","UniV2 SERT",15],
			["TRYK_V_tacv1LC_P2_BK","Dowodca SERT",15],
			["kif_sert_olive_vest","SERT Olive Vest",15],
			["kif_sert_olive2_vest","SERT Olive 2 Vest",15],
			["kif_swat_vest","Police SWAT Vest",15],
			["kif_swat_vest2","Police SWAT Corporal Vest",15],
			["kif_swat_vest3","Police SWAT Sergeant Vest",15],
			["kif_sert_vest","Police SERT Vest",15],
			["dryg_sert_vest_v2","Police SERT v2 Vest",15],
			["kif_sert_vest_moro","Police Sert MORO Vest",15],
			["TAC_ArmorVest_Winter","Police Sert MORO Vest",15],
			["dryg_sert_dzoka_vest",nil,15],
			["dryg_sert_dzoka_vest_v2",nil,15],
			["dryg_sert_mike_vest",nil,15],
			["dryg_sert_mike_vest_v2",nil,15]
		];
	};

	case 4: //Plecaki
	{
		_ret =
		[
			["AM_PoliceBeltv2","Police Utility Belt v2",80]
		];
	};
};

_ret;
