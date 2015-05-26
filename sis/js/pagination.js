/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var Pagination;

$(document).ready(function()
{
    Pagination = (function()
    {
        var $grids = null;
        
        var verifyIsExistGridView = function()
        {
            if($('div.grid-view').length > 0)
            {
                $grids = $('div.grid-view');
                return true;
            }
            return false;
        },
        
        getUrl = function()
        {
            var url = window.location.href;
            
            if(url[url.length - 1] === '/')
                url = url.substr(0, url.length - 1);
            
            return url;
        },
        
        savePage = function(grid, page)
        {
            var url = getUrl()+'-'+grid;
            
            window.sessionStorage[url] = page;
        },
        
        getPage = function(grid)
        {
            var url = getUrl()+'-'+grid;
            return window.sessionStorage[url];
        },
        
        initGrids = function()
        {
            $grids.each(function()
            {
                var grid = $(this).attr('id'), page = getPage(grid);
               
                if(!page)
                    return true;
                
                updateGrid(grid, page);
            });
        },
        
        updateGrid = function(grid, page)
        {
            $.fn.yiiGridView.update(grid, {url: page});
        };
        
        
        return {
            init: function()
            {
                if(!verifyIsExistGridView())
                    return false;
                
                $('body').on('click', 'div.grid-view li.page > a', function()
                {
                    var element = $(this), grid = element.closest('div.grid-view').attr('id'), page = element.attr('href');
                    savePage(grid, page);
                });
                
                initGrids();
            }
        };
    })();
       
    Pagination.init();
});