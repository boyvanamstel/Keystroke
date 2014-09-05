class window.DCOKeystroke
  @_element = null
  @_sentence = null
  @_prev_char = null
  @_interval = null
  @_delay = 0
  constructor: (element, delay) ->
    # Store element
    @_element = element
    @_delay = if delay > 0 then delay else 500
  clear: ->
    while @_element.firstChild
      @_element.removeChild(@_element.firstChild)
  stop: ->
    clearInterval(@_interval)
    @_interval = null
    @_buffer = null
    @_sentence = null
  read: ->
    char = @_sentence[0]
    @_sentence.shift()
    if char == "\n"
      @put("new-line", "")
    else if char == "\r"
      # carriage return
      @put("carriage-return", "&nbsp;")
    else if char == "\t"
      # tab
      @put("tab", "&nbsp;")
    else if char == "\b"
      # tab
      @put("backspace", "&nbsp;")
    else if char == "[" and @_prev_char != "\\"
      # Get buffer
      buffer = ""
      loop
        new_char = @_sentence[0]
        buffer += new_char unless new_char == "]"
        @_sentence.shift()
        break if @_sentence.length <= 0 || new_char == "]"
      escaped_buffer = buffer.replace(" ", "_")
      @put(escaped_buffer, escaped_buffer)
    else if char == " "
      @put("space", "&nbsp;")
    else
      @put(char, char)
    @stop() if @_sentence.length is 0
    @_prev_char = char
  put: (css, char) ->
    element = document.createElement('span')
    element.className = "char-" + css
    element.innerHTML = char

    end = (e) ->
      @.classList.add('ended')

    element.addEventListener("animationend", end, false);
    element.addEventListener("mozAnimationEnd", end, false);
    element.addEventListener("webkitAnimationEnd", end, false);
    element.addEventListener("msAnimationEnd", end, false);

    @_element.appendChild(element)
  type: (sentence, delay) ->
    @clear()
    @_sentence = sentence.split("")
    callback = @read.bind(@) # Retain correct 'this'
    @_interval = setInterval(callback, if delay > 0 then delay else @_delay);    