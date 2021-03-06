'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	IVMManager.vbs 
' Description					:	This is proxy file for containing library function and class for open and close IVM reports
' Author 						:   Fonantrix Solution
' Date 							:   
'--------------------------------------------------------------------------------------------------------------------------------------------------

Public ivm, rhq,MODULE_NAME,REPORT_NAME
Set rhq = New ivmRHQClass
rhq.internal_assign

Set ivm = New ivmControllerClass
ivm.internal_assign


Class ivmControllerClass
	
	Public appTarget,secTarget,m_target,m_reportingName
	
	Public Function internal_assign ()
		Set m_target  = Browser("SeaChangeManagementConsole")
		m_reportingname  = "ivm"
	End Function
	
	Public Sub clickCertificate()		
		If Browser("Certificate Error: Navigation").Page("Certificate Error: Navigation").Link("Continue to this website").Exist(0) Then
			Browser("Certificate Error: Navigation").Page("Certificate Error: Navigation").Link("Continue to this website").Click
			wait 30
		End If
	End Sub
	
	Public Sub startivmBrowser()
		reportController.reportStep m_reportingName & ".startivmBrowser"
		
		m_reportingname  = "ivm"
		If Environment("START_NEW_BROWSERS") = "True" Then
			
			SystemUtil.Run Environment("BROWSER_PATH"), Environment("APPLICATION_URL")
			
			Set m_target  = Browser("SeaChangeManagementConsole")
			wait 5
	
			If m_target.page("pgCertificateErrorNavigation").Link("lnkContinueWebsite").Exist(0) Then
	
			m_target.page("pgCertificateErrorNavigation").Link("lnkContinueWebsite").Click
			wait 5
			End If

		End If
		
	End Sub
	Public Function browserRefresh()
		reportController.reportStep m_reportingName & ".browserRefresh()"
		m_target.refresh
	End Function
	
	
	Public Function page(name)
		reportController.reportStep m_reportingName & ".page(" & name & ")"
		Set page = New ivmPage
		page.internal_assign m_target, m_reportingname, name
	End Function
	
	Public Function loginPage()
		reportController.reportStep m_reportingName & ".loginPage()"
		Set loginPage = New LoginPageProxy
		loginPage.internal_assign m_target, m_reportingname, name
	End Function
	
	Public Sub logIn
		reportController.reportStep m_reportingName & ".logIn()"
		
		ivm.page(Login_page).webEdit("Username").setValue Environment.Value("ADMIN_USER")
		ivm.page(Login_page).webEdit("Password").setValue Environment.Value("ADMIN_PASSWORD")
		ivm.page(Login_page).webLink("LogIn").press
		wait 5
    End Sub
	
	

Public Function NavigateToMenu (menuName)

			wait 1
                reportController.reportStep m_reportingName & ".NavigateToMenu(" & menuName & ")"
             
                Select case menuName
				
				Case MENU_SCHEDULED_REPORTS
				
				If instr(1,menuName,">") > 0 Then
                                arrmenuName = Split(menuName,">")
                Else
                                dim arrmenuName(0)
                                arrmenuName(0) = menuName
                End If
              ' Select Case arrmenuName(UBound(arrmenuName))
			'		Case "Regions and Markets"
			'				arrmenuName(UBound(arrmenuName)) = "MarketManager"
			'   End Select 
			
                For ik = 0 to UBound(arrmenuName)
					arrmenuName(ik) = replace(arrmenuName(ik)," " ,"")
					             
						

								 ivm.page(Common_page).webLink(arrmenuName(ik)).press
								wait 5
                Next
				setModuleName menuName
				wait 10
			Case else
			
			If instr(1,menuName,">") > 0 Then
                                arrmenuName = Split(menuName,">")
                Else
                               ' dim arrmenuName(0)
                                arrmenuName(0) = menuName
                End If
              ' Select Case arrmenuName(UBound(arrmenuName))
			'		Case "Regions and Markets"
			'				arrmenuName(UBound(arrmenuName)) = "MarketManager"
			'   End Select 
			
                For ik = 0 to UBound(arrmenuName) 
					arrmenuName(ik) = replace(arrmenuName(ik)," " ,"")
					            Setting.WebPackage("ReplayType") = 2 
                                ivm.page(Common_page).webLink(arrmenuName(ik)).press
								Setting.WebPackage("ReplayType") = 1
								wait 5
                Next
					setModuleName menuName

				End Select
			
			
			wait 7
End Function

			  
Public function Activatebowser()
			  
			  val=Browser("creationtime:=0").object.HWND
			  Setting.WebPackage("ReplayType") = 2 
			  window("hwnd:="&val).Activate
			  Setting.WebPackage("ReplayType") = 1 
			  reportController.reportStep m_reportingName & ".Activate browser()"		  
End function
			  
	Public Function ClickToMenu (menuName)			
		reportController.reportStep m_reportingName & ".ClickToMenu(" & menuName & ")"
			
            
				
				Select Case menuName
				
				Case MENU_SCHEDULED_REPORTS
				
                If instr(1,menuName,">") > 0 Then
                                arrmenuName = Split(menuName,">")
                Else
                               ' dim arrmenuName(0)
                                arrmenuName(0) = menuName
                End If

				arrmenuName(UBound(arrmenuName)) = replace(arrmenuName(UBound(arrmenuName))," " ,"")
                ivm.page(Common_page).webLink(arrmenuName(UBound(arrmenuName))).press
				wait 5
				ivm.page(ScheduledReports_Page).webList("SelectRowCount").selectItem "Show 40 rows"
			
			Case else
				If instr(1,menuName,">") > 0 Then
                                arrmenuName = Split(menuName,">")
                Else
                               dim arrmenuName(0)
                                arrmenuName(0) = menuName
                End If
				
				arrmenuName(UBound(arrmenuName)) = replace(arrmenuName(UBound(arrmenuName))," " ,"")
                ivm.page(Common_page).webLink(arrmenuName(UBound(arrmenuName))).press
			End select
End Function

	
	Public Function Close()
		reportController.reportStep m_reportingName & ".Close()"
		m_target.Close
		Set m_target  = Nothing
	End Function
	
	Public Sub assertExist(expected)
		reportController.reportStep m_reportingName & ".assertExists(" & expected & ")"
		wait(60)
		'Browser("Index:=0").Sync
		If m_target.Exist then
		    assertEquals trim(expected),trim(m_target.Exist), m_reportingName & ".assertExists(" & expected & ")"
		Else
		    Wait(1)
		End If
	End Sub
	
	Sub setModuleName(reportName)
		
		Select Case reportName
			Case "Available Reports"    '----Menu Constant
				MODULE_NAME = reportAlertSummary
		End Select
	
	End Sub
	
	
	Sub setReportName(reportName)
		Select case reportName
			Case reportAlertSummary,reportScheduledBreaks
				REPORT_NAME=reportName
		End Select
	End Sub
	
	
End Class


Class ivmRHQClass
  
	Public appTarget,secTarget,m_target

	Public Function internal_assign ()
		m_reportingname  = "RHQ"
		Set m_target  = Browser("SeaChangeRHQConsole")
	End Function
	
	Public Sub clickCertificate()		
		If Browser("Certificate Error: Navigation").Page("Certificate Error: Navigation").Link("Continue to this website").Exist(0) Then
			Browser("Certificate Error: Navigation").Page("Certificate Error: Navigation").Link("Continue to this website").Click
			wait 30
		End If
	End Sub
	
	
	Public Sub startIVMBrowser()
        reportController.reportStep m_reportingName & "startISMBrowser"
		
		m_reportingname  = "RHQ"
		If Environment("START_NEW_BROWSERS") = "True" Then

            
			
			Set m_target  = Browser("SeaChangeRHQConsole")
		
			wait 30
			If m_target.page("pgCertificateErrorNavigation").Link("lnkContinueWebsite").Exist(0) Then
				m_target.page("pgCertificateErrorNavigation").Link("lnkContinueWebsite").Click
				wait 30
			End If
			
        End If
		
	End Sub
 
	Public Function page(name)
		reportController.reportStep m_reportingName & ".page(" & name & ")"
		Set page = New ivmPage
		page.internal_assign m_target, m_reportingname, name
	End Function
  
	Public Function loginPage()
		reportController.reportStep m_reportingName & ".loginPage()"
		Set loginPage = New LoginPageProxy
		loginPage.internal_assign m_target, m_reportingname, name
	End Function

	Public Sub logIn
		reportController.reportStep m_reportingName & ".logIn()"
		
		loginuser = Environment.Value("ISM_USER")
		loginpassword = Environment.Value("ISM_PASSWORD")

		'Is App app already logged in?
		wait 5
		If m_target.Exist(10) Then
			If IsEmpty(loginPage1) Then
				Set loginPage1 = New LoginPageProxy
				loginPage1.internal_assign m_target, m_reportingName
			End If

			'Enter credentials
			loginPage1.username.setValue loginuser
			loginPage1.password.setValue loginpassword
			loginPage1.termsandconditions.setState "1"
			loginPage1.loginButton.press
			
			
			wait 5
			'continue
			loginInfoPage.continueButton.press
			
			Set loginPage1 = Nothing
			'Check if authenticated for 10 seconds
			debug m_reportingName & " logIn - checking for main page existence (timeout 10 seconds)"
		End If
    End Sub
	
	Public Function Close()
	  reportController.reportStep m_reportingName & ".Close()"
	  'm_target.Close
	  m_target.CloseAllTabs
	End Function
	
	Public Sub assertExist(expected)
		reportController.reportStep m_reportingName & ".assertExists(" & expected & ")"
		If m_target.Exist then
		    assertEquals trim(expected),trim(m_target.Exist), m_reportingName & ".assertExists(" & expected & ")"
		Else
		    Wait(1)
		End If
	End Sub
	
End Class

