-include_lib("nitrogen_core/include/wf.hrl").


-type mobile_theme()        :: string() | binary() | atom().

-record(toggle_mobile_panel, {?ACTION_BASE(action_toggle_mobile_panel)}).

%% Mobile Shortcut elements
-record(mobile_list, {?ELEMENT_BASE(element_mobile_list),
        body=[]                 :: body(),
        theme                   :: mobile_theme(),
        inset=true              :: boolean()
     }).
-record(mobile_list_divider, {?ELEMENT_BASE(element_mobile_list_divider),
        theme                   :: mobile_theme(),
        text=""                 :: text(),
        body=[]                 :: body(),
        role=heading            :: atom() | string()
     }).
-record(mobile_listitem, {?ELEMENT_BASE(element_mobile_listitem),
        text=""                 :: text(),
        body=[]                 :: body(),
        theme=""                :: atom() | string()
    }).
-record(mobile_toggle, {?ELEMENT_BASE(element_mobile_toggle),
        on_text="On"            :: text(),
        on_value="on"           :: text(),
        off_text="Off"          :: text(),
        off_value="off"         :: text(),
        selected="on"           :: atom() | text(),
        postback                :: term(),
        handle_invalid=false    :: boolean(),
        on_invalid              :: undefined | actions(),
        delegate                :: module(),
        width                   :: integer() | undefined,
        theme=""                :: mobile_theme()
    }).
-record(mobile_collapsible, {?ELEMENT_BASE(element_mobile_collapsible),
        header_theme            :: mobile_theme(),
        content_theme           :: mobile_theme(),
        header_text=""          :: text(),
        content_body=[]         :: body(),
        content_text=""         :: text(),
        header_size=3           :: integer(),
        mini=false              :: boolean(),
        collapsed=true          :: boolean()
    }).
-record(mobile_collapsible_set, {?ELEMENT_BASE(element_mobile_collapsible_set),
        header_theme            :: mobile_theme(),
        content_theme           :: mobile_theme(),
        mini=false              :: boolean(),
        body=[]                 :: body()
    }).
-record(mobile_grid_block, {?ELEMENT_BASE(element_mobile_grid_block),
        text=""                 :: text(),
        body=[]                 :: body(),
        new_row=default         :: atom()
    }).
-record(mobile_grid, {?ELEMENT_BASE(element_mobile_grid),
        columns=2               :: integer(),
        blocks=[]               :: [#mobile_grid_block{}]
    }).
-record(mobile_panel, {?ELEMENT_BASE(element_mobile_panel),
        mini=false              :: boolean(),
        position=left           :: left | right,
        dismissible=true        :: boolean(),
        theme                   :: mobile_theme(),
        display_mode=reveal     :: reveal | overlay | push,
        body=[]                 :: body()
    }).

%% In Nitrogen 3, the mobile_target and mobile_dialog functionality was removed from #link,
%% so this adds those attributes to a new element called #mobile_link
?WF_EXTEND(link, mobile_link, element_mobile_link, [
    {mobile_target, false, "boolean()"},
    {mobile_dialog, false, "boolean()"}
]).
