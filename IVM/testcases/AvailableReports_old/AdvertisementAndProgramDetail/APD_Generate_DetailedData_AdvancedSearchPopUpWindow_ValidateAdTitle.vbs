'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateAdTitle
' Description					:	Validate the Campaign Name filter using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateAdTitle", "REP_APD_TC_044"

DataSet=testcasedata.getvalue("DataSet")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strAdTitle=testcasedata.getvalue("strAdTitle")
strAdTitle1=testcasedata.getvalue("strAdTitle1")
strAdTitleAll=testcasedata.getvalue("strAdTitleAll")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7
 
With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with

With ivm.page(detailedData_page)

							.weblink("DetailedData").press
							wait 4
							
						    .webLink("AdvancedSearch").press
							wait 2
							
							
							.webEdit("AdTitle_Adv").assertExist "True"
							.webEdit("AdTitle_Adv").assertStatus "Visible"
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,"All","False"
							
							.assertListItems MULTI_LIST_AdTitleS_APD & ";"& DataSet,""
							
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle,"True"
							 wait 2
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle1,"True"
							 wait 2
							
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle,"True"
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle1,"True"
							
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"True"
							 wait 2
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"True" '''all items selected function
							
							strAdTitleAll=testcasedata.getvalue("strAdTitleAll")
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"False" '''all items deselected function
							
							strAdTitleAll=testcasedata.getvalue("strAdTitleAll")
							strAdTitle=testcasedata.getvalue("strAdTitle")
							
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"True"
							 wait 4
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle,"False"
							 wait 2
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"False"
							
							wait 2
							
							.webLink("AdvClearAll").press
							wait 2	
							
							strAdTitle=testcasedata.getvalue("strAdTitle")
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle,"True"
							wait 2
							
							.webLink("AdvSearch").press
							wait 5
							
							.webElement("AdTitle_Filter").assertExist "True"
							If len(strAdTitle)>9 then 
							.webElement("AdTitle_Filter").assertText  "Campaign Name ="& mid(strAdTitle,1,10) &".." &"   X"
							
							Else
							.webElement("AdTitle_Filter").assertText  "Campaign Name ="& strAdTitle &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("DetailedData_APD").assertExist "True"
							
						
							.webTable("DetailedData_APD").assertValue strAdTitle,"3"
							wait 5	
							.webTable("DetailedData_APD").assertDelValue strAdTitle1
							.webLink("ClearAll").press
							wait 5
							.webElement("AdTitle_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("DetailedData_APD").assertValue strAdTitle,"3"
							.webTable("DetailedData_APD").assertValue strAdTitle1,"3"
							
End with			
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_Generate_DetailedData_APDvancedSearchPopUpWindow_ValidateAdTitle", "REP_APD_TC_044"