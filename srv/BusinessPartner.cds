using {API_BUSINESS_PARTNER as external} from './external/API_BUSINESS_PARTNER';


service BusinessPartnerService {

    @odata.draft.enabled
    entity A_BusinessPartner as projection on external.A_BusinessPartner;

}
