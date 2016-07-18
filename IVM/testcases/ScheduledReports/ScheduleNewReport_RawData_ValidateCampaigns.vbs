'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright SeaChange
'
' File Name						:	ScheduleNewReport_RawData_ValidateCampaigns
' Description					:	Validate "Campaigns" List box.
' Author 						:   SeaChange
' Date 							:   30-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "ScheduleNewReport_RawData_ValidateCampaigns", "SCR_NEW_RDR_TC_005"

ivm.NavigateToMenu MENU_SCHEDULED_REPORTS
wait Wait30

ReportName=testcasedata.getvalue("ReportName")
strCampaignAll=testcasedata.getvalue("strCampaignAll")
strCampaign=testcasedata.getvalue("strCampaign")
strCampaign1=testcasedata.getvalue("strCampaign1")

With ivm.page(ScheduledReports_Page)
			.webLink("ScheduleNewReport").press
			wait Wait15

			.webRadiogroup("ReportType").selectGroupItem reportRawData
			wait Wait8	
			.selectDate "FirstDate", CAMP_CAMP_FIRST_DATE
			wait Wait3		
			.selectDate "LastDate", CAMP_CAMP_LAST_DATE
			wait Wait3
			.webEdit("Campaign").assertExist "True"
			.webEdit("Campaign").assertStatus "Visible"

			.validateSelectedListItem MULTI_LIST_CAMPAIGN,"All","False"

			.assertListItems MULTI_LIST_CAMPAIGN & ";" & reportRawData,CAMP_FIRST_DATE & ";" & CAMP_LAST_DATE
			wait Wait5
			.assertListDGWDB MULTI_LIST_CAMPAIGN & ";"& reportRawData,CAMP_FIRST_DATE & ";" & CAMP_LAST_DATE
			wait Wait5

			.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"

			wait Wait2 
			.selectListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"
			wait Wait2
			strCampaign=testcasedata.getvalue("strCampaign")
			strCampaign1=testcasedata.getvalue("strCampaign1")

			.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"

			.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"
			wait Wait2
			strCampaignAll=testcasedata.getvalue("strCampaignAll")

			.selectListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"True"
			wait Wait2

			strCampaign=testcasedata.getvalue("strCampaign")
			strCampaign1=testcasedata.getvalue("strCampaign1")

			.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"True" '''all items selected function
			.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign,"True"

			.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign1,"True"

			.selectListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"False"
			wait Wait2
			.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"False" '''all items deselected function
			strCampaign=testcasedata.getvalue("strCampaign")

			strCampaign1=testcasedata.getvalue("strCampaign1")
			.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign,"False"

			.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaign1,"False"

			strCampaignAll=testcasedata.getvalue("strCampaignAll")
			strCampaign=testcasedata.getvalue("strCampaign")

			.selectListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"True"
			wait Wait2
			.selectListItem MULTI_LIST_CAMPAIGN,strCampaign,"False"
			wait Wait2
			.validateSelectedListItem MULTI_LIST_CAMPAIGN,strCampaignAll,"False" 	

			.webButton("Cancel").press

End With

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "ScheduleNewReport_RawData_ValidateCampaigns", "SCR_NEW_RDR_TC_005"
