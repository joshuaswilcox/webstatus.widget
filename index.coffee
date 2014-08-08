#command: 'source $HOME/.bash_profile && ./webstatus.widget/script.sh'
command: 'source $HOME/.bash_profile && ruby ./webstatus.widget/webstatus.rb'

refreshFrequency: 360000

style: """
  top: 10px
  right: 50px
  font-family: Helvetica Neue
  text-align:right

  .circle
    width:50px
    height:50px
    border-radius:25px
    font-size:18px
    color:#fff
    line-height:50px
    text-align:center
    background:#000
    opacity: .8

  .up
    background: green

  .down
    background: red
"""
render: -> """
  <div class="status"></div>
"""
update: (output, domEl) ->
  container = $(domEl).find('.status')
  $.each JSON.parse(output), (idx, obj) ->
    if obj.code == '200'
      status = 'up'
    else
      status = 'down'

    container.append "<div class='node'><div class='circle #{status}'>#{obj.code}</div>#{obj.url}</div>"
    return
