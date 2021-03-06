/*
 * @copyright Copyright (c) 2018 Julius Härtl <jus@bitgrid.net>
 *
 * @author Julius Härtl <jus@bitgrid.net>
 *
 * @license GNU AGPL version 3 or any later version
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as
 *  published by the Free Software Foundation, either version 3 of the
 *  License, or (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program. If not, see <http://www.gnu.org/licenses/>.
 *
 */

window.addEventListener('DOMContentLoaded', function () {
    document.getElementById('header').remove();
    var content = document.getElementById('content');
    content.style.paddingTop = '0%';
    content.style.height = '100%';
    document.querySelector('footer').remove();
    setTimeout(() => {
        var iframe = document.getElementsByTagName("iframe")[0];
        var iframeDoc = iframe.contentWindow.document;
        var printButton = iframeDoc.getElementById("print");
        var presentationButton = iframeDoc.getElementById("presentationMode");
        if(printButton) {
            printButton.remove();
        }
        if(presentationButton){
            presentationButton.remove();
        }
    }, 2000)


    $('#body-public').find('.header-right .menutoggle').click(function() {
        $(this).next('.popovermenu').toggleClass('open');
    });

    $('#save-external-share').click(function () {
        $('#external-share-menu-item').toggleClass('hidden')
        $('#remote_address').focus();
    });
});

$(document).mouseup(function(e) {
    var toggle = $('#body-public').find('.header-right .menutoggle');
    var container = toggle.next('.popovermenu');

    // if the target of the click isn't the menu toggle, nor a descendant of the
    // menu toggle, nor the container nor a descendant of the container
    if (!toggle.is(e.target) && toggle.has(e.target).length === 0 &&
        !container.is(e.target) && container.has(e.target).length === 0) {
        container.removeClass('open');
    }
});
