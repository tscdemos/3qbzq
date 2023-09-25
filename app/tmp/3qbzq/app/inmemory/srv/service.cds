using { makerspace } from '../db/schema.cds';

service makerspaceSrv {
  entity HardwareCategory as projection on makerspace.HardwareCategory;
  entity Loan as projection on makerspace.Loan;
}