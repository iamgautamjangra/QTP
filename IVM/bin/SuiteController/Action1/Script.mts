

''''*******************************************************************************************
suiteName = getEnvironmentValueFor("SUITE_NAME")
If suiteName = "" Then
    halt "Error, the environment variable SUITE_NAME was not set."
End If
projectDir = getEnvironmentValueFor("PROJECT_DIR")
If projectDir = "" Then
    halt "Error, the environment variable PROJECT_DIR was not set."
End If

' Start the test run
Set errors = executionController.loadSuite(suiteName, projectDir)
If errors.size() > 0 Then
    halt errors.toString()
End If

' Create the new report
result = reportController.startReport(suiteName)

If result <> "" Then
    halt result
End If

' Run the actual suite of tests
Set errors = executionController.executeSuite()
If errors.size() > 0 Then
   halt errors.toString()
End If

' Terminate reporting
reportController.stopReport

' Send email notification
'Set email = newEmail
'email.send
sendEmail

'*** Support ***
Private Sub halt(errorMessage)
    error "SuiteExecutor Error: " & errorMessage
    If Environment("ERROR_DIALOG_ON_END") = "True" Then
        MsgBox errorMessage, vbCritical, "SuiteExecutor Error"
        ExitActionIteration(errorMessage)
    End If
End Sub


Public Function sendEmail
   strFlowName = Environment.Value("TESTCASES_DIR")
   If strFlowName <> "" Then
	   arr = Split(strFlowName,"\")
	   strFlowName = arr(1)
	Else 
		strFlowName = "Flow1"
   End If
   
                                 If Ucase(Environment("MAIL_ENABLED")) = "TRUE" Then
                                   'Get path of result file 
                                                ExecutionFileName = getEnvironmentValueFor("EXECUTION_NAME")
                                                ResultDirectory =  Environment.Value("RESULTS_DIR")
                                                LogFileName = ResultDirectory & "\" & ExecutionFileName & ".log"
                                                ResultFileName = ResultDirectory & "\" & "Report.xls"  'ExecutionFileName & ".xls"
												ZipFileName = ResultDirectory & "\ZipResult" & getTimestamp & ".zip"
                                                CreateZipFile ZipFileName
'                                                'Attach log file in newly created zip file
                                                If fileExist(LogFileName) then 
                                                                AddFiletoZipFile ZipFileName,LogFileName
                                                                info LogFileName & " Attached"
                                                Else
                                                                info LogFileName & "-not found"
                                                End If
                                                                'Attach excel result file in newly created zip file
                                                If fileExist(ResultFileName) then 
                                                                AddFiletoZipFile ZipFileName,ResultFileName
                                                                info ResultFileName & " Attached"
                                                Else
                                                                info ResultFileName & "-not found"
                                                End If
                                                                'Attach turret html files in newly created zip file
                                                Set fso = CreateObject("Scripting.FileSystemObject")
                                                'If  fso.FolderExists(TurretResultFolder) Then
                                                '               AddFiletoZipFile ZipFileName,TurretResultFolder
                                                '               info TurretResultFolder & " Attached"
                                                'else 
                                                '               info ResultFileName & "-not found"
                                                'End If
                                                Set fso =Nothing
                                                
                                                'Create outlookobject to send a mail.
                                                Set Mail = CreateObject("CDO.Message") 
												 Mail.From =  "donotreply@fonantrix.com"
                                                Mail.to= Environment("MAIL_TO_USERS")
                                                Mail.CC=Environment("MAIL_CC_USERS")
                                                Mail.Subject=Environment("MAIL_SUBJECT") & strFlowName
                                                Mail.TextBody=Environment("MAIL_BODY")
                                                If (ZipFileName <> "") Then
                                                                Mail.AddAttachment ZipFileName
                                                End If
				
												'==This section provides the configuration information for the remote SMTP server.
												'==Normally you will only change the server name or IP.
												Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 

												'Name or IP of Remote SMTP Server
												Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtpout.secureserver.net"

												'Server port (typically 25)
												Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465

												Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") =1

												Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = true

												Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = "donotreply@fonantrix.com"

												Mail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "password"
												
												Mail.Configuration.Fields.Update
												
												'==End remote SMTP server configuration section==
												
                                                Mail.Send
                                                Set Mail = Nothing
                                                
                                End If
                End Function


                REM Public Function       SendResultEmail(ZipFileName)
                
                REM End Function


                Private Function CreateZipFile(NewZipFile)
                                MyHex = Array(80, 75, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0) 
                                For i = 0 To UBound(MyHex) 
                                MyBinary = MyBinary & Chr(MyHex(i)) 
                                Next 
                                Set fs=CreateObject("Scripting.FileSystemObject")
                                Set zf = fs.CreateTextFile(NewZipFile,true)
                                zf.Write MyBinary
                                zf.Close
                                Set fs = Nothing
                                Set zf = Nothing
                                wait(2)
                End Function

                'Function to add any file to created zip file -Added by Rachna 21-Dec-2011
                Private Function AddFiletoZipFile(ZipFile, FiletoAdd)
                   Set sa=CreateObject("Shell.Application")
                                sa.NameSpace(ZipFile).CopyHere FiletoAdd
                                wait(5)
                End Function


































