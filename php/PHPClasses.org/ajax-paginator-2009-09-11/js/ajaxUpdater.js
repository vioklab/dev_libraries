// ajax updater

AjaxUpdater = {};

AjaxUpdater.initialize = function()
{
    AjaxUpdater.isUpdating = false;
}
AjaxUpdater.initialize();


AjaxUpdater.Update = function(method, url, params, callback)
{
    if(callback == undefined || callback == "") { callback = AjaxUpdater.onResponse; }
    Ajax.makeRequest(method, url, params, callback);
    AjaxUpdater.isUpdating = true;
}
// the default response callback function
AjaxUpdater.onResponse = function()
{
    if(Ajax.checkReadyState('loading') == 200)
    {
		// now its ready so it's not updating
        AjaxUpdater.isUpdating = false;
    }
}
