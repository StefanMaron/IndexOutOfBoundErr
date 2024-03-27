codeunit 50100 InstallTestApp
{

    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        TestSuite: Record "AL Test Suite";
    begin
        if not TestSuite.Get('DEFAULT') then exit;

        TestSuite."CC Exporter ID" := Xmlport::CodeCoverageResultsCustom;
        TestSuite.Modify(false);
    end;


}