using app.interactions from '../db/interactions';
using {sap} from '@sap/cds-common-content';

service CatalogService {

@requires           : 'authenticated-user'
@cds.redirection.target
@odata.draft.enabled: true
@restrict: [
{ grant: 'READ', to: 'Test',where: 'country_code in $user.country_code'}
]
entity Interactions_Header as projection on interactions.Headers;

// @requires           : 'authenticated-user'
// @cds.redirection.target
// @odata.draft.enabled: true
// // @restrict: [
// // { grant: 'READ', to: 'Admin' },
// // { grant: 'READ', to: 'Test', where: ' country_code = $user.country_code' }
// // ]
// entity Interactions_Header as projection on interactions.Headers;


@requires: 'Admin'
entity Interactions_Items  as projection on interactions.Items;

@requires: 'Test'
entity Languages           as projection on sap.common.Languages;

@readonly
entity HeaderView as projection on interactions.Headers;

}
