$(document).on "keyup", "input.choose_place", (_.debounce ->
  unless $(@).attr("data-last-value") == @value
    if @value.length == 0
      $("#results").html("")
    else
      q = encodeURIComponent(@value)
      $(".spinner").show()
      $.get("/api/places?q="+q, (result) ->
        $("#results").html HandlebarsTemplates['places/list'](result)
        $(".spinner").hide()
      )
    $(@).attr("data-last-value", @value)
    false
)

window.select_object = (obj, name, path, val, args...) ->
  placeFormatResult = (place) ->
    "#{place.display_name}"

  placeFormatSelection = (place) ->
    place.display_name

  $(obj).select2
    minimumInputLength: 0
    ajax:
      url: path
      data: (term, page) ->
        q: term
        query: args[0]
      results: (data, page) ->
        {results:data}
    formatResult: placeFormatResult
    formatSelection: placeFormatSelection
    escapeMarkup: (m) ->
      m

  $(obj).on "change", (e) ->
    val(e.val)

  if name
    display_name_class = "#s2id_#{obj[1..obj.length]} .select2-choice span"
    $(display_name_class).text(name)


