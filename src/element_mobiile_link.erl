-module(element_mobile_link).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

-export([
    reflect/0,
    transform_element/1
]).

reflect() -> record_info(fields, mobile_link).

transform_element(MLink = #mobile_link{data_fields=DataFields1, mobile_target=MobileTarget, mobile_dialog=MobileDialog}) ->
    DataFields2 = maybe_add_field(MobileTarget==false, {ajax, false}, DataFields1),
    DataFields3 = maybe_add_field(MobileDialog==true, {rel, dialog}, DataFields2),
    Link = wf_utils:fast_copy_fields(Link2, #link{}),
    Link#link{data_fields=DataFields3}.


maybe_add_field(_AddFields=true, ToAdd, DataFields) ->
    [ToAdd | DataFields];
maybe_add_field(_AddFields, _ToAdd, DataFields) ->
    DataFields.
    
    
