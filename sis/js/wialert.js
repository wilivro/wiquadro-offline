var WiAlert = function(type, message, config){
    "use strict";
    
    config = config || {};

    var c = {
        message: '<p>' + message + '</p>',
        layout: 'bar',
        effect: 'slidetop',
        type: type // notice, warning or error
    };

    var mergeObjects = function()
    {
        var o = {};

        for(var i = arguments.length - 1;i >= 0; i--)
        {
            var s = arguments[i];

            for(var k in s)
            {
                if(s.hasOwnProperty(k))
                {
                    o[k] = s[k];
                }
            }
        }

        return o;
    };
    if (typeof NotificationFx == 'function')
    {
        var notification = new NotificationFx(mergeObjects(config, c));
            notification.show();
    }
    else
    {
        alert(message);
    }
    
};