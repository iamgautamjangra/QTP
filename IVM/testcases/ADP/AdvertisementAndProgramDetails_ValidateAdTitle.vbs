'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	AdvertisementAndProgramDetails_ValidateAdTitles
' Description					:	Validate the AdTitles multiselect list box.
' Author 						:   Fonantrix Solution
' Date 							:   07-06-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_ValidateAdTitles", "REP_APD_TC_016"

DataSet=testcasedata.getvalue("DataSet")
strAdTitle=testcasedata.getvalue("strAdTitle")
strAdTitle1=testcasedata.getvalue("strAdTitle1")
strAdTitleAll=testcasedata.getvalue("strAdTitleAll")
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If
ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait Wait10

With ivm.page(report_page)

							.webTable("AvailableReports").presstblLink reportAdvertisementandProgramDetails,3
							 wait Wait5
                             .webLink("AdvancedSearch").press
									 wait Wait3
									 .webEdit("DatasetName").setValue DataSet
									 .webLink("AdvSearch").press
									wait Wait3
								
						    status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
						    if status=False Then
							Browser("SeaChangeManagementConsole").Refresh
						    wait wait8
						   .webLink("AdvancedSearch").press
								wait Wait3
								.webEdit("DatasetName").setValue DataSet
								wait 1
								.webLink("AdvSearch").press
								wait Wait3
							.webTable("DataSet").presstblRadioBtn DataSet,1
							
							wait Wait5
							
							.webEdit("AdTitle").assertExist "True"
							.webEdit("AdTitle").assertStatus "Visible"
							
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,"All","False"
							
							.assertListItems MULTI_LIST_AdTitle_APD &";"&DataSet,""
							
							.selectListItem MULTI_LIST_PROGRAMPID_AVAI,strProgramPID,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle1,"True"
							 wait Wait5
							
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle,"True"
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle1,"True"
							
							strAdTitleAll=testcasedata.getvalue("strAdTitleAll")
							
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"True"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"True"
                            .validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle,"True"
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle1,"True"							'''all items selected function
							
							strAdTitleAll=testcasedata.getvalue("strAdTitleAll")
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"False" '''all items deselected function
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle,"False"
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle1,"False"
							
							strAdTitleAll=testcasedata.getvalue("strAdTitleAll")
							strAdTitle=testcasedata.getvalue("strAdTitle")
							
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"True"
							 wait Wait5
							.selectListItem MULTI_LIST_ADTITLE_AVAI,strAdTitle,"False"
							 wait Wait5
							.validateSelectedListItem MULTI_LIST_ADTITLE_AVAI,strAdTitleAll,"False" 	
							
							.webButton("Cancel").press
							wait Wait5
End with	

'End Test Case
executionController.stopTestCase_w_TestCaseNumber "AdvertisementAndProgramDetails_ValidateAdTitles", "REP_APD_TC_016"