using { makerspaceSrv } from '../srv/service.cds';

annotate makerspaceSrv.HardwareCategory with @odata.draft.enabled;
annotate makerspaceSrv.Loan with @odata.draft.enabled;
annotate makerspaceSrv.HardwareCategory with @cds.odata.valuelist;
annotate makerspaceSrv.HardwareType with @cds.odata.valuelist;
annotate makerspaceSrv.Loan with @cds.odata.valuelist;
annotate makerspaceSrv.HardwareInstance with @cds.odata.valuelist;
annotate makerspaceSrv.HardwareCategory with @UI.HeaderInfo: { TypeName: 'Hardware Category', TypeNamePlural: 'Hardware Categories', Title: { Value: categoryName } };
annotate makerspaceSrv.HardwareCategory with {
  ID @Common.Text: { $value: categoryName, ![@UI.TextArrangement]: #TextOnly }
};
annotate makerspaceSrv.HardwareCategory with @UI.Identification: [{ Value: categoryName }];
annotate makerspaceSrv.HardwareCategory with {
  categoryName @title: 'Category Name'
};

annotate makerspaceSrv.HardwareCategory with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: categoryName }
];

annotate makerspaceSrv.HardwareCategory with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: categoryName }
  ]
};

annotate makerspaceSrv.HardwareCategory with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'HardwareType', Target : 'hardwareTypes/@UI.LineItem' }
];

annotate makerspaceSrv.HardwareType with @UI.HeaderInfo: { TypeName: 'Hardware Type', TypeNamePlural: 'Hardware Types', Title: { Value: typeName } };
annotate makerspaceSrv.HardwareType with {
  ID @Common.Text: { $value: typeName, ![@UI.TextArrangement]: #TextOnly }
};
annotate makerspaceSrv.HardwareType with @UI.Identification: [{ Value: typeName }];
annotate makerspaceSrv.HardwareType with {
  typeName @title: 'Type Name'
};

annotate makerspaceSrv.HardwareType with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: typeName }
];

annotate makerspaceSrv.HardwareType with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: typeName }
  ]
};

annotate makerspaceSrv.HardwareType with {
  category @Common.Text: { $value: category.categoryName, ![@UI.TextArrangement]: #TextOnly }
};

annotate makerspaceSrv.HardwareType with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'HardwareInstance', Target : 'instances/@UI.LineItem' }
];

annotate makerspaceSrv.HardwareInstance with @UI.HeaderInfo: { TypeName: 'Hardware Instance', TypeNamePlural: 'Hardware Instances', Title: { Value: serialNumber } };
annotate makerspaceSrv.HardwareInstance with {
  ID @Common.Text: { $value: serialNumber, ![@UI.TextArrangement]: #TextOnly }
};
annotate makerspaceSrv.HardwareInstance with @UI.Identification: [{ Value: serialNumber }];
annotate makerspaceSrv.HardwareInstance with {
  serialNumber @title: 'Serial Number';
  storageLocation @title: 'Storage Location';
  acquisitionDate @title: 'Acquisition Date';
  acquisitionPrice @title: 'Acquisition Price';
  comments @title: 'Comments'
};

annotate makerspaceSrv.HardwareInstance with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: serialNumber },
    { $Type: 'UI.DataField', Value: storageLocation },
    { $Type: 'UI.DataField', Value: acquisitionDate },
    { $Type: 'UI.DataField', Value: acquisitionPrice },
    { $Type: 'UI.DataField', Value: comments },
    { $Type: 'UI.DataField', Label: 'Loan', Value: loan_ID }
];

annotate makerspaceSrv.HardwareInstance with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: serialNumber },
    { $Type: 'UI.DataField', Value: storageLocation },
    { $Type: 'UI.DataField', Value: acquisitionDate },
    { $Type: 'UI.DataField', Value: acquisitionPrice },
    { $Type: 'UI.DataField', Value: comments },
    { $Type: 'UI.DataField', Label: 'Loan', Value: loan_ID }
  ]
};

annotate makerspaceSrv.HardwareInstance with {
  type @Common.Text: { $value: type.typeName, ![@UI.TextArrangement]: #TextOnly };
  loan @Common.Text: { $value: loan.personName, ![@UI.TextArrangement]: #TextOnly }
};

annotate makerspaceSrv.HardwareInstance with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate makerspaceSrv.Loan with @UI.HeaderInfo: { TypeName: 'Loan', TypeNamePlural: 'Loans', Title: { Value: personName } };
annotate makerspaceSrv.Loan with {
  ID @Common.Text: { $value: personName, ![@UI.TextArrangement]: #TextOnly }
};
annotate makerspaceSrv.Loan with @UI.Identification: [{ Value: personName }];
annotate makerspaceSrv.Loan with {
  personName @title: 'Person Name';
  loanPeriod @title: 'Loan Period'
};

annotate makerspaceSrv.Loan with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: personName },
    { $Type: 'UI.DataField', Value: loanPeriod },
    { $Type: 'UI.DataField', Label: 'Hardware Instance', Value: hardwareInstance_ID }
];

annotate makerspaceSrv.Loan with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: personName },
    { $Type: 'UI.DataField', Value: loanPeriod },
    { $Type: 'UI.DataField', Label: 'Hardware Instance', Value: hardwareInstance_ID }
  ]
};

annotate makerspaceSrv.Loan with {
  hardwareInstance @Common.Text: { $value: hardwareInstance.serialNumber, ![@UI.TextArrangement]: #TextOnly }
};

annotate makerspaceSrv.Loan with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

