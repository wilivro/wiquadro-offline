;(function ($, window, document, undefined) {

    var pluginName = "mcg",
        defaults = {};

    function Plugin(element, options) {
        this.$element = $(element);
        this.options = $.extend({}, defaults, options);
        this.template = '<div class="mcg-container"><div class="mcg-menu-container"><ul class="mcg-menu"></ul></div><div class="mcg-description-container"></div></div>';
        this.init();
    }

    Plugin.prototype.init = function () {
        this.$element.after(this.template);

        var $container = this.$element.next('.mcg-container'),
            $menu = $container.find('.mcg-menu'),
            $descriptionContainer = $container.find('.mcg-description-container');

        $container.hide();
        $descriptionContainer.hide();

        $.when($.each(this.options, function (index, item) {
            var itemSelectedClass = '', checkboxChecked = '';

            item.class = item.class ? item.class : '';

            if (item.checked === true) {
                itemSelectedClass = 'mcg-menu-li-selected';
                checkboxChecked = 'checked="checked"';
            }

            $menu.append('<li class="' + itemSelectedClass + '" data-content="' + item.description + '">' + '<input type="checkbox" class="mcg-menu-checkbox ' + item.class + '" ' + checkboxChecked + ' value="' + item.id + '">' + item.title + '</li>');
        }))
            .done(function () {
                $menu
                    .on('mouseover', 'li', function () {
                        var $item = $(this),
                            title = $item.text(),
                            description = $item.data('content');

                        $descriptionContainer.html('<h1>' + title + '</h1><p>' + description + '</p>').show();
                    })
                    .on('mouseout', 'li', function () {
                        $descriptionContainer.hide();
                    })
                    .on('click', 'li', function () {
                        var $item = $(this),
                            $checkbox = $item.find('.mcg-menu-checkbox');

                        if (!$checkbox.prop('checked')) {
                            $checkbox.prop('checked', true).change();
                            $item.addClass('mcg-menu-li-selected');
                        } else {
                            $checkbox.prop('checked', false).change();
                            $item.removeClass('mcg-menu-li-selected');
                        }
                    });
            });

        this.$element.on('click', function (e) {
            e.preventDefault();

            $container.toggle();
        });

        var pos = this.$element.position(),
            elementHeight = this.$element.outerHeight();

        $container.css({
            position: 'absolute',
            top: (pos.top + elementHeight)  + 'px',
            left: (pos.left) + 'px'
        });
    };

    $.fn[pluginName] = function (options) {
        return this.each(function () {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" + pluginName,
                    new Plugin(this, options));
            }
        });
    };

})(jQuery, window, document);