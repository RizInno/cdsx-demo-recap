using BusinessPartnerService as service from './BusinessPartner';

annotate service.A_BusinessPartner with @(
    Capabilities: {DeleteRestrictions: {Deletable: false}},
    UI          : {
        SelectionFields               : [
            BusinessPartnerCategory,
            BusinessPartnerType
        ],
        HeaderInfo                    : {
            TypeName      : '{i18n>businessPartner}',
            TypeNamePlural: '{i18n>businessPartners}',
            ImageUrl      : 'sap-icon://supplier',
            Title         : {Value: BusinessPartnerFullName},
            Description   : {Value: BusinessPartner}
        },
        LineItem                      : [
            {Value: BusinessPartner},
            {Value: BusinessPartnerFullName},
            {Value: BusinessPartnerCategory},
            {Value: BusinessPartnerType},
            {Value: Customer},
            {Value: Supplier},
            {Value: CreatedByUser},
            {Value: CreationDate},
            {Value: LastChangedByUser},
            {Value: LastChangeDate}
        ],
        Facets                        : [{
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#GeneralInformation',
            Label : '{i18n>generalInformation}'
        }],
        FieldGroup #GeneralInformation: {Data: [
            {Value: FirstName},
            {Value: MiddleName},
            {Value: LastName},
            {Value: BusinessPartnerCategory},
            {Value: BusinessPartnerType},
            {Value: Customer},
            {Value: Supplier}
        ]}
    }
) {
    BusinessPartner         @title: '{i18n>id}';
    BusinessPartnerFullName @title: '{i18n>businessPartner}';
    BusinessPartnerCategory @title: '{i18n>category}';
    BusinessPartnerType     @title: '{i18n>type}';
    Customer                @title: '{i18n>customer}';
    Supplier                @title: '{i18n>supplier}';
    CreatedByUser           @title: '{i18n>createdBy}';
    CreationDate            @title: '{i18n>createdAt}';
    LastChangedByUser       @title: '{i18n>modifiedBy}';
    LastChangeDate          @title: '{i18n>modifiedAt}';
    FirstName               @title: '{i18n>firstName}';
    MiddleName              @title: '{i18n>middleName}';
    LastName                @title: '{i18n>lastName}';
    BusinessPartnerUUID     @UI   : {Hidden};
    CreationTime            @UI   : {Hidden};
    LastChangeTime          @UI   : {Hidden};
    ETag                    @UI   : {Hidden};
};
