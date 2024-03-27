codeunit 50101 MyTestCodeunit
{
    Subtype = Test;

    [Test]
    procedure TestMyFunction()
    begin
        ActivateFeature('SomeRandomFeature');
    end;

    local procedure ActivateFeature(FeatureID: Code[50])
    var
        Company: Record Company;
        ConditionProvider: Codeunit ConditionProvider_FF_TSL;
        Argument: Text;
    begin
        Company.SetRange(Name, CompanyName());
        Argument := Company.GetView();
        ConditionProvider.AddCondition('EvaluationComp', ConditionFunction_FF_TSL::CompanyFilter, Argument);
        ConditionProvider.AddFeatureCondition(FeatureID, 'EvaluationComp');
    end;
}