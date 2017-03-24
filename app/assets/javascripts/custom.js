$(function() {

    $grid = $('#masonry-container').isotope({
        itemSelector: '.box',
        masonry: {
            // use outer width of grid-sizer for columnWidth
            columnWidth: 10,
            gutter: 10
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
            original_order: '[data-status]'
        },
        sortBy: 'original_order'
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