# Collect Collection Membership Rules (No Direct Membership Rules!!)
$collections = Get-CMCollection
Foreach($collection in $collections){
    $rules = Foreach($Rule in $collection.CollectionRules){
        If($rule.SmsProviderObjectPath -ne 'SMS_CollectionRuleDirect'){
            $rule
        }
    }
    Foreach($rule in $rules){
        $ruleinfo = [PSCustomObject]@{
                'Collection Name' = $collection.Name
                'Rule Name' = $rule.RuleName
                'Query ID'= $rule.QueryID
                'Query' = $rule.QueryExpression
                'Query Type' = $rule.SmsProviderObjectPath 
        }#[PSCustomObject]@
        $ruleinfo|Export-Csv -Path c:\temp\CollectionRules.csv -NoTypeInformation -Append
    }
}