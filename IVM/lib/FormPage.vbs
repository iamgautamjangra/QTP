'--------------------------------------------------------------------------------------------------------------------------------------------------
' (c) Copyright Fonantrix Solution
'
' File Name						:	FormPage.vbs 
' Description					:	This is proxy file for containing IVM class for IVM reports files
' Author 						:   Fonantrix Solution
' Date 							:   
'--------------------------------------------------------------------------------------------------------------------------------------------------
Dim pageName
dim formName

'IVM class for IVM page functions -validations and used for calling controls
Class IVMPage
	Public m_target, m_reportingName, m_waName,m_target1
	
	'For internal API use only
	Public Sub internal_assign(parentTarget, parentReportingName, strpageName)
		
		m_reportingName = parentReportingName & ".IVMPage"
		reportController.reportStep m_reportingName & ".internal_assign()"
		pageName = strpageName
		'Set workspace area to variable m_Waname
		m_Name = pageName
		'Set hierarchy as per the workspacearea define 
		
		Select Case m_name
			
			Case report_page,reportgen_page,ScheduledReports_Page,detailedData_page,preferredData_page,OnDemandReportPage
				set m_target = parentTarget.Page(m_Name).Frame("Frame")
				formName = "Reports"
				Set m_target1 = parentTarget.Page(m_Name)
			Case Else
				set m_target = parentTarget.Page(m_Name)
				Set m_target1 = parentTarget.Page(m_Name)
		End Select
	End Sub
	
	'function to check existence of the page
	Public Sub assertExist(expected)
		reportController.reportStep m_reportingName & ".assertExists(" & expected & ")"
		wait(10)
		'Browser("Index:=0").Sync
		If m_target.Exist then
		    assertEquals trim(expected),trim(m_target.Exist), m_reportingName & ".assertExists(" & expected & ")"
		Else
		    Wait(1)
		End If
	End Sub
	
	Public Sub clickCancel(nme)
		reportController.reportStep m_reportingName & ".clickLink(" & nme & ")"
		'Create an object for a link with any one property 
		Set lnk = Description.Create()
		lnk("html tag").value  = "A"
		Wait(3)
		'Set all child object to variable var1
		Set var1 = m_target.ChildObjects(lnk)
		R = 0
		'Apply a loop for count of child object
		For i = 0 to var1.count-1
			var2 = var1(i).getroproperty("text")
			
			'click on the link which you pass as a parameter 
			If var2  = nme Then
				R = 1
				var1(i).click
				Exit for
			End If
		Next
		if R = 0 then
			  'failTest m_reportingName & ".clickLink()" & " Link does not exists " & nme 
		End if 
		
	End Sub

	'Function to click on the link present on the current displaying screen	
    Public Sub clickLink(nme)
		reportController.reportStep m_reportingName & ".clickLink(" & nme & ")"
		'Create an object for a link with any one property 
		Set lnk = Description.Create()
		lnk("html tag").value  = "A"
		Wait(3)
		'Set all child object to variable var1
		Set var1 = m_target.ChildObjects(lnk)
		R = 0
		'Apply a loop for count of child object
		For i = 0 to var1.count-1
			var2 = var1(i).getroproperty("text")
			
			'click on the link which you pass as a parameter 
			If var2  = nme Then
				R = 1
				var1(i).click
				Exit for
			End If
		Next
		if R = 0 then
			  failTest m_reportingName & ".clickLink()" & " Link does not exists " & nme 
		End if 
		
	End Sub
	
	'Function to check the existence of link on the current displaying screen
	Public Sub assertExistLink(nme)
		
		'create an object for a link with one of the property
		Set lnk = Description.Create()
		lnk("html tag").value  = "A"
		Wait(3)
		'get the child object
		Set var1 = m_target.ChildObjects(lnk)
		R = 0
		For i = 0 to var1.count-1
			var2 = var1(i).getroproperty("text")
			
			'check for the exists
			If instr(var2,nme)>0 Then
				R = 1
				assertEquals True, trim(var1(i).Exist(0)), m_reportingName
				Exit for
			End If
		Next
		if R = 0 then
			  failTest m_reportingName & ".assertExistLink()" & " Link does not exists " & nme 
		End if
		
	End Sub
	
	'Function to check the existence of link on the current displaying screen
	Public Sub assertNotExistLink(nme)
		
		'create an object for a link with one of the property
		Set lnk = Description.Create()
		lnk("html tag").value  = "A"
		Wait(3)
		'get the child object
		Set var1 = m_target.ChildObjects(lnk)
		R = 0
		For i = 0 to var1.count-1
			var2 = var1(i).getroproperty("text")
			
			'check for the exists
			If instr(var2,nme)>0 Then
				R = 1
				assertEquals False, trim(var1(i).Exist(0)), m_reportingName
				Exit for
			End If
		Next
		if R >= 1 then
			  failTest m_reportingName & ".assertNotExistLink()" & " Link exists " & nme 
		End if
		
	End Sub
	
	'Function return the object of weblink type
    Public Function webLink(name)
	
		reportController.reportStep m_reportingName & ".weblink(" & name & ")"
		Set webLink = New WebLinkProxy
		webLink.internal_assign m_target, m_reportingName, name
	End Function
	
	'Function return the object of Webelement type
	Public function webElement(name)
		reportController.reportStep m_reportingName & ".webElement(" & name & ")"
		Set webElement = New WebelementProxy
		webElement.internal_assign m_target, m_reportingName, name
	End function
	
	'Function return the object of Webcheckbox type
	Public Function WebCheckBox(name)
		reportController.reportStep m_reportingName & ".webcheckBox(" & name & ")"
		Set webCheckBox = New WebcheckBoxProxy
		webCheckBox.internal_assign m_target, m_reportingname, name
	End Function
	
	'Function return the object of Webbutton type
	Public Function webButton(name)
		reportController.reportStep m_reportingName & ".webbutton(" & name & ")"
		Set webButton = New WebButtonProxy
		webButton.internal_assign m_target, m_reportingname, name
	End Function
	
	'Function return the object of WebRadioGroup type
	Public Function webRadioGroup(name)
		reportController.reportStep m_reportingName & ".webRadioGroup(" & name & ")"
		Set webRadioGroup = New WebRadioGroupProxy
		webRadioGroup.internal_assign m_target, m_reportingname, name
	End Function
	
	'Function return the object of WebImage type
	Public Function webImage(name)
		reportController.reportStep m_reportingName & ".webImage(" & name & ")"
		Set webImage = New WebImageProxy
		webImage.internal_assign m_target, m_reportingname, name
	End Function
	
	'Function return the object of WebTable type
	Public Function webTable(name)
		reportController.reportStep m_reportingName & ".webTable(" & name & ")"
		Set webTable = New WebTableProxy
		webTable.internal_assign m_target, m_reportingname, name
	End Function
	
	'Function return the object of webEdit type
    Public Function webEdit(name)
		reportController.reportStep m_reportingName & ".webEdit(" & name & ")"
		Set webEdit = New WebEditProxy
		webEdit.internal_assign m_target, m_reportingName, name
	End Function
	
	'Function return the object of webList type
    Public Function webList(name)
		reportController.reportStep m_reportingName & ".webList(" & name & ")"
		Set webList = New WebListProxy
		webList.internal_assign m_target, m_reportingName, name
	End Function

    'Validate the form GUI values (View) with Database values
	Public Sub assertformRecord(formName,ExpValue,strUIValues,strArgString)
		reportController.reportStep m_reportingName & ".assertformRecord(" & formName & ")"
		DatabaseConfig.assertformRecord_InFunction formName,ExpValue,strUIValues,strArgString
	End Sub
	
	Public Sub assertRecordDeleted(formName,ExpValue,strArgString)
		reportController.reportStep m_reportingName & ".assertRecordDeleted(" & formName & ")"
		DatabaseConfig.assertRecordDeleted_InFunction formName,ExpValue,strArgString
	End Sub

	
	Public Sub selectDate(strOption,strDate)
		reportController.reportStep m_reportingName & ".selectDate(" & strDate & ")"
	

		strDate=Trim(Replace(strDate,"#",""))
		
		strmonth = MonthName(month(strDate),"True")
		strYear = cstr (Year(strDate))
		strday = Day(strDate)
	
		
		Select case strOption
		Case "FirstDate"
			str = "imgFirstDate"
        
		Case "DataCreated"
		    str="imgDataCreated"
			
		Case "LastUpdated"
			str = "imgLastUpdated"	
			
		Case "StartDate"
			str = "imgStartDate"
			
		Case "EndDate"
			str = "imgEndDate"		
				
		Case "LastDate"
			str= "imgLastDate"
			
	   Case "LastLogIn"
			str = "imgLastLogIn"	
		
		Case "ScheduleDate"
			str= "imgScheduleDate"
				
		Case "EndDate"
			str= "imgEndDate"
		
		Case "BetweenDate"
			str= "imgBetween"
			
		Case "AndDate"
			str= "imgAnd"
				
		Case else
			info "Wrong date parameter"				
		
		End select
				m_target.Image(""& str).Click
				wait 2
				m_target.WebList("lstMonth").Select strmonth
			
				m_target.WebList("lstYear").Select  strYear
				
				m_target.Link("text:="& strday).Click
	End Sub
	
	
		'Date Time Function
		Public Sub selectDateTime(strOption,strDateTime)
		reportController.reportStep m_reportingName & ".selectDate(" & strDateTime & ")"
		arr = Split(strDateTime," ")
		strDate=arr(0)
		strTime=arr(1)
		strmonth = MonthName(month(strDate),"True")
		strYear = cstr (Year(strDate))
		strday = Day(strDate)
		arrTime=Split(strTime,":")
		strHour=arrTime(0)
		strMin=arrTime(1)
		
		Select case strOption
	
		Case "StartDate"
			str = "imgStartDate"
			
		Case "EndDate"
			str = "imgEndDate"		
				
		
		End select
				
				m_target.Image(""& str).Click
				wait 2
				m_target.WebList("lstMonth").Select strmonth
        	
				m_target.WebList("lstYear").Select  strYear
				m_target.Link("text:="& strday).Click
				
				n=100
					Do While n >10
								m_target.WebElement("weTimerHour").Drag
								m_target.WebElement("weTimerHour").Drop
								val=m_target.WebEdit("txtSearch"&strOption).GetROProperty("value")
				
				
								If Instr(1,val,strHourValue)>0 and instr (1,val,strarg) >0 then
								wait 2
									m_target.WebButton("btnDone").Click
									Exit Do
								End If    
					n=n-1
					Loop
			
	End Sub
	
	
	'Function to check the existence of web element on the current displaying screen
	Public Sub assertExistWE(nme,stStatus)
		reportController.reportStep m_reportingName & ".assertExistWE(" & trim(nme) & ")"
		'create an object for a web element  with one of the property
		Set lnk = Description.Create()
		lnk("micclass").value="WebElement"
		Wait(3)
		'get the child object
		'Set var1 = m_target.ChildObjects(nme)
		Set var1 = m_target.ChildObjects()
		R = 0
		
		For i = 0 to var1.count-1
				On error resume next
				var2 = var1(i).getroproperty("innertext")
				On error goto 0
			
			'check for the exists
            'instr(var2,nme)>0
			If trim(var2)=trim(nme) Then
				R = 1
				assertEquals True, trim(var1(i).Exist(0)), m_reportingName
				err.clear
				Exit for
			End If
		Next
		if R = 0 then
			If stStatus Then
				failTest m_reportingName & ".assertExistWE()" & " web element does not exists " & nme 
			End If
		Else
			If Not(stStatus) Then
				failTest m_reportingName & ".assertExistWE()" & " web element exists " & nme 
			End If
		End if
		
	End Sub
	
	Public Sub assertExistLNK(nme,stStatus,Operation)
		reportController.reportStep m_reportingName & ".assertExistLNK(" & nme & ")"
		'create an object for a web element  with one of the property
		Set lnk = Description.Create()
		lnk("micclass").value="Link"
		Wait(3)
		'get the child object
		'Set var1 = m_target.ChildObjects(nme)
		Set var1 = m_target.ChildObjects()
		R = 0
		
		For i = 0 to var1.count-1
			var2 = var1(i).getroproperty("innertext")
			
			
			'check for the exists
			If instr(var2,nme)>0 Then
				R = 1
				assertEquals True, trim(var1(i).Exist(0)), m_reportingName
				If Operation="Press" then
					var1(i).Click
				End If
				Exit for
			End If
		Next
		if R = 0 then
			If stStatus Then
				failTest m_reportingName & ".assertExistWE()" & " web element does not exists " & nme 
			End If
		Else
			If Not(stStatus) Then
				failTest m_reportingName & ".assertExistWE()" & " web element exists " & nme 
			End If
		End if
		
	End Sub

	
	'MULTI SELECT LIST
	'Select the Mutil List in Reports
	'Syntax - selectListItem MULTI_LIST_REGION,"region_2",True

	Public Sub selectListItem(listname,strValue,strOperation)
		reportController.reportStep m_reportingName & ".selectListItem(" & listname & ")"
		
		strlistname=split(listname,"_")
			listname=Lcase(strlistname(0))
		
		Select Case listname
			Case MULTI_LIST_DAYSOFWEEK,MULTI_LIST_DAYSOFMONTH
				If strValue="All" then
					strValue="on"
				End If
		End Select
		listname = LCase(listname)
		
		Set Object= Description.Create()
		Object("micclass").value="WebCheckBox"
		Object("type").value="checkbox"

		Set CheckBox_Object=m_target.ChildObjects(Object)
		
		Select Case strOperation
			Case "True"
				strOperation = "ON"
			Case "False"
				strOperation = "OFF"
		End Select

		If strValue = "All" Then
			For j=0 to CheckBox_Object.count -1
				If instr(1, lcase(CheckBox_Object(j).getroproperty("name")),listname) > 0  Then
					If instr(1, lcase(CheckBox_Object(j).getroproperty("name")),"all") > 0  Then
								CheckBox_Object(j).Set strOperation
								Exit sub
					End If
				End If
				'If instr(1, lcase(CheckBox_Object(j+1).getroproperty("name")),listname) > 0  Then
				'			CheckBox_Object(j+1).Set strOperation
				'End If
			Next
		End If
		Select Case listname
			Case MULTI_LIST_CAMPAIGN
		
		connectionString = "IVM_SYS_DATABASE_CONNECTION_STRING"
		strValue = getItemValue(listname,strValue,connectionString)
		debug "strValue : " & strValue
		End Select
		If strValue = "" Then
			failtest "Data not found for the query" 
			exit Sub
		End IF
		
		For j=0 to CheckBox_Object.count - 1
			If instr(1, lcase(CheckBox_Object(j).getroproperty("name")),listname) > 0  Then
				If CheckBox_Object(j).getroproperty("value") = cstr(strValue) Then
					Setting.WebPackage("ReplayType") = 2
			
					Select Case listname
					
					Case MULTI_LIST_DAYSOFWEEK
				    m_target.WebEdit("txtDaysOfWeek").Click
					wait 1
					CheckBox_Object(j).Set strOperation
					wait 1
					m_target.WebEdit("txtDaysOfWeek").Click
					wait 1
					Case MULTI_LIST_DAYSOFMONTH
				    m_target.WebEdit("txtDaysOfMonth").Click
					wait 1
					CheckBox_Object(j).Set strOperation
					wait 1
					m_target.WebEdit("txtDaysOfMonth").Click
					wait 1
					Case "time"
				    m_target.WebEdit("txtTimeRange").Click
					wait 1
					CheckBox_Object(j).Set strOperation
					wait 1
					m_target.WebEdit("txtTimeRange").Click
					wait 1
					Case "provider"
					m_target.WebEdit("txtProvider").Click
					wait 1
					CheckBox_Object(j).Set strOperation
					wait 1
					m_target.WebEdit("txtProvider").Click
					wait 1
					Case "campaign"
                    m_target.WebEdit("txtCampaign").Click
					wait 1
					CheckBox_Object(j).Set strOperation
					wait 1
					 m_target.WebEdit("txtCampaign").Click
					 wait 1
					Case "siteoption"
					m_target.WebEdit("txtSites").Click
					wait 1
					CheckBox_Object(j).Set strOperation
					wait 1
					m_target.WebEdit("txtSites").Click
					wait 1
					Case "site"
					m_target.WebEdit("txtSiteGroups").Click
					wait 1
					CheckBox_Object(j).Set strOperation
					wait 1
					m_target.WebEdit("txtSiteGroups").Click
					wait 1
					Case "date"
					m_target.WebEdit("txtTimeRange").Click
					wait 1
					CheckBox_Object(j).Set strOperation
					wait 1
					m_target.WebEdit("txtTimeRange").Click
					wait 1
                    Case "camp"
                    m_target.WebEdit("txtCampaignNames").Click
					wait 1
					CheckBox_Object(j).Set strOperation
					wait 1
					 m_target.WebEdit("txtCampaignNames").Click
					 wait 1
					Case "prog"
                     m_target.WebEdit("txtProgramPid").Click
					 wait 1
					 CheckBox_Object(j).Set strOperation
					 wait 1
					 m_target.WebEdit("txtProgramPid").Click
					 Case else
					CheckBox_Object(j).Set strOperation
					End Select
                   Setting.WebPackage("ReplayType") = 1
					REM CheckBox_Object(j).Set strOperation
					INFO "Value Set "
					Exit For
				End If
			End If
		Next
	End Sub
	
	'validateSelectedListItem MULTI_LIST_REGION,"All" ,"True"
	Public Sub validateSelectedListItem(listname,strValues,strOperation)
	
		reportController.reportStep m_reportingName & ".validateSelectedListItem(" & listname & ")"
		strValue = strValues

		listname = LCase(listname)
		strlistName = listname
		
		Select Case strOperation
			Case "ON"
					strOperation = "True"
			Case "OFF"
					strOperation = "False"
		End Select
		
		Set Object= Description.Create()
		Object("micclass").value="WebCheckBox"
		Object("type").value="checkbox"

		Set CheckBox_Object=m_target.ChildObjects(Object)

	If strValue = "All" or strValue ="on" Then
		
			For j=0 to CheckBox_Object.count - 2
				If instr(1, lcase(CheckBox_Object(j+1).getroproperty("name")),listname) > 0  Then
					If (CheckBox_Object(j+1).GetROProperty("checked") )= 1 Then
							blnFlag = "False"
						else 
							blnFlag = "True"
					End If
					Exit For
				End If
			Next
			
			For k=j to CheckBox_Object.count - 1
				If instr(1, CheckBox_Object(k).getroproperty("name"),listname) > 0  Then
					'If CheckBox_Object(j).getroproperty("value") = cstr(strValue) Then
							If (CheckBox_Object(k).GetROProperty("checked")) = 0 Then
								blnFlag = "False"
							Else 
								blnFlag = "True"
							End If
				End If
			Next
			If strOperation = True Then
				If blnFlag = True Then
					assertEquals True, True, "Value of check box Checked"
				Else
					assertEquals True, False, "Value of check box not Checked"
				End If

			Else
					If blnFlag = True Then
						assertEquals True, False, "Value of check box Checked"
				Else
						assertEquals True, True, "Value of check box not Checked"
				End If
	
			End If

			'assertEquals blnFlag, strOperation, "Value of chech box doesn't match "
			Exit Sub
		End If

		Select Case listname
				Case MULTI_LIST_CAMPAIGN
						connectionString = "IVM_SYS_DATABASE_CONNECTION_STRING"
						strValue = getItemValue(listname,strValue,connectionString)
						debug "strValue : " & strValue
						
						If strValue = "" Then
							failtest "Data not found for the query" 
							exit Sub
						End IF

		End Select

		For j=0 to CheckBox_Object.count - 1
			If instr(1, lcase(CheckBox_Object(j).getroproperty("name")),listname) >= 0  Then
				If CheckBox_Object(j).getroproperty("value") = cstr(strValue) Then
                    If (CheckBox_Object(j).GetROProperty("checked") )= 0 Then
							blnFlag = "False"
						Else
							blnFlag = "True"
					 End If
					Exit For
				End If
			End If
		Next
		assertEquals blnFlag, strOperation, "Value of chech box doesn't match"
	End Sub
	
	'The Function for assert Report  Multi Select List Item with Database
	Public Sub assertListItems(listname,strArgString)
		reportController.reportStep m_reportingName & ".assertListItems(" & listname & ")"

		list=split(listname,";")
		actListValue = getListItem(list(0))
		expListValue = getListValues(list(0),list(1),strArgString)
		
		info "EXPECTED VALUE" & "" & expListValue
		info "Actual Value" & "" & actListValue

		If expListValue = "" and  actListValue = "Null" Then
			assertEquals True,True, "Empty data"
			Exit Sub
		End If
		if instr(1,expListValue,"  ") > 0 Then
			expListValue = Replace(expListValue,"  "," ")
		End If

			arr = Split(expListValue,",")

			if arr(0) = "" Then
			expListValue = Right(expListValue,len(expListValue) - instr(1,expListValue,","))
			 
		End If
		
		arr = Split(actListValue,",")
		
		if instr(1,arr(0) , "Null") > 0 Then
			actListValue = Right(actListValue,len(actListValue) - instr(1,actListValue,","))
			 
		End If
		
		if arr(0) = "on" Then
			actListValue = Right(actListValue,len(actListValue) - instr(1,actListValue,","))
			 
		End If
						
		If lcase(left(actListValue,4)) = "null" Then
			actListValue = Mid(actListValue,6,len(actListValue)-5)
		End If
		
		If expListValue = "Null"  and  actListValue = "on" then
			info "List is empty"
			assertEquals True, True, "assertion Passed"
			Exit Sub
		End If
		
		If lcase(left(expListValue,1)) = "," Then
			actListValue = Mid(expListValue,2,len(expListValue)-1)
		End If
		If lcase(left(actListValue,1)) = "," Then
			actListValue = Mid(actListValue,2,len(actListValue)-1)
		End If
		If lcase(Right(actListValue,3)) = ",on" Then
			actListValue = Mid(actListValue,1,len(actListValue)-3)
		End If
		
		
		DatabaseConfig.compare expListValue, actListValue
		
	End Sub
	
	'gets all child items of that list
	Private Function getListItem(listname)
		reportController.reportStep m_reportingName & ".getListItem(" & listname & ")"
		
		Select case listname
		
		Case MULTI_LIST_PROGRAMPID_RD,MULTI_LIST_ADTITLE_APD,MULTI_LIST_PROGRAMPID_AD,MULTI_LIST_PROGRAMPID_APD,MULTI_LIST_TIMERANGE_UC,MULTI_LIST_PROGRAMPID_PS,MULTI_LIST_PROGRAMPID_AS,MULTI_LIST_CAMPAIGNNAMES_PS,MULTI_LIST_CAMPAIGNNAMES_AS,MULTI_LIST_CAMPAIGNNAMES_APD,MULTI_LIST_TIMERANGE_PS,MULTI_LIST_TIMERANGE_AD,MULTI_LIST_TIMERANGE_AS,MULTI_LIST_TIMERANGE_EOC,MULTI_LIST_CAMPAIGNNAMES_CS,MULTI_LIST_TIMERANGE_CS,MULTI_LIST_CAMPAIGNNAMES_RD,MULTI_LIST_CAMPAIGNNAMES_VOD,MULTI_LIST_CAMPAIGNNAMES_AD,MULTI_LIST_TIMERANGE_VOD,MULTI_LIST_PROGRAMPID_RD_ADV,MULTI_LIST_PROGRAMPID_RD_ADV1,MULTI_LIST_TIMERANGE_RS,MULTI_LIST_CAMPAIGNNAMES_RS
			arrListname=split(listname,"_")
			strListname=Lcase(arrListname(0))

        		Case Else
			strListname=Lcase(listname)
			
		End Select
		
		Set Object= Description.Create()
		Object("micclass").value="WebCheckBox"
		Object("type").value="checkbox"
		
		Set CheckBox_Object=m_target.ChildObjects(Object)
		
		For j=0 to CheckBox_Object.count - 1
			If instr(1, lcase(CheckBox_Object(j).getroproperty("name")),strListname) > 0  Then
				If lcase(Right(actListValue,2)) = "on" Then
					actListValue = Mid(actListValue,1,len(actListValue)-3)
				End If

							If instr(1,CheckBox_Object(j).getroproperty("value"),",") > 0 Then
								strval = Replace(CheckBox_Object(j).getroproperty("value"),",","COMAAA")
							Else
									strval = CheckBox_Object(j).getroproperty("value")
							End If
							if instr(1,strval,"""") > 0 Then
								strval = Replace(strval,"""","INVERTED")
							End If
							str = str & ";" & strval
			End If
		Next
		
		If str= "" Then
			getListItem = ""
            Exit Function
		End If
		
		str = Mid(str,2,len(str)-1)
		arr=replace(str,";",",")
		arr = Split(str,";")
			connectionString ="IVM_SYS_DATABASE_CONNECTION_STRING"
		
			For ik = 0 to Ubound(arr) 
				strValue = arr(ik)
				arr(ik) = getItemName(listname,strValue,connectionString)
			Next
			getListItem = Join(arr,",")

	End Function

	Public Function getListValues(listBoxName,reportName,strArgString)
		reportController.reportStep m_reportingName & ".getListValues(" & listBoxName & ")"
		If strArgString <> "" Then
			arrArg = Split(strArgString,";")
		eLSE
			Dim arrArg(0)
			arrArg(0) = ""
		End If

		For ig = 0 to Ubound(arrArg)
			aaa = arrArg(ig)
			arr = Split(aaa,",")
			For ip = 0 to ubound(arr)
				arr(ip) = "'" & arr(ip) & "'"

			Next
			arrArg(ig) = Join(arr,",")
		Next
		
		connectionString = "IVM_SYS_DATABASE_CONNECTION_STRING"                   
		Select Case listBoxName
			Case MULTI_LIST_DAYSOFWEEK
				getListValues = MULTI_LIST_DAYSOFWEEK_VALUE
				Exit Function
			Case MULTI_LIST_DAYSOFMONTH
				getListValues = MULTI_LIST_DAYSOFMONTH_VALUE
				Exit Function
			Case MULTI_LIST_PROVIDER
				url = Environment.Value("DATA_GATEWAY_URL") &"schedulereport/parameters?reportname="&reportName
				query = "\\parametername[text()='provider']/values"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_GROUPBY
				url = Environment.Value("DATA_GATEWAY_URL") &"schedulereport/parameters?reportname="&reportName
				query = "\\parametername[text()='group_by']/values"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
				
		   Case MULTI_LIST_CAMPAIGNNAMES,MULTI_LIST_CAMPAIGN
				url = Environment.Value("DATA_GATEWAY_URL") &"schedulereport/campaigns?sd="&CAMP_FIRST_DATE&"&ed="& CAMP_LAST_DATE
				query = "campaignsRow/campaignName"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_SITES
			'http://192.168.213.31:8080/datagateway/api/schedulereport/parameters?reportname=End Of Campaign
				url = Environment.Value("DATA_GATEWAY_URL") &"schedulereport/parameters?reportname="&reportName
				query = "\\parametername[text()='site']/values"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
				
			Case MULTI_LIST_SITEGROUPS
			'http://192.168.213.31:8080/datagateway/api/schedulereport/parameters?reportname=End Of Campaign
				url = Environment.Value("DATA_GATEWAY_URL") &"schedulereport/parameters?reportname="&reportName
				query = "\\parametername[text()='site_group']/values"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function	
				
			Case MULTI_LIST_CAMPAIGNNAMES_VOD
				url = Environment.Value("DATA_GATEWAY_URL") &"vodad/filters?datasetname="&reportName
				query = "\\filtername[text()='campaignName']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_CAMPAIGNNAMES_RD
				url = Environment.Value("DATA_GATEWAY_URL") &"rawdata/filters?datasetname="&reportName
				query = "\\filtername[text()='campaignName']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_CAMPAIGNNAMES_AD
				url = Environment.Value("DATA_GATEWAY_URL") &"alldetails/filters?datasetname="&reportName
				query = "\\filtername[text()='campaignName']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_CAMPAIGNNAMES_APD
				url = Environment.Value("DATA_GATEWAY_URL") &"advandprogdetails/filters?datasetname="&reportName
				query = "\\filtername[text()='campaignName']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_TIMERANGE_VOD
				url = Environment.Value("DATA_GATEWAY_URL") &"vodad/filters?datasetname="&reportName
				query = "\\filtername[text()='date']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_TIMERANGE_AS
				url = Environment.Value("DATA_GATEWAY_URL") &"advertisementsummary/filters?datasetname="&reportName
				query = "\\filtername[text()='timeRange']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_TIMERANGE_UC
				url = Environment.Value("DATA_GATEWAY_URL") &"uniquecustomer/filters?datasetname="&reportName
				query = "\\filtername[text()='timeRange']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_TIMERANGE_AD
				url = Environment.Value("DATA_GATEWAY_URL") &"alldetails/filters?datasetname="&reportName
				query = "\\filtername[text()='timeRange']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_PROGRAMPID_RD,MULTI_LIST_PROGRAMPID_RD_ADV,MULTI_LIST_PROGRAMPID_RD_ADV1,MULTI_LIST_PROGRAMPID_CSPRE
				url = Environment.Value("DATA_GATEWAY_URL") &"rawdata/filters?datasetname="&reportName
				query = "\\filtername[text()='progPid']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_PROGRAMPID_PS
				url = Environment.Value("DATA_GATEWAY_URL") &"programsummary/filters?datasetname="&reportName
				query = "\\filtername[text()='progPid']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_PROGRAMPID_AS
				url = Environment.Value("DATA_GATEWAY_URL") &"advertisementsummary/filters?datasetname="&reportName
				query = "\\filtername[text()='progProvider']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_PROGRAMPID_AD
				url = Environment.Value("DATA_GATEWAY_URL") &"alldetails/filters?datasetname="&reportName
				query = "\\filtername[text()='progPid']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_PROGRAMPID_APD
				url = Environment.Value("DATA_GATEWAY_URL") &"advandprogdetails/filters?datasetname="&reportName
				query = "\\filtername[text()='progPid']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_ADTITLE_APD
				url = Environment.Value("DATA_GATEWAY_URL") &"advandprogdetails/filters?datasetname="&reportName
				query = "\\filtername[text()='adTitle']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_CAMPAIGNNAMES_CS
				url = Environment.Value("DATA_GATEWAY_URL") &"/campaignsummary/filters?datasetname="&reportName
				query = "\\filtername[text()='campaignName']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_CAMPAIGNNAMES_AS
				url = Environment.Value("DATA_GATEWAY_URL") &"/advertisementsummary/filters?datasetname="&reportName
				query = "\\filtername[text()='campaignName']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_CAMPAIGNNAMES_PS
				url = Environment.Value("DATA_GATEWAY_URL") &"/programsummary/filters?datasetname="&reportName
				query = "\\filtername[text()='campaignName']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_TIMERANGE_CS
				url = Environment.Value("DATA_GATEWAY_URL") &"/campaignsummary/filters?datasetname="&reportName
				query = "\\filtername[text()='timeRange']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_TIMERANGE_EOC
				url = Environment.Value("DATA_GATEWAY_URL") &"/endofcampaign/filters?datasetname="&reportName
				query = "\\filtername[text()='timeRange']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_TIMERANGE_PS
				url = Environment.Value("DATA_GATEWAY_URL") &"/programsummary/filters?datasetname="&reportName
				query = "\\filtername[text()='timeRange']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_TIMERANGE_RS
				url = Environment.Value("DATA_GATEWAY_URL") &"/regionsummary/filters?datasetname="&reportName
				query = "\\filtername[text()='timeRange']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_TIMERANGE_APD
				url = Environment.Value("DATA_GATEWAY_URL") &"/advandprogdetails/filters?datasetname="&reportName
				query = "\\filtername[text()='timeRange']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case MULTI_LIST_CAMPAIGNNAMES_RS
				url = Environment.Value("DATA_GATEWAY_URL") &"/regionsummary/filters?datasetname="&reportName
				query = "\\filtername[text()='campaignName']/value"
				getListValues = getListValuesFromAPI(url,query)
				Exit Function
			Case Else
				info m_reportingName & ".getListValues(), " &  listBoxName & "  not found"
				assertequals True,False,listBoxName &" list not found, argument passed in the script is invalid"
				Exit Function
		End Select
        
		'Opening the database connection
		info "Opening the database connection"
		database.openConnection connectionString
		
		Info "connection Open"
		'dim EditDefList
		EditDefList=""
		info "Enter "& listBoxName &" Combo query is -->" & sql
		If sql<>"" then
			'Executing Query
            Set recordSet = database.executeQuery(sql)
            info "query Executed"
            While Not recordSet.EOF 
				EditDefList =  EditDefList & trim(recordSet.Fields(0))
                EditDefList =  EditDefList & ","
				recordSet.movenext
			Wend
            recordSet.Close
		End if
        
		If EditDefList <> "" Then
			EditDefList = Left(EditDefList, len(EditDefList)-1)
		End If
		database.closeConnection
		getListValues = EditDefList
	End Function
	
	Private Function getItemValue(listname,strValue1,connectionString)
		reportController.reportStep m_reportingName & ".getItemValue(" & listBoxName & ")"
		Select Case listname
			Case Test1
				sql = "Select id from regions where name = '" & strValue1 & "'"
				Info "Sql -> " & sql
				Info "field Value : " & strValue1
				strValue1 = DatabaseConfig.getfieldValue(sql,"id",connectionString)
				
			Case MULTI_LIST_PROVIDER
				sql = "Select provider from sys_providers where provider = '" & strValue1 & "'"
				str1 = DatabaseConfig.getfieldValue(sql,"provider",connectionString)
				
			Case MULTI_LIST_CAMPAIGNNAMES,MULTI_LIST_CAMPAIGN
				sql = "Select campaign_id from sys_campaigns where campaign_name = '" & strValue1 & "'"
				strValue1 = DatabaseConfig.getfieldValue(sql,"campaign_id",connectionString)
				
			Case Else
			
				strValue1 = strValue1
		End Select
			
			getItemValue = strValue1
	End Function
	
	Public Sub TimeSchedule(strDateTime)
        reportController.reportStep m_reportingName & ".TimeSchedule(" & strHourValue  &")"
        arr = Split(strDateTime,":")
		strHourValue = arr(0)
		strarg = arr(1)
		m_target.Image("imgWatch").Click
		n=100
			Do While n >10
				m_target.WebElement("weTimer").Drag
				m_target.WebElement("weTimer").Drop
				val=m_target.WebEdit("txtScheduleTime").GetROProperty("value")


				If Instr(1,val,strHourValue)>0 and instr (1,val,strarg) >0 then
				wait 2
					m_target.WebButton("btnDone").Click
					Exit Do
				End If    
				n=n-1
			Loop

	End Sub
	
	Private Function getItemName(listname,strValue1,connectionString)
		reportController.reportStep m_reportingName & ".getItemName(" & listname & ")"
		
		Select Case listname
		
				Case MULTI_LIST_SITES
					sql = "Select site_name from sys_sites where site_name = '" & strValue1 & "'"
                    str1 = DatabaseConfig.getfieldValue(sql,"site_name",connectionString)
				
				Case MULTI_LIST_PROVIDER
					sql = "Select provider from sys_providers where provider = '" & strValue1 & "'"
                    str1 = DatabaseConfig.getfieldValue(sql,"provider",connectionString)
				
				Case MULTI_LIST_CAMPAIGN,MULTI_LIST_CAMPAIGNNAMES_AVAI,MULTI_LIST_CAMPAIGNNAMES_Detail,MULTI_LIST_CAMPAIGNNAMES_AVAI1
					sql = "Select campaign_name from sys_campaigns where campaign_id = '" & strValue1 & "'"
                    str1 = DatabaseConfig.getfieldValue(sql,"campaign_name",connectionString)
					
				Case MULTI_LIST_PROGRAMPID_AVAI
					sql = "Select campaign_name from sys_campaigns where campaign_name = '" & strValue1 & "'"
                    str1 = DatabaseConfig.getfieldValue(sql,"campaign_name",connectionString)
				Case Else
						str1 = strValue1
			End Select
			Info "Sql -> " & sql
			Info "field Value : " & str1
			getItemName = str1

	End Function
	
	
	Sub selectCustomizeColumn(ColumnName,strOperation)
		
		reportController.reportStep m_reportingName & ".selectCustomizeColumn(" & ColumnName & ")"
		
		if ColumnName= "Bind GUID" then
			ColumnName="bindid"
		End if
		if ColumnName= "Placement Asset Type" then
			ColumnName="plassettype"
		End if
		if ColumnName= "Placement View Type Unknown" then
			ColumnName="plviewtypeunknown"
		End if
		if ColumnName= "Placement View Type Full" then
			ColumnName="plviewtypefull"
		End if
		if ColumnName= "Placement View Type Partial" then
			ColumnName="plviewtypepartial"
		End if 
		If ColumnName= "Placement View Type Fast Forward" then
		ColumnName="plviewtypeffw"
		End if 
		If ColumnName= "Placement Play Time" then
			ColumnName="plplaytime"
		End if
		If ColumnName= "Placement Fast Forwards" then
			ColumnName="plffw"
		End if
		If ColumnName= "Placement Rewinds" then
			ColumnName="plrew"
		End if
		If ColumnName= "Placement Pauses" then
			ColumnName="plpause"
		End if
		If ColumnName= "Placement Not Viewed" then
			ColumnName="plnotviewed"
		End if
		If ColumnName= "Prog PAID" then
			ColumnName="programpaid"
		End if
		If ColumnName= "Prog PID" then
			ColumnName="progpid"
		End if
		If ColumnName= "Prog PID" then
			ColumnName="progpid"
		End if
		If ColumnName= "Ad Impression Limit" then
			ColumnName="impressionlimit"
		End if
		
		ColumnName = LCase(Replace((ColumnName)," ",""))
			
		Set Object= Description.Create()
		Object("micclass").value="WebCheckBox"
		Object("type").value="checkbox"

		Set CheckBox_Object=m_target.ChildObjects(Object)
			
		Select Case strOperation
			Case "True"
				strOperation = "ON"
			Case "False"
				strOperation = "OFF"
		End Select
			
		
		For j=0 to CheckBox_Object.count - 1
			If instr(1,Lcase((CheckBox_Object(j).getroproperty("html id"))),ColumnName) > 0  Then
			
				CheckBox_Object(j).Set strOperation
				
				Exit Sub
			End If
		Next
			
	End Sub
	
	Sub validateCustomizeColumn(ColumnName,strOperation)
			
			reportController.reportStep m_reportingName & ".selectCustomizeColumn(" & ColumnName & ")"
			
			ColumnName = LCase(Replace(ColumnName," ",""))
			
			Set Object= Description.Create()
			Object("micclass").value="WebCheckBox"
			Object("type").value="checkbox"
			
			Set CheckBox_Object=m_target.ChildObjects(Object)
			
			blnFlag = "True"
			For j=0 to CheckBox_Object.count - 1
				If instr(1, lcase(CheckBox_Object(j).getroproperty("html id")),ColumnName) > 0  Then
					If (CheckBox_Object(j).GetROProperty("checked") = 1) Then
						blnFlag = "False"
					'Else
						'blnFlag = "True"
					End If
					Exit For
				End If
			Next
			
			If strOperation = True Then
				If blnFlag = True Then
					assertEquals True, True, "Value of check box Checked"
				Else
					assertEquals True, False, "Value of check box not Checked"
				End If
			Else
				If blnFlag = True Then
					assertEquals True, False, "Value of check box Checked"
				Else
					assertEquals True, True, "Value of check box not Checked"
				End If
			End If
			
		End Sub
	
	Public Sub selectAllListItem(listname,strOperation)
			reportController.reportStep m_reportingName & ".selectListItem(" & listname & ")"
			
			listname = LCase(listname)
			
			Set Object= Description.Create()
			Object("micclass").value="WebCheckBox"
			Object("type").value="checkbox"
			
			Set CheckBox_Object=m_target.ChildObjects(Object)
			
			Select Case strOperation
				Case "True"
					strOperation = "ON"
				Case "False"
					strOperation = "OFF"
			End Select
			
			For j=0 to CheckBox_Object.count - 1
					If instr(1, lcase(CheckBox_Object(j+1).getroproperty("name")),listname) > 0  Then
						CheckBox_Object(j).Set strOperation
					End If
			Next
	End Sub
		
	'Function to validate Type Ahead Text
	Public function assertListSearch(listname,srchString)
		reportController.reportStep m_reportingName & ".assertListSearch(" & listname & ")"
		Select Case listname
			Case else
				listname=Lcase(listname)
		End Select
		
		listname=Lcase(listname)
		
		Set Object= Description.Create()
		Object("micclass").value="WebElement"
		Object("html tag").value="LABEL"
		
		Set Element_Object=m_target.ChildObjects(Object)
		
		For j=0 to Element_Object.count - 1
			If instr(1,Lcase(Element_Object(j).getroproperty("innerhtml")),listname) > 0   and  Element_Object(j).Object.currentStyle.display <> "none" Then
				If instr(1, Lcase(Element_Object(j).getroproperty("innertext")),Lcase(srchString)) = 1Then
					tmp=Element_Object(j).getroproperty("innertext")
					str=str & ";" & tmp
				End If
			End if 
		Next
		
		blnFalg = True
		str=Right(str,len(str)-1)
		arr= Split(str,";")
		
			For k =0 to Ubound(arr)
				If  Strcomp(Mid(arr(k),1,len( srchString)) ,srchString,1) =0  Then
					info "Matched the criteria --->" & arr(k)
					blnFalg = False
					Else
					info "Doesnt matched the criteria--->" & arr(k)  
					blnFalg = True
				End If
				assertEquals False,blnFalg,"value not matched"
			Next
			
	End Function
	
	
	Sub assertListDGWDB(listBoxName,strArgstr)
		reportController.reportStep m_reportingName & ".assertListDGWDB(" & listBoxName & ")"
		connectionString = "IVM_SYS_DATABASE_CONNECTION_STRING"
	
	list=split(listBoxName,";")
	
	If strArgstr <> "" Then
			arrArg = Split(strArgstr,";")
		eLSE
			Dim arrArg(0)
			arrArg(0) = ""
		End If

	
	Select case list(0)
		
		Case MULTI_LIST_CAMPAIGN,MULTI_LIST_CAMPAIGNNAMES
			strDGWData = getListValues(list(0),list(1),strArgstr) 
			
			sql = "Select campaign_name from sys_campaigns where start_date >="&chr(34)&arrArg(0)&chr(34)& " AND end_date <=" &chr(34) &arrArg(1)&chr(34)
			strDBData = DatabaseConfig.getRecords(sql,connectionString)
			DatabaseConfig.compare strDBData,strDGWData
			
		Case MULTI_LIST_SITES
			strDGWData = getListValues(list(0),list(1),strArgstr)
			sql = "Select site_name from sys_sites"
			strDBData = DatabaseConfig.getRecords(sql,connectionString)
			DatabaseConfig.compare strDBData,strDGWData
			
		Case MULTI_LIST_SITEGROUPS
			strDGWData = getListValues(list(0),list(1),strArgstr)
			sql = "Select sitegroup_name from sys_sitegroups"
			strDBData = DatabaseConfig.getRecords(sql,connectionString)
			DatabaseConfig.compare strDBData,strDGWData
			
		Case MULTI_LIST_PROVIDER
			strDGWData = getListValues(list(0),list(1),strArgstr)

			arr = Split(strDGWData,",")

			if arr(0) = "" Then
			strDGWData = Right(strDGWData,len(strDGWData) - instr(1,strDGWData,","))
			 
		End If
			sql = "Select provider from sys_providers"
			strDBData = DatabaseConfig.getRecords(sql,connectionString)
				arr = Split(strDBData,",")

			if arr(0) = "" Then
			strDBData = Right(strDBData,len(strDBData) - instr(1,strDBData,","))
			 
		End If
			DatabaseConfig.compare strDBData,strDGWData
			
		Case MULTI_LIST_GROUPBY
			strDGWData = getListValues(list(0),list(1),strArgstr)
			sql = "Select grouping_option from sys_grouping"
			strDBData = DatabaseConfig.getRecords(sql,connectionString)
			DatabaseConfig.compare strDBData,strDGWData
		End Select
	End Sub
	
	Public function assertCustomizeColumnSearch(srchString,strArgString)
		reportController.reportStep m_reportingName & ".assertCustomizeColumnSearch(" & srchString & ")"
		srchString=Lcase(srchString)
		
		Set Object= Description.Create()
		Object("micclass").value="WebElement"
		Object("html tag").value="LABEL"
		
		Set Element_Object=m_target.ChildObjects(Object)
		
		For j=0 to Element_Object.count - 1
			If instr(1, Lcase(Element_Object(j).getroproperty("innertext")),Lcase(srchString)) = 1   and  Element_Object(j).Object.currentStyle.display <> "none" Then
				tmp=Element_Object(j).getroproperty("innertext")
				str=str & ";" & tmp
			End If
		Next
		
		If  str <> "" Then
			assertEquals strArgString, True, "Column exist"
		Else
			assertEquals strArgString, False, "Column does not exist"
		Exit Function
		End If
		
		blnFalg = True
		str=Right(str,len(str)-1)
		arr= Split(str,";")
		
		For k =0 to Ubound(arr)
					
			If  Strcomp(Mid(arr(k),1,len( srchString)) ,srchString,1) =0  Then
				info "Matched the criteria --->" & arr(k)
				blnFalg = False
				Else
				info "Doesnt matched the criteria--->" & arr(k)  
				blnFalg = True
			End If
			assertEquals False,blnFalg,"value not matched"
		Next
			
	End Function
End Class
