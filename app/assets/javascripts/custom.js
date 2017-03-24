$(function() {

    $grid = $('#masonry-container').isotope({
        itemSelector: '.box',
        masonry: {
            // use outer width of grid-sizer for columnWidth
            columnWidth: 10,
            gutter: 1
        },
        getSortData: {
            price: function(elem) {
                var price = $(elem).data('price');
                return parseFloat(price.replace(/[\(\)]/g, ''));
            },
            sqft: '[data-sqft]',
            price_per_sqft: '[data-price-per-sqft]',
            email: '[data-email-sent]',
            notes: '[data-has-notes]',
            viewingDate: '[data-viewing-date]',
            status: '[data-status]',
        },
        sortBy: ['status', 'price_per_sqft'],
        sortAscending: {
            price_per_sqft: true
        }
    });


    // sort items on button click
    $('.sort-by-btn-group').on('click', 'button', function() {
        var sortByValue = $(this).attr('data-sort-by');
        if (sortByValue == 'original-order') {
            $grid.isotope({
                sortBy: ['status', 'price_per_sqft']
            });
        } else {
            $grid.isotope({
                sortBy: sortByValue
            });
        }
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