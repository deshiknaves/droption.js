jQuery ($) ->
    $.fn.droption = (options) ->
        $select = $(this)
        droption = new Droption
        droption.initialize($select, options.select)

    class Droption

        constructor: (@select, @label, @arrow, @options, @input, @wrap) ->

        initialize: (select, input) ->
            @select = select
            @input = $(input)
            @input.hide()

            # Insert the right arrow and select arrow
            @select.append('<div class="label-wrapper" />')
                .children()
                .append('<span class="label-wrap"><span class="label" /></span>')

            @wrap = @select.find('.label-wrap').append('<span class="arrow" />')
            @label = @select.find('.label')
            @arrow = @select.find('.arrow')

            @select.append('<div class="select-options" />')
            @options = @select.find('.select-options')

            # Get the selected option
            text = @input.find('option:selected').text()
            @label.text(text)

            @options.append('<div class="options-wrapper" />')
            @options.hide()
            $options = @options.find('.options-wrapper')
            # For each option, enter the options
            @input.find('option').each((i, item) ->
                $item = $(item)
                val = $item.val()
                text = $item.text()
                first = ''
                if i == 0
                    first = ' first" '

                $options.append('<span class="option'+first+'" data-value="'+val+'">'+text+'</span>')
            )
            $options = null

            # Add the click event, pass the object so we can have the cached
            # elements
            @arrow.on('click', {object: @}, @showOptions)
            @options.find('.option').on('click', {object: @}, @selectOption)

        showOptions: (e) ->
            e.stopPropagation()
            droption = e.data.object

            $(document).unbind('click')

            # If it's not the same droption, then we need to hide the others
            if not droption.options.is(':visible')
                # Hide all the others
                $('.droption .select-options').hide()
                $('.droption .label-wrap').removeClass('open')
                

            # Show this droption
            droption.options.toggle()

            # Don't bind the click event if it's already visible
            if droption.options.is(':visible')
                droption.wrap.addClass('open')
                $(document).bind('click', {object: droption}, droption.hideOptions)
            else 
                droption.wrap.removeClass('open')


        hideOptions: (e) ->
            droption = e.data.object
            droption.options.toggle()
            droption.wrap.removeClass('open')
            $(document).unbind('click')

        selectOption: (e) ->
            $self = $(this)
            droption = e.data.object
            val = $self.data('value')
            text = $self.text()
            
            # Set the value of the select to 
            droption.input.val(val)
            droption.label.text(text)



    $('.select-list').droption({ select: '.the-select' })
    $('.select-list-2').droption({ select: '.the-select-2' })