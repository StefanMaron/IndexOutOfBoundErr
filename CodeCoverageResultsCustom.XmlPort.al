xmlport 50100 "CodeCoverageResultsCustom"
{
    Direction = Export;
    Format = VariableText;
    FieldDelimiter = '';
    FieldSeparator = ',';
    TableSeparator = '<NewLine>';
    TextEncoding = UTF16;

    schema
    {
        textelement(CodeCoverageResults)
        {
            tableelement(ALCodeCoverage; "Code Coverage")
            {
                fieldelement(ALObjectType; ALCodeCoverage."Object Type")
                {
                }
                fieldelement(ALObjectID; ALCodeCoverage."Object ID")
                {
                }
                fieldelement(ALLineNumber; ALCodeCoverage."Line No.")
                {
                }

                fieldelement(CoverageStatus; ALCodeCoverage."Code Coverage Status")
                {
                }
                fieldelement(ALNumberOfHits; ALCodeCoverage."No. of Hits")
                {
                }
            }
        }
    }

    trigger OnPreXmlPort()
    begin
        if ALCodeCoverage.FindSet() then
            repeat

            until ALCodeCoverage.Next() = 0; // Debugger should eventually stop here with Index out of bounds error
                                             // It will still error when the XML port reads the same record, but this way the debugger has a line to stop on
    end;
}