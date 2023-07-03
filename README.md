# CDSX Demo

## 1. Create CAP project

- Run CLI commands below:

```shell
# initialize CAP project
> cds init
# initialize git
> git init
# install dependencies
> npm install
```

## 2. Add external service

- Import an EDMX file generated from an S/4HANA OData Service, here we are using [API_BUSINESS_PARTNER.xml](template/API_BUSINESS_PARTNER.xml). Copy the file from [template](template) folder to your project folder, then execute the command below:

```shell
> cds import API_BUSINESS_PARTNER.xml
```

## 3. Create CDS models and annotations

- Create the service model `BusinessPartner.cds`

```sql
using {API_BUSINESS_PARTNER as external} from './external/API_BUSINESS_PARTNER';


service BusinessPartnerService {

    entity A_BusinessPartner as projection on external.A_BusinessPartner;

}
```

- Create the annotations `annotations.cds`

```sql
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
```

- [Optional] Copy the [_i18n/i18n.properties](_i18n/i18n.properties) of this project to your own project.

- Test the app using `Fiori Preview`