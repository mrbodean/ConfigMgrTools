$sms = new-object –comobject "Microsoft.SMS.Client"
If($sms.GetAssignedSite() -ne ‘XXX’){$sms.SetAssignedSite(‘XXX’)}