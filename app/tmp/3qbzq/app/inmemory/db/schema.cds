namespace makerspace;

entity HardwareCategory {
  key ID: UUID;
  categoryName: String(200);
  hardwareTypes: Composition of many HardwareType on hardwareTypes.category = $self;
}

entity HardwareType {
  key ID: UUID;
  typeName: String(200);
  category: Association to HardwareCategory;
  instances: Composition of many HardwareInstance on instances.type = $self;
}

entity HardwareInstance {
  key ID: UUID;
  serialNumber: String(200);
  storageLocation: String(200);
  acquisitionDate: Date;
  acquisitionPrice: Decimal(10,2);
  comments: String(500);
  type: Association to HardwareType;
  loan: Association to Loan;
}

entity Loan {
  key ID: UUID;
  personName: String(200);
  loanPeriod: Integer;
  hardwareInstance: Association to HardwareInstance;
}

