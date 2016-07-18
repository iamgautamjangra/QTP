'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateRegionName
' Description					:	Validate the Region Summary filter using advanced search.
' Author 						:   Fonantrix Solution
' Date 							:   03-07-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateRegionName", "REP_RSR_TC_027"

DataSet=testcasedata.getvalue("DataSet")
strTimeRange=testcasedata.getvalue("strTimeRange")
strCampaign=testcasedata.getvalue("strCampaign")
strEmail=testcasedata.getvalue("strEmail")
strStorageLocation=testcasedata.getvalue("strStorageLocation")
strReportFormat=testcasedata.getvalue("strReportFormat")
strDataType=testcasedata.getvalue("strDataType")
strComments=testcasedata.getvalue("strComments")
strRegionName=testcasedata.getvalue("strRegionName")
strRegionName1=testcasedata.getvalue("strRegionName1")
strRegionNameInv=testcasedata.getvalue("strRegionNameInv")

ivm.ClickToMenu MENU_AVAILABLE_REPORTS
wait 7

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportRegionSummary,3
						 wait 10	
						 
						.webTable("DataSet").presstblRadioBtn DataSet,1 
						wait 7
						.selectListItem MULTI_LIST_TIMERANGE_AVAI1,strTimeRange,"True"
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait 2
						.webEdit("EmailRecipients").setValue strEmail
							
						.webEdit("StorageLocation").setValue strStorageLocation
							
						.webList("ReportFormat").selectItem strReportFormat
							
						.webList("DataType").selectItem strDataType
							
						.webEdit("Comments").setValue strComments
						.webButton("Generate").press
						wait 10
End with 
	

With ivm.page(preferredData_page)	

							.webLink("PreferredData").press
							wait 4
							
						    .webLink("AdvancedSearch").press
							wait 3
							
							.webEdit("RegionName_Adv").setValue strRegionName
						   
							.webLink("AdvSearch").press
							.webElement("RegionName_Filter").assertExist "True"
							If len(strRegionName)>9 then 
							.webElement("RegionName_Filter").assertText  "Region Name ="& mid(strRegionName,1,10) &".." &"   X"
							
							Else
							.webElement("RegionName_Filter").assertText  "Region Name ="& strRegionName &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RS").assertExist "True"
							
						
							.webTable("PreferredData_RS").assertValue strRegionName,"6"
							wait 5	
							.webTable("PreferredData_RS").assertDelValue strRegionName1
							.webLink("ClearAll").press
							wait 5
							.webElement("RegionName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("PreferredData_RS").assertValue strRegionName1,"6"
							wait 5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait 5
							
							.webEdit("RegionName_Adv").setValue strRegionNameInv
						    wait 2
							.webLink("AdvSearch").press
							wait 5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("RegionName_Filter").assertExist "True"
							If len(strRegionNameInv)>9 then 
							.webElement("RegionName_Filter").assertText  "Region Name ="& mid(strRegionNameInv,1,10) &".." &"   X"
							
							Else
							.webElement("RegionName_Filter").assertText  "Region Name ="& strRegionNameInv &"   X"
							End If
							
							.webElement("RegionName_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_RS").assertExist "True"
						
							.webTable("PreferredData_RS").searchData NoRecordFound_msg
							
							.webTable("PreferredData_RS").assertDelValue strRegionName
							.webTable("PreferredData_RS").assertDelValue strRegionName1
							wait 5
							
							.webLink("ClearAll").press
							
							wait 5
							.webElement("RegionName_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("PreferredData_RS").assertValue strRegionName,"6"
							
							.webTable("PreferredData_RS").assertValue strRegionName1,"6"
							
							.webTable("PreferredData_RS").assertDelValue NoRecordFound_msg
							
					        
End with
'End Test Case
executionController.stopTestCase_w_TestCaseNumber "RegionSummary_Generate_PreferredData_AdvancedSearchPopUpWindow_ValidateRegionName", "REP_RSR_TC_027"