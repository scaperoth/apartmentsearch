$(function() {

    $grid = $('#masonry-container').isotope({
        itemSelector: '.box',
        masonry: {
            // use outer width of grid-sizer for columnWidth
            columnWidth: 100,
            fitWidth: true
        },
        getSortData: {
            price: function(elem) {
                var price = $(elem).data('price');
                return parseFloat(price.replace(/[\(\)]/g, ''));
            },
            email: function(elem) {
                return $(elem).data('email-sent');
            },
            notes: function(elem) {
                return $(elem).data('has-notes');
            },
            viewingDate: function(elem) {
                return Date.parse($(elem).data('viewing-date'));
            }
        }
    });

    // sort items on button click
    $('.sort-by-btn-group').on('click', 'button', function() {
        var sortByValue = $(this).attr('data-sort-by');
        $grid.isotope({
            sortBy: sortByValue
        });
    });


    // filter items on button click
    $('.filter-btn-group').on('click', 'button', function() {
        var filterValue = $(this).attr('data-filter');
        $grid.isotope({
            filter: filterValue
        });
    });

    $('[data-toggle="tooltip"]').tooltip();
});