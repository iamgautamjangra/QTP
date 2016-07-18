'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Seachange
'
' File Name						:	Roles_Validate_Filter_ByAdvanceSearch
' Description					:	Validate the functionality of AdvanceSearch filter
' Author 						:   Fonantrix Solution
' Date 							:   20-06-2012
'--------------------------------------------------------------------------------------------------------------------------------------------------

'Start Test Case
executionController.startTestCase_w_TestCaseNumber "Roles_Validate_Filter_ByAdvanceSearch", "AAA_ATH_TC_003"
	

'Validate labels
strLocation=testcasedata.getvalue("Location")
strUpdateAt=testcasedata.getvalue("UpdateAt")
strSearchRolename=testcasedata.getvalue("SearchRolename")
strSearchTerm=testcasedata.getvalue("SearchTerm")

strLocationBlank=testcasedata.getvalue("LocationBlank")
strUpdateAtBlank=testcasedata.getvalue("UpdateAtBlank")
strSearchRolenameBlank=testcasedata.getvalue("SearchRolenameBlank")
strSearchTermBlank=testcasedata.getvalue("SearchTermBlank")

with ivm.page(Roles_page)

						.webLink("AdvanceSearch").press
						.webLink("ClearAll").press
						.webEdit("AdvSearchTerm").setValue strSearchTerm
						.webEdit("SearchRoleName").setValue strSearchRolename
                        .selectDate "LastUpdated", UpdateAt

                        .webEdit("Location").setValue strLocation
                        .webLink("Search").press
                        .webLink("CreateNewRole").assertStatus "Visible"
						.webLink("SearchTerm").assertStatus "Visible" 
						.webLink("SearchTerm").assertExist "True"
						.webElement("SearchCriteria").assertStatus "Visible"
						.webElement("SearchCriteria").assertExist "True"
						.webLink("Name").assertStatus "Visible"
						.webLink("Name").assertExist "True"
						.webLink("LocationName").assertStatus "Visible"
						.webLink("LocationName").assertExist "True"
						.webLink("ClearAllSearch").assertStatus "Visible"
						.webLink("ClearAllSearch").assertExist "True"
						.webLink("AdvanceSearch").press
						.webLink("ClearAll").press
						.webEdit("SearchTerm").setValue strSearchTermBlank
						.webEdit("SearchRoleName").setValue strSearchRolenameBlank
						.webEdit("SearchLocation").setValue strLocationBlank
						.webLink("Search").press
						.webLink("Name").assertExist "False"
						.webLink("ClearAll").press
						
						
						.webLink("PreferredData").press
							wait 4
							
						    .webLink("AdvancedSearch").press
							wait 3
							
							.webEdit("ProgramPID_Adv").setValue strProgramPID
						   
							.webLink("AdvSearch").press
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPID)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPID,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPID &"   X"
							
							End If
						    .webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_CS").assertExist "True"
							
						
							.webTable("PreferredData_CS").assertValue strProgramPID,"4"
							wait Wait5	
							.webTable("PreferredData_CS").assertDelValue strProgramPID1
							.webLink("ClearAll").press
							wait Wait5
							.webElement("ProgramPID_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							'.webLink("ClearAll").assertStatus "NotVisible"
							
							.webTable("PreferredData_CS").assertValue strProgramPID1,"4"
							wait Wait5
							
							
REM 'For invalid
							.webLink("AdvancedSearch").press
							wait Wait5
							
							.webEdit("ProgramPID_Adv").setValue strProgramPIDInv
						    wait 2
							.webLink("AdvSearch").press
							wait Wait5	
							
							'.webTable("SearchCriteria_CS").assertExist "True" 
							' .webTable("SearchCriteria_CS").assertStatus "Visible"
							
							.webElement("ProgramPID_Filter").assertExist "True"
							If len(strProgramPIDInv)>9 then 
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& mid(strProgramPIDInv,1,10) &".." &"   X"
							
							Else
							.webElement("ProgramPID_Filter").assertText  "Program PID ="& strProgramPIDInv &"   X"
							End If
							
							.webElement("ProgramPID_Filter").assertExist "True"
							.webLink("ClearAll").assertExist "True"
							.webLink("ClearAll").assertStatus "Visible"
							
							.webTable("PreferredData_CS").assertExist "True"
						
							.webTable("PreferredData_CS").searchData NoRecordFound_msg
							
							.webTable("PreferredData_CS").assertDelValue strProgramPID
							.webTable("PreferredData_CS").assertDelValue strProgramPID1
							wait Wait5
							
							.webLink("ClearAll").press
							
							wait Wait5
							.webElement("ProgramPID_Filter").assertExist "False"
							
							'.webLink("ClearAll").assertExist "False"
							
							.webTable("PreferredData_CS").assertValue strProgramPID,"4"
							
							.webTable("PreferredData_CS").assertValue strProgramPID1,"4"
							
							.webTable("PreferredData_CS").assertDelValue NoRecordFound_msg
							
						
End With
============================================================================================


  
'End Test Case  
executionController.stopTestCase_w_TestCaseNumber "Roles_Validate_Filter_ByAdvanceSearch", "AAA_ATH_TC_003"

