var dom = {};
dom.query = jQuery.noConflict(true);
dom.query(function () {
    dom.query("#accordion > div.accordionable").accordion({
        class: "kpiheader",
        heightStyle: "content",
        //active: "false",
        overflow: "auto",
        collapsible: true,
        animate: 200
    });
});