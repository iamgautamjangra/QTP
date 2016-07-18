' (c) Copyright SeaChange
'
' File Name						:	VOD_Generate_SelectedProvidera_AdvancedSearchPopUpWindow_ValidateContentReference 
' Description					:   Validate "Content Reference" text box in the Advanced Search Popup Window.
' Author 						:   SeaChange
' Date 							:   15-05-2013
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "VOD_Generate_SelectedProvidera_AdvancedSearchPopUpWindow_ValidateContentReference ", "REP_VOD_TC_027"
status=Browser("SeaChangeManagementConsole").Page("pgAvailableReports").Frame("Frame").Exist(10)
If status=False Then
Browser("SeaChangeManagementConsole").Refresh
wait 5
End If

strSeachValue=testcasedata.getvalue("strSeachValue")
strTimeRange=testcasedata.getvalue("strTimeRange")
strProvider=testcasedata.getvalue("strProvider")
strCampaign=testcasedata.getvalue("strCampaign")
strComments=testcasedata.getvalue("strComments")
strContentReference=testcasedata.getvalue("strContentReference")
strContentReference1=testcasedata.getvalue("strContentReference1")
strContentReferenceInv=testcasedata.getvalue("strContentReferenceInv")

ivm.NavigateToMenu MENU_AVAILABLE_REPORTS
wait Wait10

DataSet=DATASET_VODADDELIVERYDATAFEED

With ivm.page(report_page)

						.webTable("AvailableReports").presstblLink reportVODAdDeliveryDataFeed,3
						 wait Wait10	
						 
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
						wait Wait8
						.webEdit("DatasetName").setValue DataSet
						.webLink("AdvSearch").press
						wait wait8
						end if
						.webTable("DataSet").presstblRadioBtn DataSet,1
												
							wait Wait10
									
						.selectListItem MULTI_LIST_TIMERANGE,strTimeRange,"True"
						wait Wait2
						.selectListItem MULTI_LIST_CAMPAIGNNAMES_AVAI,strCampaign,"True"
						wait Wait2
					    .webList("Provider").selectItem strProvider
						 wait Wait5		
						.webEdit("Comments").setValue strComments
		
						.webButton("Generate").press
						wait Wait8
End with	

With ivm.page(PreferredData_page)	

							
							.assertExistLNK strProvider,"True","Press"
							wait Wait7
							
							.webTable("ProviderData").assertExist "True"
							
						    .webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ContentReference_Adv").setValue strContentReference
						    wait Wait5
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							'.webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("ContentReference_Filter").assertExist "True"
							If len(strContentReference)>9 then 
							.webElement("ContentReference_Filter").assertText  "Content Reference ="& mid(strContentReference,1,8) &".." &"   X"
							
							Else
							.webElement("ContentReference_Filter").assertText  "Content Reference ="& strContentReference &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("ProviderData").assertExist "True"
							
						
							.webTable("ProviderData").assertValue strContentReference,"3"
							wait Wait5	
							'.webTable("ProviderData").assertDelValue strContentReference1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ContentReference_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("ProviderData").assertValue strContentReference1,"3"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ContentReference_Adv").setValue strContentReferenceInv
						    wait Wait5
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("ContentReference_Filter").assertExist "True"
							If len(strContentReferenceInv)>9 then 
							.webElement("ContentReference_Filter").assertText  "Content Reference ="& mid(strContentReferenceInv,1,8) &".." &"   X"
							
							Else
							.webElement("ContentReference_Filter").assertText  "Content Reference ="& strContentReferenceInv &"   X"
							End If
							
							.webElement("ContentReference_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("ProviderData").assertExist "True"
						
							.webTable("ProviderData").searchData NoRecordFound_msg
							
							.webTable("ProviderData").assertDelValue strContentReference
							.webTable("ProviderData").assertDelValue strContentReference1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("ContentReference_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("ProviderData").assertValue strContentReference,"3"
							
							.webTable("ProviderData").assertValue strContentReference1,"3"
							
							.webTable("ProviderData").assertDelValue NoRecordFound_msg
							
					        
							
End with

'End Test Case 
executionController.stopTestCase_w_TestCaseNumber "VOD_Generate_SelectedProvidera_AdvancedSearchPopUpWindow_ValidateContentReference ", "REP_VOD_TC_027"
