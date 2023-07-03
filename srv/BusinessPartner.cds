using {remote} from '../db/schema';

service BusinessPartnerService {

    @odata.draft.enabled
    entity A_BusinessPartner as projection on remote.A_BusinessPartner;

}
