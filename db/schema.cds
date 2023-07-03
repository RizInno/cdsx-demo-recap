context remote {

    @cdsx.api: 'API_BUSINESS_PARTNER'
    entity A_BusinessPartner {
            @cdsx.object.key
        key BusinessPartner         : String(10);
            Customer                : String(10);
            Supplier                : String(10);

            @mandatory
            BusinessPartnerCategory : String(1);
            BusinessPartnerFullName : String(81);
            BusinessPartnerUUID     : UUID;
            FirstName               : String(40);
            MiddleName              : String(40);

            @mandatory
            LastName                : String(40);
            BusinessPartnerType     : String(4);
            ETag                    : String(26);
            CreatedByUser           : String(12);
            CreationDate            : Date;
            CreationTime            : Time;
            LastChangedByUser       : String(12);
            LastChangeDate          : Date;
            LastChangeTime          : Time;
    }

}
