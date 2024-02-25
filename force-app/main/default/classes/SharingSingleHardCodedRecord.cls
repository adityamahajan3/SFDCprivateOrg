public class SharingSingleHardCodedRecord {
    public static void sharingSingleHardCodedRecordWithHardCodedUser() {
        Id kaneNable ='a0N5h00000EcPghEAF';
        Id userId= '0055h00000BsVmwAAF';
        Book__Share shareWithEmp1 = new Book__Share(ParentId = kaneNable, UserOrGroupId = userId, AccessLevel = 'Read');
        insert shareWithEmp1;
    }
    public static void deletingSingleHardCodedRecordWithHardCodedUser(){
        Id kaneNable ='a0N5h00000EcPghEAF';
        Id userId= '0055h00000BsVmwAAF';
        Book__Share bookshareId = [SELECT Id FROM Book__Share WHERE ParentId = :kaneNable AND UserOrGroupId = :userId ];
        delete bookshareId;
    }
}

/*
SharingSingleHardCodedRecord.sharingSingleHardCodedRecordWithHardCodedUser();
SharingSingleHardCodedRecord.deletingSingleHardCodedRecordWithHardCodedUser();
*/